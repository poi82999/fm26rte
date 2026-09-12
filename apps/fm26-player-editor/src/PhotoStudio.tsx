import { useCallback, useEffect, useMemo, useRef, useState } from 'react'
import { invoke } from '@tauri-apps/api/core'
import {
  Camera,
  CircleAlert,
  Copy,
  Download,
  FolderOpen,
  Loader2,
  Shirt,
  Trash2,
  UserRound,
  Wand2,
} from 'lucide-react'

// App.tsx의 동명 타입과 구조가 같다. 구조적 타이핑이라 그대로 맞물린다.
type ClubIdentity = {
  inputId: number
  name: string
  nation?: string | null
  squadLabel: string
  playerCount: number
}

type StudioPlayer = {
  uid: number
  name?: string | null
  position: string
  squadLabel: string
  age?: number | null
  nation?: string | null
  heightCm?: number | null
  weightKg?: number | null
  foot: string
}

type StudioSquad = {
  teamName: string
  playerCount: number
  players: StudioPlayer[]
}

type KitReference = {
  slot: string
  path: string
  fileName: string
  dataUri: string
}

type StudioState = {
  root: string
  kitField?: KitReference | null
  kitKeeper?: KitReference | null
  generatedUids: number[]
}

type PortraitPrompt = {
  uid: number
  name?: string | null
  prompt: string
  hasFace: boolean
  isKeeper: boolean
}

type ExportResult = {
  folder: string
  playerCount: number
  faceCount: number
  missingFaceUids: number[]
}

type Framing = 'upper' | 'full' | 'cutout'
type Language = 'ko' | 'en'

const SQUAD_KINDS = ['1군', '전체', '2군 / B팀', 'U21', 'U19 / U18'] as const

const FRAMING_LABELS: Record<Framing, string> = {
  upper: '상반신',
  full: '전신',
  cutout: '배경 없는 컷아웃',
}

/** File → base64 (data URI 접두사 없이). 큰 파일에서 스택이 터지지 않게 잘라서 넣는다. */
async function fileToBase64(file: File): Promise<string> {
  const bytes = new Uint8Array(await file.arrayBuffer())
  let binary = ''
  const chunk = 0x8000
  for (let offset = 0; offset < bytes.length; offset += chunk) {
    binary += String.fromCharCode(...bytes.subarray(offset, offset + chunk))
  }
  return btoa(binary)
}

async function copyText(text: string): Promise<boolean> {
  try {
    await navigator.clipboard.writeText(text)
    return true
  } catch {
    // 클립보드 API가 막힌 환경 대비.
    try {
      const area = document.createElement('textarea')
      area.value = text
      area.style.position = 'fixed'
      area.style.opacity = '0'
      document.body.appendChild(area)
      area.select()
      const ok = document.execCommand('copy')
      document.body.removeChild(area)
      return ok
    } catch {
      return false
    }
  }
}

function exportLabel(): string {
  const now = new Date()
  const pad = (value: number) => String(value).padStart(2, '0')
  return `${now.getFullYear()}${pad(now.getMonth() + 1)}${pad(now.getDate())}-${pad(now.getHours())}${pad(now.getMinutes())}`
}

/** 카드 1장의 이미지. 생성본이 있으면 그것, 없으면 페이스팩 얼굴. */
function StudioPortrait({ uid, version }: { uid: number; version: number }) {
  const [state, setState] = useState<{ src: string; kind: string }>({ src: '', kind: 'none' })

  useEffect(() => {
    let active = true
    invoke<{ src: string | null; kind: string }>('read_player_portrait', { uid })
      .then((result) => {
        if (active) setState({ src: result.src ?? '', kind: result.kind })
      })
      .catch(() => {
        if (active) setState({ src: '', kind: 'none' })
      })
    return () => {
      active = false
    }
  }, [uid, version])

  return (
    <div className={`studio-portrait ${state.kind}`}>
      {state.src ? <img src={state.src} alt="" /> : <UserRound size={34} />}
      {state.kind === 'generated' && <span className="studio-portrait-badge">생성</span>}
    </div>
  )
}

export default function PhotoStudio({
  connected,
  club,
}: {
  connected: boolean
  club: ClubIdentity | null
}) {
  const [squadKind, setSquadKind] = useState<string>('1군')
  const [squad, setSquad] = useState<StudioSquad | null>(null)
  const [studio, setStudio] = useState<StudioState | null>(null)
  const [prompts, setPrompts] = useState<PortraitPrompt[]>([])
  const [framing, setFraming] = useState<Framing>('upper')
  const [language, setLanguage] = useState<Language>('ko')
  const [kitNote, setKitNote] = useState('')
  const [activeUid, setActiveUid] = useState<number | null>(null)
  const [versions, setVersions] = useState<Record<number, number>>({})
  const [busy, setBusy] = useState(false)
  const [error, setError] = useState<string | null>(null)
  const [status, setStatus] = useState(
    connected
      ? '스쿼드를 불러온 뒤 유니폼 참조 이미지를 등록하세요.'
      : '불러올 때 자동으로 fm.exe에 연결합니다.',
  )
  const [exported, setExported] = useState<ExportResult | null>(null)
  const resultInputRef = useRef<HTMLInputElement | null>(null)
  const pendingDropUid = useRef<number | null>(null)

  const clubName = squad?.teamName ?? club?.name ?? ''
  const promptByUid = useMemo(() => {
    const map = new Map<number, PortraitPrompt>()
    for (const prompt of prompts) map.set(prompt.uid, prompt)
    return map
  }, [prompts])

  const activePrompt = activeUid != null ? promptByUid.get(activeUid) ?? null : null
  const activePlayer = activeUid != null ? squad?.players.find((p) => p.uid === activeUid) ?? null : null

  const refreshStudio = useCallback(async () => {
    try {
      setStudio(await invoke<StudioState>('studio_state'))
    } catch (err) {
      setError(String(err))
    }
  }, [])

  useEffect(() => {
    let active = true
    invoke<StudioState>('studio_state')
      .then((result) => {
        if (active) setStudio(result)
      })
      .catch((err) => {
        if (active) setError(String(err))
      })
    return () => {
      active = false
    }
  }, [])

  const buildRequest = useCallback(
    (players: StudioPlayer[]) => ({
      clubName: clubName || '우리 구단',
      kitNote,
      framing,
      language,
      hasFieldKit: Boolean(studio?.kitField),
      hasKeeperKit: Boolean(studio?.kitKeeper),
      players: players.map((player) => ({
        uid: player.uid,
        name: player.name ?? null,
        position: player.position,
        squadLabel: player.squadLabel,
        age: player.age ?? null,
        nation: player.nation ?? null,
        heightCm: player.heightCm ?? null,
        weightKg: player.weightKg ?? null,
        foot: player.foot,
      })),
    }),
    [clubName, framing, kitNote, language, studio],
  )

  // 스쿼드·킷·연출 옵션이 바뀌면 프롬프트를 다시 만든다. 메모리 접근이 아니라 문자열 조립이라 싸다.
  useEffect(() => {
    if (!squad || squad.players.length === 0) return
    let active = true
    invoke<PortraitPrompt[]>('build_portrait_prompts', { request: buildRequest(squad.players) })
      .then((result) => {
        if (active) setPrompts(result)
      })
      .catch((err) => {
        if (active) setError(String(err))
      })
    return () => {
      active = false
    }
  }, [squad, buildRequest])

  const loadSquad = async () => {
    if (!club) {
      setError('먼저 접속 화면에서 내 구단을 확인하세요.')
      return
    }
    setBusy(true)
    setError(null)
    setExported(null)
    setPrompts([])
    setStatus('fm.exe 연결 및 스쿼드 조회 중...')
    try {
      await invoke('connect_fm')
      const result = await invoke<StudioSquad>('analyze_squad', {
        clubId: club.inputId,
        squadKind,
      })
      setSquad(result)
      setActiveUid(result.players[0]?.uid ?? null)
      setStatus(`${result.teamName} ${squadKind} · 선수 ${result.players.length}명을 불러왔습니다.`)
    } catch (err) {
      setError(String(err))
      setStatus('스쿼드 조회 실패.')
    } finally {
      setBusy(false)
    }
  }

  const uploadKit = async (slot: 'field' | 'keeper', file: File) => {
    setBusy(true)
    setError(null)
    try {
      await invoke<KitReference>('save_kit_reference', {
        slot,
        fileName: file.name,
        dataBase64: await fileToBase64(file),
      })
      await refreshStudio()
      setStatus(`${slot === 'field' ? '필드' : '골키퍼'} 유니폼 참조 이미지를 등록했습니다.`)
    } catch (err) {
      setError(String(err))
    } finally {
      setBusy(false)
    }
  }

  const removeKit = async (slot: 'field' | 'keeper') => {
    try {
      await invoke('clear_kit_reference', { slot })
      await refreshStudio()
    } catch (err) {
      setError(String(err))
    }
  }

  const bumpVersion = (uid: number) =>
    setVersions((prev) => ({ ...prev, [uid]: (prev[uid] ?? 0) + 1 }))

  const saveResult = useCallback(
    async (uid: number, file: File) => {
      setError(null)
      try {
        await invoke<string>('save_generated_portrait', {
          uid,
          dataBase64: await fileToBase64(file),
        })
        bumpVersion(uid)
        await refreshStudio()
        setStatus(`UID ${uid} 생성 이미지를 저장했습니다. 이제 얼굴 대신 이 이미지가 표시됩니다.`)
      } catch (err) {
        setError(String(err))
      }
    },
    [refreshStudio],
  )

  const dropResult = async (uid: number, event: React.DragEvent) => {
    event.preventDefault()
    const file = event.dataTransfer.files?.[0]
    if (file) await saveResult(uid, file)
  }

  const removeResult = async (uid: number) => {
    try {
      await invoke('delete_generated_portrait', { uid })
      bumpVersion(uid)
      await refreshStudio()
      setStatus(`UID ${uid} 생성 이미지를 지우고 원래 얼굴로 되돌렸습니다.`)
    } catch (err) {
      setError(String(err))
    }
  }

  // 붙여넣기로 결과 이미지를 넣는다. 챗봇에서 이미지 복사 → 카드 선택 → Ctrl+V.
  useEffect(() => {
    if (activeUid == null) return
    const onPaste = (event: ClipboardEvent) => {
      const item = Array.from(event.clipboardData?.items ?? []).find((entry) =>
        entry.type.startsWith('image/'),
      )
      const file = item?.getAsFile()
      if (file) {
        event.preventDefault()
        saveResult(activeUid, file)
      }
    }
    window.addEventListener('paste', onPaste)
    return () => window.removeEventListener('paste', onPaste)
  }, [activeUid, saveResult])

  const runExport = async (players: StudioPlayer[], note: string) => {
    if (players.length === 0) {
      setError('내보낼 선수가 없습니다.')
      return
    }
    setBusy(true)
    setError(null)
    setStatus(`${note} 내보내는 중...`)
    try {
      const result = await invoke<ExportResult>('export_portrait_prompts', {
        request: buildRequest(players),
        label: exportLabel(),
      })
      setExported(result)
      setStatus(
        `${result.playerCount}명 내보냄 · 얼굴 ${result.faceCount}장 첨부${
          result.missingFaceUids.length > 0 ? ` · 얼굴 없음 ${result.missingFaceUids.length}명` : ''
        }`,
      )
    } catch (err) {
      setError(String(err))
      setStatus('내보내기 실패.')
    } finally {
      setBusy(false)
    }
  }

  const openFolder = async (path: string) => {
    try {
      await invoke('open_studio_path', { path })
    } catch (err) {
      setError(String(err))
    }
  }

  const copyPrompt = async (prompt: PortraitPrompt) => {
    const ok = await copyText(prompt.prompt)
    setStatus(
      ok
        ? `${prompt.name ?? `UID ${prompt.uid}`} 프롬프트를 복사했습니다.${
            prompt.hasFace ? ' 얼굴 이미지와 유니폼 참조를 함께 첨부하세요.' : ' (얼굴 참조 없음)'
          }`
        : '클립보드 복사에 실패했습니다.',
    )
  }

  const generatedCount = studio?.generatedUids.length ?? 0
  const squadGenerated = squad
    ? squad.players.filter((player) => studio?.generatedUids.includes(player.uid)).length
    : 0
  const missingFaces = prompts.filter((prompt) => !prompt.hasFace).length

  return (
    <section className="studio-workspace">
      <header className="page-title">
        <div>
          <h2>포토 스튜디오</h2>
        </div>
        <span>
          내 구단 선수단을 페이스팩 얼굴 대신 구단 유니폼을 입은 실사 인물 사진으로 바꿉니다. 앱은
          선수의 나이·체격·포지션과 얼굴 참조를 묶어 생성 프롬프트를 만들고, 구독형 모델에서 받은
          결과물을 다시 카드에 붙여 넣습니다.
        </span>
      </header>

      <div className="studio-controls">
        <div className="studio-club">
          <span>내 구단</span>
          <strong>{club ? club.name : '미확인'}</strong>
          <small>{club ? `ID ${club.inputId}` : '접속 화면에서 구단을 확인하세요.'}</small>
        </div>

        <label>
          <span>선수단</span>
          <select value={squadKind} onChange={(event) => setSquadKind(event.target.value)}>
            {SQUAD_KINDS.map((kind) => (
              <option key={kind} value={kind}>
                {kind}
              </option>
            ))}
          </select>
        </label>

        <button type="button" className="primary-action" disabled={busy || !club} onClick={loadSquad}>
          {busy ? <Loader2 size={17} className="spin" /> : <Camera size={17} />}
          스쿼드 불러오기
        </button>

        <div className="scan-note">{status}</div>
      </div>

      {error && <div className="analyst-error">{error}</div>}

      <div className="studio-kit-row">
        <KitSlot
          slot="field"
          title="필드 유니폼 참조"
          hint="선수단 사진에 입힐 킷. FM 킷 화면 캡처나 실제 유니폼 사진이면 됩니다."
          kit={studio?.kitField ?? null}
          busy={busy}
          onUpload={uploadKit}
          onRemove={removeKit}
        />
        <KitSlot
          slot="keeper"
          title="골키퍼 유니폼 참조"
          hint="없으면 골키퍼는 필드 킷의 구단 색만 빌려 다른 킷으로 그려집니다."
          kit={studio?.kitKeeper ?? null}
          busy={busy}
          onUpload={uploadKit}
          onRemove={removeKit}
        />

        <div className="studio-options">
          <label>
            <span>구도</span>
            <select value={framing} onChange={(event) => setFraming(event.target.value as Framing)}>
              {(Object.keys(FRAMING_LABELS) as Framing[]).map((key) => (
                <option key={key} value={key}>
                  {FRAMING_LABELS[key]}
                </option>
              ))}
            </select>
          </label>
          <label>
            <span>프롬프트 언어</span>
            <select
              value={language}
              onChange={(event) => setLanguage(event.target.value as Language)}
            >
              <option value="ko">한국어</option>
              <option value="en">English</option>
            </select>
          </label>
          <label className="studio-note-field">
            <span>킷 추가 지시 (선택)</span>
            <input
              value={kitNote}
              onChange={(event) => setKitNote(event.target.value)}
              placeholder="예: 올해는 어웨이 킷 기준, 소매 끝 노란 라인"
            />
          </label>
        </div>
      </div>

      {squad && (
        <div className="studio-summary">
          <div>
            <strong>{squad.teamName}</strong>
            <span>
              {squadKind} · 선수 {squad.players.length}명 · 생성 완료 {squadGenerated}명
              {missingFaces > 0 ? ` · 얼굴 참조 없음 ${missingFaces}명` : ''}
            </span>
          </div>
          <div className="studio-summary-actions">
            <button
              type="button"
              className="primary-action"
              disabled={busy}
              onClick={() => runExport(squad.players, '스쿼드 전체를')}
            >
              {busy ? <Loader2 size={16} className="spin" /> : <Download size={16} />}
              전체 내보내기
            </button>
            {studio && (
              <button
                type="button"
                className="pin-toggle"
                onClick={() => openFolder(studio.root)}
                title={studio.root}
              >
                <FolderOpen size={16} />
                스튜디오 폴더
              </button>
            )}
          </div>
        </div>
      )}

      {exported && (
        <div className="studio-export-result">
          <div>
            <strong>내보내기 완료</strong>
            <span>
              선수 {exported.playerCount}명 · 얼굴 {exported.faceCount}장 첨부
              {exported.missingFaceUids.length > 0
                ? ` · 얼굴 없는 선수 ${exported.missingFaceUids.length}명은 국적·나이 서술로 대체`
                : ''}
            </span>
            <code>{exported.folder}</code>
          </div>
          <button type="button" className="pin-toggle" onClick={() => openFolder(exported.folder)}>
            <FolderOpen size={16} />
            폴더 열기
          </button>
        </div>
      )}

      {squad && (
        <div className="studio-body">
          <div className="studio-grid">
            {squad.players.map((player) => {
              const prompt = promptByUid.get(player.uid)
              const generated = studio?.generatedUids.includes(player.uid) ?? false
              return (
                <button
                  type="button"
                  key={player.uid}
                  className={`studio-card ${player.uid === activeUid ? 'selected' : ''}`}
                  onClick={() => setActiveUid(player.uid)}
                  onDragOver={(event) => event.preventDefault()}
                  onDrop={(event) => dropResult(player.uid, event)}
                >
                  <StudioPortrait uid={player.uid} version={versions[player.uid] ?? 0} />
                  <div className="studio-card-body">
                    <strong>{player.name ?? `UID ${player.uid}`}</strong>
                    <span>
                      {player.position} · {player.age != null ? `${player.age}세` : '나이 미상'}
                      {player.heightCm != null ? ` · ${player.heightCm}cm` : ''}
                    </span>
                    <div className="studio-card-flags">
                      {generated && <em className="ok">생성됨</em>}
                      {prompt && !prompt.hasFace && <em className="warn">얼굴 없음</em>}
                      {prompt?.isKeeper && <em>GK</em>}
                    </div>
                  </div>
                </button>
              )
            })}
          </div>

          <aside className="studio-detail">
            {activePlayer && activePrompt ? (
              <>
                <div className="studio-detail-head">
                  <StudioPortrait uid={activePlayer.uid} version={versions[activePlayer.uid] ?? 0} />
                  <div>
                    <h3>{activePlayer.name ?? `UID ${activePlayer.uid}`}</h3>
                    <span>
                      {activePlayer.position} · {activePlayer.age != null ? `${activePlayer.age}세` : '나이 미상'}
                      {activePlayer.nation ? ` · ${activePlayer.nation}` : ''}
                      {activePlayer.heightCm != null && activePlayer.weightKg != null
                        ? ` · ${activePlayer.heightCm}cm ${activePlayer.weightKg}kg`
                        : ''}
                    </span>
                  </div>
                </div>

                {!activePrompt.hasFace && (
                  <div className="studio-warn">
                    <CircleAlert size={15} />
                    페이스팩에 이 선수의 얼굴이 없습니다. 프롬프트가 국적·나이 서술로 대체돼 있어
                    매번 다른 얼굴이 나옵니다.
                  </div>
                )}

                <div className="studio-detail-actions">
                  <button type="button" className="primary-action" onClick={() => copyPrompt(activePrompt)}>
                    <Copy size={16} />
                    프롬프트 복사
                  </button>
                  <button
                    type="button"
                    className="pin-toggle"
                    disabled={busy}
                    onClick={() => runExport([activePlayer], '이 선수를')}
                  >
                    <Download size={16} />
                    얼굴+프롬프트 내보내기
                  </button>
                  <button
                    type="button"
                    className="pin-toggle"
                    onClick={() => {
                      pendingDropUid.current = activePlayer.uid
                      resultInputRef.current?.click()
                    }}
                  >
                    <Wand2 size={16} />
                    결과 이미지 넣기
                  </button>
                  {studio?.generatedUids.includes(activePlayer.uid) && (
                    <button
                      type="button"
                      className="pin-toggle danger"
                      onClick={() => removeResult(activePlayer.uid)}
                    >
                      <Trash2 size={16} />
                      되돌리기
                    </button>
                  )}
                </div>

                <p className="studio-hint">
                  카드에 이미지를 끌어다 놓거나, 카드를 고른 상태에서 Ctrl+V로 붙여넣어도 됩니다.
                </p>

                <pre className="studio-prompt">{activePrompt.prompt}</pre>
              </>
            ) : (
              <div className="studio-empty">
                <Shirt size={26} />
                <p>선수를 고르면 그 선수의 생성 프롬프트가 여기 나옵니다.</p>
              </div>
            )}
          </aside>
        </div>
      )}

      {!squad && (
        <div className="studio-onboarding">
          <ol>
            <li>유니폼 참조 이미지를 등록합니다. FM 안의 킷 화면을 캡처해도 됩니다.</li>
            <li>스쿼드를 불러온 뒤 선수를 고르고 프롬프트를 복사하거나 전체를 폴더로 내보냅니다.</li>
            <li>
              구독 중인 모델 대화창에 얼굴 이미지와 유니폼 참조를 첨부하고 프롬프트를 붙여넣습니다.
            </li>
            <li>받은 이미지를 카드에 끌어다 놓으면 그 뒤로는 얼굴 대신 그 이미지가 표시됩니다.</li>
          </ol>
          {generatedCount > 0 && <p>이미 저장된 생성 이미지 {generatedCount}장이 있습니다.</p>}
        </div>
      )}

      <input
        ref={resultInputRef}
        type="file"
        accept="image/png,image/jpeg,image/webp"
        style={{ display: 'none' }}
        onChange={(event) => {
          const file = event.target.files?.[0]
          const uid = pendingDropUid.current
          if (file && uid != null) saveResult(uid, file)
          event.target.value = ''
        }}
      />
    </section>
  )
}

function KitSlot({
  slot,
  title,
  hint,
  kit,
  busy,
  onUpload,
  onRemove,
}: {
  slot: 'field' | 'keeper'
  title: string
  hint: string
  kit: KitReference | null
  busy: boolean
  onUpload: (slot: 'field' | 'keeper', file: File) => void
  onRemove: (slot: 'field' | 'keeper') => void
}) {
  const inputRef = useRef<HTMLInputElement | null>(null)

  return (
    <div
      className={`studio-kit ${kit ? 'filled' : ''}`}
      onDragOver={(event) => event.preventDefault()}
      onDrop={(event) => {
        event.preventDefault()
        const file = event.dataTransfer.files?.[0]
        if (file) onUpload(slot, file)
      }}
    >
      <div className="studio-kit-preview">
        {kit ? <img src={kit.dataUri} alt="" /> : <Shirt size={26} />}
      </div>
      <div className="studio-kit-body">
        <strong>{title}</strong>
        <small>{kit ? kit.fileName : hint}</small>
        <div className="studio-kit-actions">
          <button
            type="button"
            className="pin-toggle"
            disabled={busy}
            onClick={() => inputRef.current?.click()}
          >
            {kit ? '바꾸기' : '이미지 선택'}
          </button>
          {kit && (
            <button type="button" className="pin-toggle danger" onClick={() => onRemove(slot)}>
              지우기
            </button>
          )}
        </div>
      </div>
      <input
        ref={inputRef}
        type="file"
        accept="image/png,image/jpeg,image/webp"
        style={{ display: 'none' }}
        onChange={(event) => {
          const file = event.target.files?.[0]
          if (file) onUpload(slot, file)
          event.target.value = ''
        }}
      />
    </div>
  )
}
