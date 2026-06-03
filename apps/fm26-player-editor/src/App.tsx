import { Fragment, memo, useCallback, useEffect, useMemo, useRef, useState } from 'react'
import type { ReactNode } from 'react'
import { invoke } from '@tauri-apps/api/core'
import Globe, { type GlobeMethods } from 'react-globe.gl'
import { feature } from 'topojson-client'
import countriesTopo from 'world-atlas/countries-110m.json'
import earthDarkUrl from './assets/earth-dark.jpg'
import {
  Activity,
  Building2,
  Calculator,
  CheckCircle2,
  CircleAlert,
  Clock3,
  Eye,
  EyeOff,
  ListChecks,
  Loader2,
  MapPinned,
  RotateCcw,
  Search,
  Shield,
  Sparkles,
  Star,
  Trash2,
  UserRound,
  UsersRound,
} from 'lucide-react'
import './App.css'
import { fieldDefs, mockValues, positions, traitGroups, visibleReadKeys } from './appData'
import type { FieldDef, FieldValue, Values } from './appData'

type Section = 'attributes' | 'positions' | 'traits' | 'private'
type MainView = 'editor' | 'scouting' | 'nation'
type NationCandidate = {
  nation: string
  ntct: string
  uid: number
  name: string | null
  youthRating: number
  gameImportance: number
  vtableVotes: number
}
type NationScanResult = {
  uid: number
  youthRating: number
  gameImportance: number
  hitCount: number
  name: string | null
  candidates: NationCandidate[]
  needsSelection: boolean
  selected: boolean
}
const GAME_IMPORTANCE_LABELS: Record<number, string> = {
  1: '1 · Very Important',
  2: '2 · Important',
  3: '3 · Unimportant',
  4: '4 · Useless',
}
type Change = { key: string; label: string; from: FieldValue; to: FieldValue }
type SavedPlayer = { uid: number; name?: string | null; lastSeen: number }
type ScanResult = {
  uid: number
  name?: string | null
  person: number
  player: number
  ca: number
  pa: number
  dynamicOffset: number
  hitCount: number
}
type ConnectResult = {
  pid: number
  processName: string
  seDebugEnabled: boolean
}
type ScoutingBand = { label: string; count: number }
type ScoutingCandidate = {
  label: string
  uid?: number | null
  position: string
  age?: number | null
  nation?: string | null
  ca: number
  pa: number
  caBand: string
  paBand: string
  abilities: ScoutingAbility[]
  comparisons: string[]
  developmentBand?: string | null
  comparisonPhrase?: string | null
  personalityHint?: string | null
  personalityNotes?: string[]
  hiddenNotes?: string[]
  riskHint?: string | null
  riskDetails?: ScoutingRiskDetails | null
  recommendation?: string | null
}
type ScoutingAbility = {
  label: string
  category: 'technical' | 'mental' | 'physical' | string
  value: number
}
type PlayerOctagonMetric = {
  key: string
  label: string
  short: string
  value: number
}
type CandidateDesignBasis = 'pa' | 'ca'
type ScoutingRiskDetails = {
  injury: string
  consistency: string
  bigMatches: string
  pressure: string
  weakestAxis: string
  note: string
}
type NarrativeParagraph = {
  uid: number | null
  body: string
}
type ScoutingReport = {
  teamName: string
  squadKind: string
  knowledgeLevel: number
  totalRequested: number
  resolvedPlayers: number
  prospectCount: number
  seniorCount: number
  paBands: ScoutingBand[]
  caBands: ScoutingBand[]
  positionCounts: ScoutingBand[]
  prospectCandidates: ScoutingCandidate[]
  seniorCandidates: ScoutingCandidate[]
  candidates: ScoutingCandidate[]
  unresolvedUids: number[]
  summaryNarrative?: string
  prospectSummaryNarrative?: string
  seniorSummaryNarrative?: string
  prospectSummaryPrologue?: string
  prospectParagraphs?: NarrativeParagraph[]
  seniorSummaryPrologue?: string
  seniorParagraphs?: NarrativeParagraph[]
  scoutJca?: number | null
  scoutJpa?: number | null
}
type ClubPlayerUidsResult = {
  inputId: number
  sourceKind: string
  teamName: string
  nation?: string | null
  reputation?: number | null
  squadKind: string
  teamCount: number
  playerUids: number[]
  squads: { teamType: number; teamTypeLabel: string; playerCount: number; playerUids: number[] }[]
}
type SquadInfo = {
  inputId: number
  sourceKind: string
  teamName: string
  nation?: string | null
  reputation?: number | null
  squadKind: string
  teamCount: number
  playerCount: number
  squads: { teamType: number; teamTypeLabel: string; playerCount: number }[]
}
type ClubIdentityResult = {
  inputId: number
  sourceKind: string
  name: string
  nation?: string | null
  reputation?: number | null
  teamCount: number
  playerCount: number
  squadLabel: string
}
type ScoutingBudgetResult = {
  clubPtr: number
  teamPtr: number
  managerPtr: number
  managerPersonPtr: number
  managerUid?: number | null
  recruitmentPackage?: number | null
  seasonBudget: number
  remainingBudget: number
  unlimitedScouting: boolean
  source: string
}
type UserClubScoutsResult = {
  clubPtr: number
  clubName: string
  recruitmentTeamCount: number
  importedCount: number
  scouts: Scout[]
  source: string
}
type ScoutingHistoryEntry = {
  id: string
  clubId: string
  teamName: string
  nation?: string | null
  countryName: string
  countryGeoName: string
  squadInfo: SquadInfo
  playerUids: number[]
  reports: Record<string, ScoutingReport>
  bestLevel: number
  reportCount: number
  updatedAt: number
}
type CountryIntel = {
  count: number
  maxLevel: number
  entries: ScoutingHistoryEntry[]
}
type ScoutingCostEstimate = {
  amount: number
  baseAmount: number
  projectedRemaining?: number | null
  factors: { label: string; value: string }[]
  notes: string[]
}

const RECENT_PLAYERS_KEY = 'fm26-rte.recentPlayers'
const FAVORITE_PLAYERS_KEY = 'fm26-rte.favoritePlayers'
const SCOUTS_KEY = 'fm26-rte.scouts'
const GAME_DATE_KEY = 'fm26-rte.gameDate'
const SCOUTING_HISTORY_KEY = 'fm26-rte.scoutingHistory'

type Scout = {
  name: string
  jca: number
  jpa: number
  adaptability?: number | null
}
type PlayerDetailReport = {
  playerUid: number
  knowledgeLevel: number
  candidate: ScoutingCandidate
  narrative: string
}
type ParsedGameDate = { year: number; month: number; day: number }

function loadScouts(): Scout[] {
  if (typeof window === 'undefined') return []
  try {
    const raw = window.localStorage.getItem(SCOUTS_KEY)
    if (!raw) return []
    const parsed = JSON.parse(raw)
    if (!Array.isArray(parsed)) return []
    return parsed
      .map(normalizeScout)
      .filter((scout): scout is Scout => scout !== null)
  } catch {
    return []
  }
}

function saveScouts(scouts: Scout[]): Scout[] {
  const normalized = scouts
    .map(normalizeScout)
    .filter((scout): scout is Scout => scout !== null)
  if (typeof window !== 'undefined') {
    window.localStorage.setItem(SCOUTS_KEY, JSON.stringify(normalized))
  }
  return normalized
}

function normalizeScout(value: unknown): Scout | null {
  if (!value || typeof value !== 'object') return null
  const scout = value as Record<string, unknown>
  if (typeof scout.name !== 'string' || typeof scout.jca !== 'number' || typeof scout.jpa !== 'number') return null
  return {
    name: scout.name,
    jca: scout.jca,
    jpa: scout.jpa,
    adaptability: typeof scout.adaptability === 'number' ? scout.adaptability : null,
  }
}

function App() {
  const [workspaceReady, setWorkspaceReady] = useState(false)
  const [mainView, setMainView] = useState<MainView>('editor')
  const [section, setSection] = useState<Section>('attributes')
  const [uid, setUid] = useState('2002074288')
  const [values, setValues] = useState<Values>({})
  const [originalValues, setOriginalValues] = useState<Values>({})
  const [revealedPrivate, setRevealedPrivate] = useState<Record<string, boolean>>({})
  const [changes, setChanges] = useState<Change[]>([])
  const [scan, setScan] = useState<ScanResult | null>(null)
  const [connected, setConnected] = useState(false)
  const [busy, setBusy] = useState(false)
  const [status, setStatus] = useState('FM26에서 선수 UID로 검색하세요.')
  const [faceMissing, setFaceMissing] = useState(false)
  const [portraitSrc, setPortraitSrc] = useState('')
  const [recentPlayers, setRecentPlayers] = useState<SavedPlayer[]>(() => loadSavedPlayers(RECENT_PLAYERS_KEY))
  const [favoritePlayers, setFavoritePlayers] = useState<SavedPlayer[]>(() => loadSavedPlayers(FAVORITE_PLAYERS_KEY))
  const [scoutTeamName, setScoutTeamName] = useState('')
  const [scoutClubId, setScoutClubId] = useState('')
  const [scoutSquad, setScoutSquad] = useState('선수단')
  const [scoutLevel, setScoutLevel] = useState(1)
  const [scoutUids, setScoutUids] = useState('')
  const [scoutSquadInfo, setScoutSquadInfo] = useState<SquadInfo | null>(null)
  const [userClubId, setUserClubId] = useState('')
  const [gameDate, setGameDate] = useState(() => loadGameDate())
  const [verifiedClub, setVerifiedClub] = useState<ClubIdentityResult | null>(null)
  const [scoutingBudget, setScoutingBudget] = useState<ScoutingBudgetResult | null>(null)
  const [scoutReport, setScoutReport] = useState<ScoutingReport | null>(null)
  const [scouts, setScouts] = useState<Scout[]>(() => loadScouts())
  const [scoutNetwork, setScoutNetwork] = useState<UserClubScoutsResult | null>(null)
  const [scoutingHistory, setScoutingHistory] = useState<ScoutingHistoryEntry[]>(() => loadScoutingHistory())
  const [selectedScoutIndex, setSelectedScoutIndex] = useState(-1)
  const selectedScout = selectedScoutIndex >= 0 ? scouts[selectedScoutIndex] ?? null : null
  const isTauri = typeof window !== 'undefined' && '__TAURI_INTERNALS__' in window
  const activeFavorite = scan ? favoritePlayers.some((player) => player.uid === scan.uid) : false
  const fieldsByCategory = useMemo(
    () => ({
      기술: fieldDefs.filter((field) => field.category === 'technical'),
      정신: fieldDefs.filter((field) => field.category === 'mental'),
      신체: fieldDefs.filter((field) => field.category === 'physical'),
      골키퍼: fieldDefs.filter((field) => field.category === 'goalkeeping'),
      hidden: fieldDefs.filter((field) => field.category === 'hidden'),
    }),
    [],
  )

  function changeUserClubId(value: string) {
    setUserClubId(value)
    setVerifiedClub(null)
    setScoutingBudget(null)
    setScoutNetwork(null)
    setConnected(false)
  }

  function changeGameDate(value: string) {
    setGameDate(value)
    if (typeof window !== 'undefined') {
      window.localStorage.setItem(GAME_DATE_KEY, value)
    }
    setScoutReport(null)
  }

  async function syncGameDate() {
    const parsed = parseGameDateInput(gameDate)
    if (!parsed) {
      setStatus('게임 내 날짜를 YYYY-MM-DD 형식으로 입력하세요.')
      return null
    }

    if (isTauri) {
      await invoke('set_game_date', parsed)
    }

    if (typeof window !== 'undefined') {
      window.localStorage.setItem(GAME_DATE_KEY, gameDate)
    }
    return parsed
  }

  function changeScoutClubId(value: string) {
    setScoutClubId(value)
    setScoutTeamName('')
    setScoutSquad('선수단')
    setScoutUids('')
    setScoutSquadInfo(null)
    setScoutReport(null)
  }

  async function verifyUserClub() {
    const userClubIdNum = Number(userClubId.trim())
    if (!Number.isInteger(userClubIdNum) || userClubIdNum <= 0) {
      setStatus('내 구단 ID를 먼저 입력하세요.')
      return null
    }

    setBusy(true)
    setStatus('fm.exe에서 내 구단 정보를 확인 중..')
    try {
      const parsedGameDate = await syncGameDate()
      if (!parsedGameDate) return null

      if (!isTauri) {
        const previewClub = {
          inputId: userClubIdNum,
          sourceKind: 'club',
          name: '미리보기 구단',
          nation: '잉글랜드',
          reputation: 7400,
          teamCount: 3,
          playerCount: 72,
          squadLabel: '3개 선수단',
        }
        setVerifiedClub(previewClub)
        setConnected(true)
        setStatus('브라우저 미리보기 모드입니다. 실제 구단 확인은 Tauri 앱에서 수행됩니다.')
        return previewClub
      }

      await invoke<ConnectResult>('connect_fm')
      const club = await invoke<ClubIdentityResult>('identify_club', { clubId: userClubIdNum })
      setVerifiedClub(club)
      setConnected(true)
      setStatus(`${club.name} 확인 완료. 구단명이 맞으면 확인 버튼으로 접속하세요.`)
      return club
    } catch (error) {
      setConnected(false)
      setVerifiedClub(null)
      setStatus(String(error))
      return null
    } finally {
      setBusy(false)
    }
  }

  async function connectGame() {
    const userClubIdNum = Number(userClubId.trim())
    const parsedGameDate = await syncGameDate()
    if (!parsedGameDate) return

    const club = verifiedClub?.inputId === userClubIdNum ? verifiedClub : await verifyUserClub()
    if (!club) return

    setWorkspaceReady(true)
    setConnected(true)
    setStatus(`${club.name} 접속 완료 · 기준일 ${gameDate}`)
  }

  async function refreshScoutingBudget() {
    const userClubIdNum = Number(userClubId.trim())
    if (!Number.isInteger(userClubIdNum) || userClubIdNum <= 0) {
      setStatus('내 구단 ID를 먼저 입력하세요.')
      return
    }

    setBusy(true)
    setStatus('유저 팀의 스카우트 예산을 읽는 중..')
    try {
      if (!isTauri) {
        setScoutingBudget({
          clubPtr: 0,
          teamPtr: 0,
          managerPtr: 0,
          managerPersonPtr: 0,
          managerUid: 1,
          recruitmentPackage: 7,
          seasonBudget: 5_000_000,
          remainingBudget: 3_250_000,
          unlimitedScouting: false,
          source: 'preview',
        })
        setStatus('브라우저 미리보기 모드입니다. Tauri 앱에서 실제 예산을 읽습니다.')
        return
      }

      await invoke<ConnectResult>('connect_fm')
      const budget = await invoke<ScoutingBudgetResult>('read_scouting_budget', { userClubId: userClubIdNum })
      setScoutingBudget(budget)
      setStatus(`스카우트 예산 확인: 남은 예산 ${formatMoney(budget.remainingBudget)}`)
    } catch (error) {
      setScoutingBudget(null)
      setStatus(String(error))
    } finally {
      setBusy(false)
    }
  }

  async function refreshUserClubScouts() {
    const userClubIdNum = Number(userClubId.trim())
    if (!Number.isInteger(userClubIdNum) || userClubIdNum <= 0) {
      setStatus('내 구단 ID를 먼저 입력하세요.')
      return
    }

    setBusy(true)
    setStatus('유저 구단의 스카우팅 스태프를 읽는 중..')
    try {
      if (!isTauri) {
        const result = makeMockUserClubScouts()
        setScoutNetwork(result)
        setScouts(saveScouts(result.scouts))
        setSelectedScoutIndex(result.scouts.length > 0 ? 0 : -1)
        setStatus(`브라우저 미리보기: 스카우터 ${result.importedCount}명을 불러왔습니다.`)
        return
      }

      await invoke<ConnectResult>('connect_fm')
      const result = await invoke<UserClubScoutsResult>('collect_user_club_scouts', { userClubId: userClubIdNum })
      setScoutNetwork(result)
      setScouts(saveScouts(result.scouts))
      setSelectedScoutIndex(result.scouts.length > 0 ? 0 : -1)
      setConnected(true)
      setStatus(`${result.clubName}: 영입/스카우팅 스태프 ${result.importedCount}/${result.recruitmentTeamCount}명 수집 완료`)
    } catch (error) {
      setScoutNetwork(null)
      setStatus(String(error))
    } finally {
      setBusy(false)
    }
  }

  async function searchPlayer() {
    setBusy(true)
    setFaceMissing(false)
    setPortraitSrc('')
    setStatus('UID 스캔 중..')
    try {
      if (!isTauri) {
        const result = { uid: Number(uid), name: '미리보기 선수', person: 0, player: 0, ca: 142, pa: 168, dynamicOffset: 0x288, hitCount: 1 }
        setConnected(true)
        setScan(result)
        setValues(mockValues)
        setOriginalValues(mockValues)
        setPortraitSrc(`faces/${uid}.png`)
        rememberRecent(result)
        setStatus('브라우저 미리보기 모드입니다. Tauri 앱에서는 실제 fm.exe를 스캔합니다.')
        return
      }

      const result = await invoke<ScanResult>('scan_player', { uid: Number(uid) })
      const loaded = await readMany(visibleReadKeys)
      const face = await invoke<string | null>('read_player_face', { uid: Number(uid) })
      setConnected(true)
      setScan(result)
      setValues(loaded)
      setOriginalValues(loaded)
      setPortraitSrc(face ?? '')
      setChanges([])
      setRevealedPrivate({})
      rememberRecent(result)
      setStatus(`${result.name ?? `UID ${result.uid}`} 선수 레코드를 찾았습니다. 후보 ${result.hitCount}개 중 첫 번째를 사용합니다.`)
    } catch (error) {
      setScan(null)
      setValues({})
      setOriginalValues({})
      setStatus(String(error))
    } finally {
      setBusy(false)
    }
  }

  async function readMany(keys: string[]) {
    const results = await invoke<{ key: string; value: FieldValue }[]>('read_all_fields', { keys })
    const loaded: Values = {}
    for (const { key, value } of results) loaded[key] = value
    return loaded
  }

  async function revealField(key: string) {
    if (values[key] !== undefined) {
      setRevealedPrivate((current) => ({ ...current, [key]: !current[key] }))
      return
    }

    setBusy(true)
    try {
      if (!isTauri) {
        const next = mockValues[key] ?? 10
        setValues((current) => ({ ...current, [key]: next }))
        setOriginalValues((current) => ({ ...current, [key]: next }))
      } else {
        const result = await invoke<{ key: string; value: FieldValue }>('read_field', { key })
        setValues((current) => ({ ...current, [result.key]: result.value }))
        setOriginalValues((current) => ({ ...current, [result.key]: result.value }))
      }
      setRevealedPrivate((current) => ({ ...current, [key]: true }))
    } catch (error) {
      setStatus(String(error))
    } finally {
      setBusy(false)
    }
  }

  function stageChange(key: string, label: string, from: FieldValue, to: FieldValue) {
    const original = originalValues[key] ?? from
    setValues((current) => ({ ...current, [key]: to }))
    setChanges((current) => {
      const next = current.filter((item) => item.key !== key)
      if (original === to) return next
      return [...next, { key, label, from: original, to }]
    })
  }

  async function applyAll() {
    if (changes.length === 0) return
    setBusy(true)
    setStatus('변경사항 적용 중..')
    try {
      if (isTauri) {
        const result = await invoke<{ key: string; ok: boolean; value?: FieldValue; error?: string }[]>('apply_changes', {
          changes: changes.map((change) => ({ key: change.key, value: change.to })),
        })
        const failed = result.filter((item) => !item.ok)
        if (failed.length > 0) throw new Error(failed.map((item) => `${item.key}: ${item.error}`).join('\n'))
        setValues((current) => {
          const next = { ...current }
          for (const item of result) if (item.value !== undefined) next[item.key] = item.value
          return next
        })
        setOriginalValues((current) => {
          const next = { ...current }
          for (const item of result) if (item.value !== undefined) next[item.key] = item.value
          return next
        })
      } else {
        setOriginalValues(values)
      }
      setChanges([])
      setStatus('변경사항이 적용되었습니다.')
    } catch (error) {
      setStatus(String(error))
    } finally {
      setBusy(false)
    }
  }

  function rememberRecent(result: ScanResult) {
    const item = toSavedPlayer(result)
    setRecentPlayers((current) => savePlayers(RECENT_PLAYERS_KEY, [item, ...current.filter((player) => player.uid !== item.uid)].slice(0, 6)))
  }

  function toggleFavorite() {
    if (!scan) return
    const item = toSavedPlayer(scan)
    setFavoritePlayers((current) => {
      const exists = current.some((player) => player.uid === item.uid)
      const next = exists ? current.filter((player) => player.uid !== item.uid) : [item, ...current]
      return savePlayers(FAVORITE_PLAYERS_KEY, next.slice(0, 20))
    })
  }

  function openSavedPlayer(player: SavedPlayer) {
    setUid(String(player.uid))
    setStatus(`${player.name ?? player.uid} 선택됨 - 검색 버튼으로 다시 불러오세요.`)
  }

  function discardChanges() {
    if (changes.length === 0) return
    setValues((current) => {
      const next = { ...current }
      for (const change of changes) {
        next[change.key] = originalValues[change.key] ?? change.from
      }
      return next
    })
    setChanges([])
    setStatus('진행 중인 변경사항을 이전 값으로 되돌렸습니다.')
  }

  async function collectClubUids() {
    const clubId = Number(scoutClubId.trim())
    if (!Number.isInteger(clubId) || clubId <= 0) {
      setStatus('스카우트할 팀 ID를 먼저 입력하세요.')
      return
    }

    setBusy(true)
    setStatus('스카우팅 대상 선수단 확인 중..')
    try {
      if (!isTauri) {
        const mockUids = [2002074288, 2002074291, 2002074302, 2002074317, 2002074331, 2002074344]
        const mockInfo = {
          inputId: clubId,
          sourceKind: 'club',
          teamName: '미리보기 스카우팅 팀',
          nation: '잉글랜드',
          reputation: 6800,
          squadKind: '전체',
          teamCount: 2,
          playerCount: mockUids.length,
          squads: [
            { teamType: 0, teamTypeLabel: '1군', playerCount: 4 },
            { teamType: 10, teamTypeLabel: 'U21', playerCount: 2 },
          ],
        }
        setScoutUids(mockUids.join('\n'))
        setScoutTeamName(mockInfo.teamName)
        setScoutSquad(mockInfo.squadKind)
        setScoutSquadInfo(mockInfo)
        setStatus(`${mockInfo.teamName}: 선수단 ${mockInfo.playerCount}명 확인`)
        return
      }

      const result = await invoke<ClubPlayerUidsResult>('collect_club_player_uids', { clubId, squadKind: '전체' })
      setConnected(true)
      setScoutUids(result.playerUids.join('\n'))
      setScoutTeamName(result.teamName)
      const squadLabel = result.squads[0]?.teamTypeLabel ?? '선수단'
      const resolvedSquad = result.teamCount === 1 ? squadLabel : `${result.teamCount}개 선수단`
      setScoutSquad(resolvedSquad)
      setScoutSquadInfo({
        inputId: result.inputId,
        sourceKind: result.sourceKind,
        teamName: result.teamName,
        nation: result.nation,
        reputation: result.reputation,
        squadKind: result.squadKind,
        teamCount: result.teamCount,
        playerCount: result.playerUids.length,
        squads: result.squads.map((squad) => ({
          teamType: squad.teamType,
          teamTypeLabel: squad.teamTypeLabel,
          playerCount: squad.playerCount,
        })),
      })
      setStatus(`${result.teamName}: ${resolvedSquad}, 선수 ${result.playerUids.length}명 확인`)
    } catch (error) {
      setStatus(String(error))
    } finally {
      setBusy(false)
    }
  }

  async function buildScoutingReport() {
    const playerUids = parseUidList(scoutUids)
    if (playerUids.length === 0) {
      setStatus('스카우팅할 팀 ID를 먼저 확인하세요.')
      return
    }

    setBusy(true)
    setStatus('스카우팅 리포트 생성 중..')
    const costEstimate = estimateScoutingCost({
      squadInfo: scoutSquadInfo,
      knowledgeLevel: scoutLevel,
      selectedScout,
      userClub: verifiedClub,
      budget: scoutingBudget,
      history: scoutingHistory,
    })
    const costNote = costEstimate ? ` 예상 비용 ${formatMoney(costEstimate.amount)} (실제 차감 없음)` : ''
    try {
      if (!isTauri) {
        const report = makeMockScoutingReport(scoutTeamName || scoutSquadInfo?.teamName || '스카우팅 대상팀', scoutSquad, scoutLevel, playerUids)
        setScoutReport(report)
        rememberScoutingReport(report, playerUids)
        setStatus(`브라우저 미리보기 리포트가 생성되었습니다.${costNote}`)
        return
      }

      const report = await invoke<ScoutingReport>('build_scouting_report', {
        request: {
          teamName: scoutTeamName || scoutSquadInfo?.teamName || '스카우팅 대상팀',
          squadKind: scoutSquad,
          knowledgeLevel: scoutLevel,
          playerUids,
          scoutJca: selectedScout?.jca ?? null,
          scoutJpa: selectedScout?.jpa ?? null,
        },
      })
      setConnected(true)
      setScoutReport(report)
      rememberScoutingReport(report, playerUids)
      setStatus(`${report.teamName || scoutTeamName} ${report.squadKind} 리포트 생성 완료: ${report.resolvedPlayers}/${report.totalRequested}명 확인.${costNote}`)
    } catch (error) {
      setStatus(String(error))
    } finally {
      setBusy(false)
    }
  }

  function rememberScoutingReport(report: ScoutingReport, playerUids: number[]) {
    if (!scoutSquadInfo) return
    const focus = getClubFocus(scoutSquadInfo.teamName, scoutSquadInfo.nation)
    setScoutingHistory((current) => {
      const next = upsertScoutingHistory(current, scoutSquadInfo, playerUids, report, focus)
      return saveScoutingHistory(next)
    })
  }

  function restoreScoutingHistory(entry: ScoutingHistoryEntry, report: ScoutingReport, level: number) {
    setScoutClubId(entry.clubId)
    setScoutTeamName(entry.teamName)
    setScoutSquad(report.squadKind || entry.squadInfo.squadKind)
    setScoutSquadInfo(entry.squadInfo)
    setScoutUids(entry.playerUids.join('\n'))
    setScoutLevel(level)
    setScoutReport(report)
    setStatus(`${entry.teamName} ${level}단계 스카우팅 기록을 불러왔습니다.`)
  }

  if (!workspaceReady) {
    return (
      <main className="app-shell connect-shell">
        <section className="connect-card">
          <div>
            <div className="eyebrow">FM26 선수 에디터</div>
            <h1>게임 연결 준비</h1>
            <p>게임 내 날짜와 내 구단 ID를 입력하고 현재 실행 중인 FM26 프로세스에 연결합니다.</p>
          </div>

          <label className="connect-field">
            <span>게임 내 날짜</span>
            <input
              type="date"
              value={gameDate}
              onChange={(event) => changeGameDate(event.target.value)}
              disabled={busy}
            />
          </label>

          <label className="connect-field">
            <span>내 구단 ID</span>
            <input
              value={userClubId}
              onChange={(event) => changeUserClubId(event.target.value)}
              inputMode="numeric"
              placeholder="예: 15671"
              disabled={busy}
              onKeyDown={(event) => {
                if (event.key === 'Enter') {
                  if (verifiedClub) connectGame()
                  else verifyUserClub()
                }
              }}
            />
          </label>

          <button type="button" className="soft-action connect-action" disabled={busy} onClick={verifyUserClub}>
            {busy ? <Loader2 size={17} className="spin" /> : <Search size={17} />}
            구단 확인
          </button>

          {verifiedClub && (
            <div className="club-preview">
              <Building2 size={18} />
              <div>
                <span>내 구단</span>
                <strong>{verifiedClub.name}</strong>
                <small>
                  ID {verifiedClub.inputId} · {verifiedClub.squadLabel} · {verifiedClub.playerCount}명 확인
                </small>
              </div>
            </div>
          )}

          <button type="button" className="primary-action connect-action" disabled={busy || !verifiedClub} onClick={connectGame}>
            {busy ? <Loader2 size={17} className="spin" /> : verifiedClub ? <CheckCircle2 size={17} /> : <Shield size={17} />}
            확인 및 접속
          </button>

          <div className={connected ? 'connection-pill' : 'connection-pill idle'}>
            <span className="status-dot"></span>
            {connected ? '구단 확인됨' : '연결 대기'}
          </div>
          <p className="connect-status">{status}</p>
        </section>
      </main>
    )
  }

  return (
    <main className={`app-shell ${mainView === 'scouting' ? 'scouting-mode' : 'editor-mode'}`}>
      <header className="topbar">
        <div>
          <div className="eyebrow">FM26 선수 에디터</div>
          <h1>{mainView === 'scouting' ? '스카우팅 센터' : mainView === 'nation' ? '국가 편집' : '선수 편집'}</h1>
        </div>
        <div className="topbar-actions">
          <div className="view-switch" aria-label="기능 선택">
            <button type="button" className={mainView === 'editor' ? 'view-button active' : 'view-button'} onClick={() => setMainView('editor')}>
              <UserRound size={16} />
              선수 편집
            </button>
            <button type="button" className={mainView === 'scouting' ? 'view-button active' : 'view-button'} onClick={() => setMainView('scouting')}>
              <Search size={16} />
              스카우팅 센터
            </button>
            <button type="button" className={mainView === 'nation' ? 'view-button active' : 'view-button'} onClick={() => setMainView('nation')}>
              <MapPinned size={16} />
              국가 편집
            </button>
          </div>
          <div className={connected ? 'connection-pill' : 'connection-pill idle'}>
            <span className="status-dot"></span>
            {connected ? 'fm.exe 연결됨' : '연결 안됨'}
          </div>
        </div>
      </header>

      {mainView === 'editor' ? (
        <>
          <section className="search-strip">
            <label>
              <span>선수 UID</span>
              <input value={uid} onChange={(event) => setUid(event.target.value)} />
            </label>
            <button type="button" className="primary-action" disabled={busy} onClick={searchPlayer}>
              {busy ? <Loader2 size={17} className="spin" /> : <Search size={17} />}
              검색
            </button>
            <div className="scan-note">{status}</div>
          </section>

          <section className="workspace">
            <aside className="sidebar">
              <section className="player-card">
                <div className="avatar">
                  {!faceMissing && portraitSrc ? (
                    <img src={portraitSrc} alt="" onError={() => setFaceMissing(true)} />
                  ) : (
                    <UserRound size={46} />
                  )}
                </div>
                <div>
                  <h2>{scan ? (scan.name ?? '선수 불러오기') : '선수 없음'}</h2>
                  <p>UID {uid}</p>
                </div>
                <button type="button" className={activeFavorite ? 'favorite-button active' : 'favorite-button'} disabled={!scan} onClick={toggleFavorite}>
                  <Star size={16} />
                  {activeFavorite ? '즐겨찾기 제거' : '즐겨찾기 추가'}
                </button>
                <div className="mini-grid">
                  <span>OVR</span>
                  <strong>{scan ? Math.round(scan.ca / 2) : '-'}</strong>
                  <span>검색 후보</span>
                  <strong>{scan ? `${scan.hitCount}개` : '-'}</strong>
                  <span>상태</span>
                  <strong>{scan ? '편집 가능' : '-'}</strong>
                </div>
              </section>

              <nav className="section-nav">
                <NavButton icon={<Activity />} active={section === 'attributes'} label="능력치" onClick={() => setSection('attributes')} />
                <NavButton icon={<Shield />} active={section === 'positions'} label="포지션" onClick={() => setSection('positions')} />
                <NavButton icon={<Sparkles />} active={section === 'traits'} label="선호 플레이" onClick={() => setSection('traits')} />
                <NavButton icon={<EyeOff />} active={section === 'private'} label="숨김" onClick={() => setSection('private')} />
              </nav>

              <SavedPlayerList title="즐겨찾기" icon={<Star />} players={favoritePlayers} onSelect={openSavedPlayer} />
              <SavedPlayerList title="최근 검색" icon={<Clock3 />} players={recentPlayers} onSelect={openSavedPlayer} />
            </aside>

            <section className="editor-surface">
              {section === 'attributes' && <AttributesView groups={fieldsByCategory} values={values} onChange={stageChange} />}
              {section === 'positions' && <PositionsView values={values} onChange={stageChange} />}
              {section === 'traits' && <TraitsView values={values} onChange={stageChange} />}
              {section === 'private' && (
                <PrivateView fields={fieldsByCategory.hidden} revealed={revealedPrivate} values={values} onReveal={revealField} onChange={stageChange} />
              )}
            </section>

            <aside className="changes-panel">
              <div className="panel-heading">
                <ListChecks size={18} />
                <h2>변경사항</h2>
              </div>
              {changes.length === 0 ? (
                <p className="empty-state">아직 변경된 항목이 없습니다.</p>
              ) : (
                <ul className="change-list">
                  {changes.map((change) => (
                    <li key={change.key}>
                      <span>{change.label}</span>
                      <strong>
                        {formatChange(change.from)} -&gt; {formatChange(change.to)}
                      </strong>
                    </li>
                  ))}
                </ul>
              )}
              <button type="button" className="apply-all" disabled={busy || changes.length === 0} onClick={applyAll}>
                모두 적용
              </button>
              <button type="button" className="soft-action" disabled={busy} onClick={() => setChanges([])}>
                변경 목록 비우기
              </button>
              <button type="button" className="soft-action" disabled={busy || changes.length === 0} onClick={discardChanges}>
                <RotateCcw size={16} />
                이전 값으로 되돌리기
              </button>
              <div className="safety-note">
                <CircleAlert size={16} />
                적용 후에만 메모리에 씁니다.
              </div>
            </aside>
          </section>
        </>
      ) : mainView === 'nation' ? (
        <NationView connected={connected} />
      ) : (
        <section className="scouting-workspace">
          <section className="editor-surface scouting-surface">
            <ScoutingView
              teamName={scoutTeamName}
              clubId={scoutClubId}
              knowledgeLevel={scoutLevel}
              squadInfo={scoutSquadInfo}
              report={scoutReport}
              history={scoutingHistory}
              budget={scoutingBudget}
              userClub={verifiedClub}
              scoutNetwork={scoutNetwork}
              busy={busy}
              scouts={scouts}
              selectedScoutIndex={selectedScoutIndex}
              selectedScout={selectedScout}
              onTeamNameChange={setScoutTeamName}
              onClubIdChange={changeScoutClubId}
              onKnowledgeLevelChange={setScoutLevel}
              onScoutSelect={setSelectedScoutIndex}
              onScoutAdd={(scout) => setScouts(saveScouts([...scouts, scout]))}
              onScoutRemove={(index) => {
                const next = scouts.filter((_, i) => i !== index)
                setScouts(saveScouts(next))
                if (selectedScoutIndex === index) setSelectedScoutIndex(-1)
                else if (selectedScoutIndex > index) setSelectedScoutIndex(selectedScoutIndex - 1)
              }}
              onRefreshScouts={refreshUserClubScouts}
              onCollect={collectClubUids}
              onRefreshBudget={refreshScoutingBudget}
              onBuild={buildScoutingReport}
              onRestoreHistory={restoreScoutingHistory}
            />
          </section>
        </section>
      )}
    </main>
  )
}

function NationView({ connected }: { connected: boolean }) {
  const [uid, setUid] = useState('')
  const [busy, setBusy] = useState(false)
  const [info, setInfo] = useState<NationScanResult | null>(null)
  const [candidates, setCandidates] = useState<NationCandidate[]>([])
  const [youthRating, setYouthRating] = useState('')
  const [gameImportance, setGameImportance] = useState('')
  const [status, setStatus] = useState<string>(
    connected ? 'UID를 입력하고 검색하세요.' : '먼저 fm.exe에 연결해야 합니다.',
  )
  const [error, setError] = useState<string | null>(null)

  const searchNation = async () => {
    setError(null)
    const parsed = Number(uid.trim())
    if (!Number.isFinite(parsed) || parsed <= 0) {
      setError('유효한 UID를 입력하세요.')
      return
    }
    setBusy(true)
    setStatus('국가 객체 스캔 중...')
    setInfo(null)
    setCandidates([])
    try {
      const result = await invoke<NationScanResult>('scan_nation', { uid: Math.trunc(parsed) })
      if (result.needsSelection) {
        // 후보가 여러 개 — 자동 확정하지 않고 사용자가 직접 고른다.
        setCandidates(result.candidates)
        setStatus(
          `후보 ${result.candidates.length}개를 찾았습니다. 게임 화면의 국가 이름과 대조해 올바른 후보를 선택하세요.`,
        )
        return
      }
      setInfo(result)
      setYouthRating(String(result.youthRating))
      setGameImportance(String(result.gameImportance))
      setStatus(
        `${result.name ? result.name + ' · ' : ''}UID ${result.uid}: Youth Rating ${result.youthRating}, Game Importance ${
          GAME_IMPORTANCE_LABELS[result.gameImportance] ?? result.gameImportance
        }.`,
      )
    } catch (err) {
      setError(String(err))
      setStatus('검색 실패.')
    } finally {
      setBusy(false)
    }
  }

  const chooseCandidate = async (candidate: NationCandidate) => {
    setError(null)
    setBusy(true)
    setStatus('국가 확정 중...')
    try {
      const result = await invoke<NationScanResult>('select_nation', {
        uid: candidate.uid,
        nation: candidate.nation,
      })
      setInfo(result)
      setCandidates([])
      setYouthRating(String(result.youthRating))
      setGameImportance(String(result.gameImportance))
      setStatus(
        `${result.name ? result.name + ' · ' : ''}UID ${result.uid}: Youth Rating ${result.youthRating}, Game Importance ${
          GAME_IMPORTANCE_LABELS[result.gameImportance] ?? result.gameImportance
        }.`,
      )
    } catch (err) {
      setError(String(err))
      setStatus('확정 실패.')
    } finally {
      setBusy(false)
    }
  }

  const apply = async () => {
    if (!info) return
    setError(null)
    const yr = Number(youthRating)
    const gi = Number(gameImportance)
    if (!Number.isInteger(yr) || yr < 1 || yr > 200) {
      setError('Youth Rating은 1~200 사이의 정수여야 합니다.')
      return
    }
    if (!Number.isInteger(gi) || gi < 1 || gi > 4) {
      setError('Game Importance는 1~4 사이의 정수여야 합니다.')
      return
    }
    setBusy(true)
    setStatus('적용 중...')
    try {
      const result = await invoke<NationScanResult>('apply_nation_changes', {
        youthRating: yr !== info.youthRating ? yr : null,
        gameImportance: gi !== info.gameImportance ? gi : null,
      })
      setInfo(result)
      setYouthRating(String(result.youthRating))
      setGameImportance(String(result.gameImportance))
      setStatus(`적용 완료: Youth Rating ${result.youthRating}, Game Importance ${result.gameImportance}.`)
    } catch (err) {
      setError(String(err))
      setStatus('적용 실패.')
    } finally {
      setBusy(false)
    }
  }

  const refresh = async () => {
    if (!info) return
    setError(null)
    setBusy(true)
    setStatus('현재 메모리 값 다시 읽는 중...')
    try {
      const result = await invoke<NationScanResult>('read_nation_fields')
      setInfo(result)
      setYouthRating(String(result.youthRating))
      setGameImportance(String(result.gameImportance))
      setStatus(`다시 읽음: Youth Rating ${result.youthRating}, Game Importance ${result.gameImportance}.`)
    } catch (err) {
      setError(String(err))
      setStatus('재조회 실패.')
    } finally {
      setBusy(false)
    }
  }

  const dirty =
    info != null &&
    (Number(youthRating) !== info.youthRating || Number(gameImportance) !== info.gameImportance)

  return (
    <section className="nation-workspace" style={{ padding: '24px 32px', display: 'flex', flexDirection: 'column', gap: 24 }}>
      <section className="search-strip">
        <label>
          <span>UID</span>
          <input
            value={uid}
            onChange={(e) => setUid(e.target.value)}
            placeholder="UID 입력"
            onKeyDown={(e) => {
              if (e.key === 'Enter' && !busy) searchNation()
            }}
          />
        </label>
        <button type="button" className="primary-action" disabled={busy || !connected} onClick={searchNation}>
          {busy ? <Loader2 size={17} className="spin" /> : <Search size={17} />}
          검색
        </button>
        <div className="scan-note">{status}</div>
      </section>

      {error && (
        <div
          className="safety-note"
          style={{ color: '#ff6b6b', background: 'rgba(255, 107, 107, 0.08)', padding: 12, borderRadius: 8 }}
        >
          <CircleAlert size={16} />
          {error}
        </div>
      )}

      {candidates.length > 0 && (
        <section
          className="editor-surface"
          style={{ display: 'flex', flexDirection: 'column', gap: 12, padding: 24 }}
        >
          <header style={{ display: 'flex', flexDirection: 'column', gap: 4 }}>
            <h2 style={{ margin: 0, fontSize: 17 }}>후보 {candidates.length}개</h2>
            <p style={{ margin: 0, opacity: 0.7, fontSize: 13 }}>
              같은 UID를 가진 객체가 여러 개 잡혔습니다. 게임 내 국가 이름·Youth Rating과 대조해 올바른
              것을 선택하세요. (vtable 득표가 높을수록 진짜 국가일 확률이 높습니다.)
            </p>
          </header>
          <div style={{ display: 'flex', flexDirection: 'column', gap: 8 }}>
            {candidates.map((candidate) => (
              <button
                type="button"
                key={candidate.nation}
                disabled={busy}
                onClick={() => chooseCandidate(candidate)}
                style={{
                  display: 'flex',
                  alignItems: 'center',
                  justifyContent: 'space-between',
                  gap: 16,
                  padding: '10px 14px',
                  borderRadius: 8,
                  textAlign: 'left',
                  cursor: 'pointer',
                }}
              >
                <span style={{ display: 'flex', flexDirection: 'column', gap: 2 }}>
                  <strong style={{ fontSize: 14 }}>{candidate.name ?? '이름 미확인'}</strong>
                  <span style={{ opacity: 0.55, fontSize: 11, fontFamily: 'monospace' }}>
                    {candidate.nation}
                  </span>
                </span>
                <span style={{ display: 'flex', gap: 14, alignItems: 'center', fontSize: 12 }}>
                  <span>YR {candidate.youthRating}</span>
                  <span>
                    GI {GAME_IMPORTANCE_LABELS[candidate.gameImportance] ?? candidate.gameImportance}
                  </span>
                  <span style={{ opacity: 0.6 }}>vtable ×{candidate.vtableVotes}</span>
                </span>
              </button>
            ))}
          </div>
        </section>
      )}

      {info ? (
        <section
          className="editor-surface"
          style={{ display: 'flex', flexDirection: 'column', gap: 20, padding: 24 }}
        >
          <header style={{ display: 'flex', flexDirection: 'column', gap: 4 }}>
            <h2 style={{ margin: 0 }}>{info.name ? `${info.name} · UID ${info.uid}` : `UID ${info.uid}`}</h2>
            <p style={{ margin: 0, opacity: 0.7, fontSize: 13 }}>
              유소년 관련 현재 메모리 값만 표시합니다.
            </p>
          </header>

          <div style={{ display: 'grid', gridTemplateColumns: '1fr 1fr', gap: 20 }}>
            <label style={{ display: 'flex', flexDirection: 'column', gap: 6 }}>
              <span style={{ opacity: 0.8, fontSize: 13 }}>Youth Rating (1~200)</span>
              <input
                type="number"
                min={1}
                max={200}
                value={youthRating}
                onChange={(e) => setYouthRating(e.target.value)}
                style={{ padding: 8, borderRadius: 6 }}
              />
              <span style={{ opacity: 0.5, fontSize: 11 }}>
                현재 메모리 값: {info.youthRating}
              </span>
            </label>
            <label style={{ display: 'flex', flexDirection: 'column', gap: 6 }}>
              <span style={{ opacity: 0.8, fontSize: 13 }}>Game Importance (1~4)</span>
              <select
                value={gameImportance}
                onChange={(e) => setGameImportance(e.target.value)}
                style={{ padding: 8, borderRadius: 6 }}
              >
                <option value="1">{GAME_IMPORTANCE_LABELS[1]}</option>
                <option value="2">{GAME_IMPORTANCE_LABELS[2]}</option>
                <option value="3">{GAME_IMPORTANCE_LABELS[3]}</option>
                <option value="4">{GAME_IMPORTANCE_LABELS[4]}</option>
              </select>
              <span style={{ opacity: 0.5, fontSize: 11 }}>
                현재 메모리 값: {GAME_IMPORTANCE_LABELS[info.gameImportance] ?? info.gameImportance}
              </span>
            </label>
          </div>

          <div style={{ display: 'flex', gap: 12, alignItems: 'center' }}>
            <button type="button" className="primary-action" disabled={busy || !dirty} onClick={apply}>
              {busy ? <Loader2 size={17} className="spin" /> : <CheckCircle2 size={17} />}
              적용
            </button>
            <button type="button" className="soft-action" disabled={busy} onClick={refresh}>
              <RotateCcw size={16} />
              다시 읽기
            </button>
            <div className="safety-note" style={{ marginLeft: 'auto' }}>
              <CircleAlert size={16} />
              적용 후에만 메모리에 씁니다. 게임 진행에 따라 다시 흔들릴 수 있어 인테이크 직전에 적용하세요.
            </div>
          </div>
        </section>
      ) : (
        <section className="editor-surface" style={{ padding: 24, opacity: 0.7 }}>
          <p style={{ margin: 0 }}>
            UID를 입력하면 해당 레코드의 Youth Rating과 Game Importance를 편집할 수 있습니다.
          </p>
        </section>
      )}
    </section>
  )
}

function NavButton({ icon, label, active, onClick }: { icon: ReactNode; label: string; active: boolean; onClick: () => void }) {
  return (
    <button type="button" className={active ? 'nav-button active' : 'nav-button'} onClick={onClick}>
      {icon}
      <span>{label}</span>
    </button>
  )
}

function SavedPlayerList({
  title,
  icon,
  players,
  onSelect,
}: {
  title: string
  icon: ReactNode
  players: SavedPlayer[]
  onSelect: (player: SavedPlayer) => void
}) {
  return (
    <section className="saved-panel">
      <div className="saved-panel-title">
        {icon}
        <h3>{title}</h3>
      </div>
      {players.length === 0 ? (
        <p>저장된 선수가 없습니다.</p>
      ) : (
        <div className="saved-list">
          {players.map((player) => (
            <button type="button" key={player.uid} onClick={() => onSelect(player)}>
              <span>{player.name ?? `UID ${player.uid}`}</span>
              <strong>UID {player.uid}</strong>
            </button>
          ))}
        </div>
      )}
    </section>
  )
}

function AttributesView({
  groups,
  values,
  onChange,
}: {
  groups: Record<'기술' | '정신' | '신체' | '골키퍼', FieldDef[]> & { hidden: FieldDef[] }
  values: Values
  onChange: (key: string, label: string, from: FieldValue, to: FieldValue) => void
}) {
  return (
    <div className="editor-page">
      <PageTitle title="능력치" />
      <div className="attribute-board">
        {(['기술', '정신', '신체', '골키퍼'] as const).map((group) => (
          <section key={group} className="attribute-column">
            <h3>{group}</h3>
            {groups[group].map((field) => (
              <NumberRow key={field.key} field={field} value={values[field.key]} onChange={onChange} />
            ))}
          </section>
        ))}
      </div>
    </div>
  )
}

function NumberRow({
  field,
  value,
  onChange,
}: {
  field: FieldDef
  value: FieldValue | undefined
  onChange: (key: string, label: string, from: FieldValue, to: FieldValue) => void
}) {
  const numeric = typeof value === 'number' ? value : ''
  return (
    <label className="attribute-row">
      <span>{field.label}</span>
      <input
        type="number"
        min={field.min}
        max={field.max}
        disabled={value === undefined}
        value={numeric}
        placeholder="-"
        onChange={(event) => onChange(field.key, field.label, Number(value ?? 0), Number(event.target.value))}
      />
    </label>
  )
}

function PositionsView({
  values,
  onChange,
}: {
  values: Values
  onChange: (key: string, label: string, from: FieldValue, to: FieldValue) => void
}) {
  return (
    <div className="editor-page">
      <PageTitle title="포지션 적합도" description="포지션별 수치를 그대로 배치해 한눈에 분포를 빠르게 확인합니다." />
      <div className="pitch">
        {positions.map((position) => {
          const value = Number(values[position.key] ?? 0)
          return (
            <label
              key={position.key}
              className={`position-chip tone-${ratingTone(value)}`}
              style={{ left: `${position.x}%`, top: `${position.y}%` }}
            >
              <span>{position.label}</span>
              <input
                type="number"
                min={1}
                max={20}
                disabled={values[position.key] === undefined}
                value={values[position.key] === undefined ? '' : value}
                onChange={(event) => onChange(position.key, position.label, value, Number(event.target.value))}
              />
            </label>
          )
        })}
      </div>
    </div>
  )
}

function TraitsView({
  values,
  onChange,
}: {
  values: Values
  onChange: (key: string, label: string, from: FieldValue, to: FieldValue) => void
}) {
  return (
    <div className="editor-page">
      <PageTitle title="선호 플레이" />
      <div className="trait-groups">
        {traitGroups.map((group) => (
          <section key={group.title} className="trait-group">
            <h3>{group.title}</h3>
            <div className="trait-tags">
              {group.traits.map(([key, label]) => {
                const active = values[key] === true
                return (
                  <button
                    type="button"
                    key={key}
                    disabled={values[key] === undefined}
                    className={active ? 'trait-tag active' : 'trait-tag'}
                    onClick={() => onChange(key, label, active, !active)}
                  >
                    {label}
                  </button>
                )
              })}
            </div>
          </section>
        ))}
      </div>
    </div>
  )
}

function PrivateView({
  fields,
  revealed,
  values,
  onReveal,
  onChange,
}: {
  fields: FieldDef[]
  revealed: Record<string, boolean>
  values: Values
  onReveal: (key: string) => void
  onChange: (key: string, label: string, from: FieldValue, to: FieldValue) => void
}) {
  return (
    <div className="editor-page">
      <PageTitle title="히든 능력치" />
      <div className="private-list">
        {fields.map((field) => {
          const visible = revealed[field.key]
          return (
            <article key={field.key} className="private-row">
              <div>
                <span>{field.label}</span>
                {visible ? (
                  <input
                    type="number"
                    min={field.min}
                    max={field.max}
                    value={typeof values[field.key] === 'number' ? Number(values[field.key]) : ''}
                    onChange={(event) => onChange(field.key, field.label, Number(values[field.key] ?? 0), Number(event.target.value))}
                  />
                ) : (
                  <strong>숨겨짐</strong>
                )}
              </div>
              <button type="button" className="soft-action" onClick={() => onReveal(field.key)}>
                {visible ? <EyeOff size={16} /> : <Eye size={16} />}
                {visible ? '가리기' : '보기'}
              </button>
            </article>
          )
        })}
      </div>
    </div>
  )
}

function ratingTierFromBand(band: string): string {
  const num = parseInt(band.split('-')[0], 10)
  if (isNaN(num)) return 'low'
  if (num >= 190) return 'elite'
  if (num >= 180) return 'top'
  if (num >= 170) return 'high'
  if (num >= 160) return 'mid-high'
  if (num >= 140) return 'mid'
  return 'low'
}

function candidateDesignBasis(candidate: ScoutingCandidate): CandidateDesignBasis {
  return candidate.age != null && candidate.age > 24 ? 'ca' : 'pa'
}

function cardScoreFromTwenty(value: number) {
  return Math.round(Math.max(0, Math.min(20, value)) * 5)
}


function PlayerFace({ uid, className }: { uid?: number | null; className: string }) {
  const [image, setImage] = useState<{ uid?: number | null; src: string; missing: boolean }>({
    uid: null,
    src: '',
    missing: false,
  })

  useEffect(() => {
    let active = true
    if (!uid) return () => {
      active = false
    }

    const isTauri = typeof window !== 'undefined' && '__TAURI_INTERNALS__' in window
    if (!isTauri) {
      Promise.resolve().then(() => {
        if (active) setImage({ uid, src: `faces/${uid}.png`, missing: false })
      })
      return () => {
        active = false
      }
    }

    invoke<string | null>('read_player_face', { uid })
      .then((face) => {
        if (active) setImage({ uid, src: face ?? '', missing: false })
      })
      .catch(() => {
        if (active) setImage({ uid, src: '', missing: true })
      })

    return () => {
      active = false
    }
  }, [uid])

  const src = image.uid === uid ? image.src : ''
  const missing = image.uid === uid ? image.missing : false

  return (
    <div className={className}>
      {!missing && src ? (
        <img src={src} alt="" onError={() => setImage({ uid, src: '', missing: true })} />
      ) : (
        <UserRound size={className.includes('detail') ? 46 : 28} />
      )}
    </div>
  )
}

function CandidateCard({
  candidate,
  rank,
  knowledgeLevel,
  basis,
  onClick,
}: {
  candidate: ScoutingCandidate
  rank: number
  knowledgeLevel: number
  basis: CandidateDesignBasis
  onClick?: () => void
}) {
  const basisBand = basis === 'ca' ? candidate.caBand : candidate.paBand
  const tier = ratingTierFromBand(basisBand)
  const canClick = knowledgeLevel >= 3 && Boolean(onClick)
  const octagon = buildPlayerOctagon(candidate)
  const cardOverall = Math.round(candidate.ca / 2)
  const cardStats = octagon.map((metric) => ({
    ...metric,
    displayValue: cardScoreFromTwenty(metric.value),
  }))
  return (
    <div
      className={`candidate-card basis-${basis} tier-${tier}${rank === 0 ? ' card-featured' : ''}${canClick ? ' card-clickable' : ''}`}
      onClick={canClick ? onClick : undefined}
      onKeyDown={canClick ? (event) => {
        if (event.key === 'Enter' || event.key === ' ') {
          event.preventDefault()
          onClick?.()
        }
      } : undefined}
      role={canClick ? 'button' : undefined}
      tabIndex={canClick ? 0 : undefined}
    >
      <div className="card-frame-outer" />
      <div className="card-frame-inner" />
      <div className="card-bg-pattern" />
      <div className="card-shine" />
      <div className="card-photo-area">
        <PlayerFace uid={candidate.uid} className="card-face" />
        <div className="card-photo-fade" />
        <div className="card-rating-overlay">
          <strong className="card-overall">{cardOverall}</strong>
          <span className="card-pos-label">{candidate.position}</span>
        </div>
        <span className="card-pa-badge">{basis.toUpperCase()} {basisBand}</span>
      </div>
      <div className="card-nameplate">
        <div className="card-name">{candidate.label}</div>
        <div className="card-meta-line">
          <span>{candidate.age != null ? `${candidate.age}세` : '나이 미확인'}</span>
          <span className="card-meta-sep">·</span>
          <span>{candidate.nation ?? '국적 미확인'}</span>
        </div>
      </div>
      {cardStats.length > 0 ? (
        <div className="card-stats-row">
          {cardStats.map((metric) => (
            <div key={metric.key} className={`card-stat stat-${abilityTone(metric.value)}`}>
              <span>{metric.short}</span>
              <strong>{metric.displayValue}</strong>
            </div>
          ))}
        </div>
      ) : (
        <div className="card-stats-locked">
          <Shield size={14} />
          <span>3단계부터 공개</span>
        </div>
      )}
      <div className="card-footer">
        <div className="card-intel">
          {candidate.developmentBand && <span className="intel-chip chip-dev">{candidate.developmentBand}</span>}
          {candidate.recommendation && <span className="intel-chip chip-rec">{candidate.recommendation}</span>}
        </div>
        {canClick && (
          <div className="card-click-hint">
            <Eye size={12} />
            <span>상세</span>
          </div>
        )}
      </div>
    </div>
  )
}

function PlayerOctagon({ metrics, compact = false }: { metrics: PlayerOctagonMetric[]; compact?: boolean }) {
  const chartPoints = octagonPoints(metrics.map((metric) => metric.value / 20), 32).join(' ')
  const outerPoints = octagonPoints(new Array(8).fill(1), 32).join(' ')
  const midPoints = octagonPoints(new Array(8).fill(0.66), 32).join(' ')
  const innerPoints = octagonPoints(new Array(8).fill(0.33), 32).join(' ')
  const axisPoints = octagonPoints(new Array(8).fill(1), 32)

  return (
    <div className={compact ? 'player-octagon compact' : 'player-octagon'}>
      <svg viewBox="0 0 100 100" aria-hidden="true">
        <polygon className="octagon-grid outer" points={outerPoints} />
        <polygon className="octagon-grid" points={midPoints} />
        <polygon className="octagon-grid" points={innerPoints} />
        {axisPoints.map((point, index) => (
          <line key={metrics[index]?.key ?? index} className="octagon-axis" x1="50" y1="50" x2={point.split(',')[0]} y2={point.split(',')[1]} />
        ))}
        <polygon className="octagon-fill" points={chartPoints} />
        <polygon className="octagon-line" points={chartPoints} />
      </svg>
      <div className="octagon-metric-list">
        {metrics.map((metric) => (
          <div key={metric.key} className="octagon-metric">
            <span>{compact ? metric.short : metric.label}</span>
            <strong>{Math.round(metric.value)}</strong>
          </div>
        ))}
      </div>
    </div>
  )
}

function PlayerDetailModal({
  candidate,
  onClose,
  onDrilldown,
  drilldownBusy,
  drilldownError,
}: {
  candidate: ScoutingCandidate
  onClose: () => void
  onDrilldown?: (level: 4 | 5) => void
  drilldownBusy?: boolean
  drilldownError?: string | null
}) {
  const basis = candidateDesignBasis(candidate)
  const tier = ratingTierFromBand(basis === 'ca' ? candidate.caBand : candidate.paBand)
  const abilities = candidate.abilities ?? []
  const groupedAbilities = groupAbilities(abilities)
  const octagon = buildPlayerOctagon(candidate)
  // 드릴다운 진행 단계 추정. 유망주(유망주는 uid + comparison 부여 대상)만 드릴다운 가능.
  const isProspectDrilldownTarget =
    candidate.uid != null &&
    Boolean(onDrilldown) &&
    (candidate.age == null || candidate.age <= 24) &&
    candidate.pa >= 150
  const hasL4Data = (candidate.personalityNotes?.length ?? 0) > 0 || (candidate.hiddenNotes?.length ?? 0) > 0 || candidate.personalityHint != null
  const hasL5Data = candidate.riskHint != null
  return (
    <div className="modal-backdrop" onClick={onClose}>
      <div className={`player-detail-modal basis-${basis} tier-${tier}`} onClick={(e) => e.stopPropagation()}>
        <button type="button" className="modal-close" onClick={onClose}>✕</button>
        <div className="detail-header">
          <PlayerFace uid={candidate.uid} className="detail-face" />
          <div className="detail-title-stack">
            <div className="detail-position-badge">{candidate.position}</div>
            <h2 className="detail-name">{candidate.label}</h2>
            {candidate.uid && <span className="detail-uid">UID {candidate.uid}</span>}
          </div>
        </div>
        <div className="detail-summary-grid">
          <BasicInfo label="나이" value={candidate.age != null ? `${candidate.age}세` : '미확인'} />
          <BasicInfo label="국적" value={candidate.nation ?? '미확인'} />
          <BasicInfo label="분류" value={candidate.age == null ? '나이 미확인' : candidate.age > 24 ? '전성기 이상' : '유망주'} />
          <div className="detail-rating compact">
            <span>CA</span>
            <strong>{candidate.ca}</strong>
            <small>{candidate.caBand}</small>
          </div>
          <div className="detail-rating compact accent">
            <span>PA</span>
            <strong>{candidate.pa}</strong>
            <small>{candidate.paBand}</small>
          </div>
        </div>
        <div className="detail-intel-grid compact">
          {candidate.developmentBand && (
            <div className="detail-intel-item">
              <small>성장 등급</small>
              <strong>{candidate.developmentBand}</strong>
            </div>
          )}
          {candidate.recommendation && (
            <div className="detail-intel-item">
              <small>추천 등급</small>
              <strong>{candidate.recommendation}</strong>
            </div>
          )}
          {candidate.personalityHint && (
            <div className="detail-intel-item">
              <small>성향</small>
              <strong>{candidate.personalityHint}</strong>
            </div>
          )}
          {candidate.riskHint && (
            <div className="detail-intel-item risk">
              <small>리스크</small>
              <strong>{candidate.riskHint}</strong>
            </div>
          )}
        </div>
        {candidate.comparisonPhrase && (
          <blockquote className="detail-comparison-quote">
            <Sparkles size={14} />
            {candidate.comparisonPhrase}
          </blockquote>
        )}
        {candidate.comparisons.length > 0 && (
          <div className="detail-section detail-section-compact">
            <h4>플레이 유사 선수</h4>
            <div className="detail-comp-chips">
              {candidate.comparisons.map((name) => (
                <span key={name} className="intel-chip chip-comp">{name}</span>
              ))}
            </div>
          </div>
        )}
        {/* 드릴다운 액션 + 결과를 한 블록에. 버튼 누르면 같은 블록 안에서 즉시 새 섹션이 펼쳐진다. */}
        {(isProspectDrilldownTarget || hasL4Data || hasL5Data) && (
          <div className="detail-drilldown-block">
            {isProspectDrilldownTarget && (
              <div className="detail-drilldown-actions">
                {!hasL4Data && (
                  <button
                    type="button"
                    className="drilldown-btn drilldown-l4"
                    disabled={drilldownBusy}
                    onClick={() => onDrilldown?.(4)}
                  >
                    {drilldownBusy ? '분석 중…' : '선수 밀착 스카우팅 (4단계)'}
                  </button>
                )}
                {hasL4Data && !hasL5Data && (
                  <button
                    type="button"
                    className="drilldown-btn drilldown-l5"
                    disabled={drilldownBusy}
                    onClick={() => onDrilldown?.(5)}
                  >
                    {drilldownBusy ? '관찰 중…' : '선수 동행 관찰 (5단계)'}
                  </button>
                )}
                {hasL5Data && <span className="drilldown-done">동행 관찰까지 완료 · 더 이상의 추가 분석 없음</span>}
                {drilldownError && <span className="drilldown-error">{drilldownError}</span>}
              </div>
            )}
            {candidate.personalityNotes && candidate.personalityNotes.length > 0 && (
              <div className="detail-section detail-section-compact">
                <h4>성격 정찰 일화</h4>
                <div className="detail-personality-list">
                  {candidate.personalityNotes.map((note) => (
                    <p key={note}>{note}</p>
                  ))}
                </div>
              </div>
            )}
            {candidate.hiddenNotes && candidate.hiddenNotes.length > 0 && (
              <div className="detail-section detail-section-compact">
                <h4>히든 인텔 일화</h4>
                <div className="detail-hidden-list">
                  {candidate.hiddenNotes.map((note) => (
                    <p key={note}>{note}</p>
                  ))}
                </div>
              </div>
            )}
            {candidate.riskDetails && (
              <div className="detail-section detail-section-compact">
                <h4>리스크 분석</h4>
                <div className="detail-risk-grid">
                  <RiskDetail label="부상 내구성" value={candidate.riskDetails.injury} />
                  <RiskDetail label="경기력 안정성" value={candidate.riskDetails.consistency} />
                  <RiskDetail label="빅매치 적응" value={candidate.riskDetails.bigMatches} />
                  <RiskDetail label="압박 대처" value={candidate.riskDetails.pressure} />
                </div>
                <p className="detail-risk-note">{candidate.riskDetails.note}</p>
              </div>
            )}
          </div>
        )}
        {octagon.length > 0 && (
          <div className="detail-section detail-section-compact">
            <h4>8대 능력치</h4>
            <div className="detail-octagon-card compact">
              <PlayerOctagon metrics={octagon} />
            </div>
          </div>
        )}
        {abilities.length > 0 && (
          <div className="detail-section detail-section-compact">
            <h4>능력치</h4>
            <div className="detail-ability-flow">
              {Object.entries(groupedAbilities).map(([category, abilities]) => (
                <Fragment key={category}>
                  <span className="detail-ability-cat">{abilityCategoryLabel(category)}</span>
                  {abilities.map((ability) => (
                    <span
                      key={`${category}-${ability.label}`}
                      className={`detail-ability-chip ability-${abilityTone(ability.value)}`}
                    >
                      <span>{ability.label}</span>
                      <strong>{ability.value}</strong>
                    </span>
                  ))}
                </Fragment>
              ))}
            </div>
          </div>
        )}
      </div>
    </div>
  )
}

function BasicInfo({ label, value }: { label: string; value: string }) {
  return (
    <div className="detail-basic-item">
      <small>{label}</small>
      <strong>{value}</strong>
    </div>
  )
}

function groupAbilities(abilities: ScoutingAbility[]) {
  return abilities.reduce<Record<string, ScoutingAbility[]>>((groups, ability) => {
    const key = ability.category
    groups[key] = groups[key] ?? []
    groups[key].push(ability)
    return groups
  }, {})
}

function buildPlayerOctagon(candidate: ScoutingCandidate): PlayerOctagonMetric[] {
  const abilities = new Map(candidate.abilities.map((ability) => [normalizeAbilityLabel(ability.label), ability.value]))
  if (abilities.size === 0) return []

  const metric = (key: string, label: string, short: string, groups: string[][]): PlayerOctagonMetric => ({
    key,
    label,
    short,
    value: averageAbilityGroups(abilities, groups),
  })

  if (candidate.position === 'GK') {
    return [
      metric('shot-stopping', '슈팅 방어', '방어', [['반사 신경', '반사신경'], ['일대일 방어']]),
      metric('aerial', '공중볼 장악', '공중', [['공중 장악력', '공중볼 장악력'], ['핸들링'], ['점프 거리']]),
      metric('command', '수비 조율', '조율', [['수비 조율'], ['장악력', '페널티 박스 장악력']]),
      metric('distribution', '볼 분배', '분배', [['킥'], ['던지기'], ['패스'], ['시야']]),
      metric('sweeping', '스위핑', '스윕', [['뛰쳐나가기', '돌진'], ['예측력']]),
      metric('speed', '스피드', '속도', [['주력'], ['순간 속도', '순발력']]),
      metric('physical', '피지컬', '피지컬', [['몸싸움'], ['민첩성'], ['균형 감각']]),
      metric('mental', '멘탈', '멘탈', [['위치 선정', '수비 위치 선정'], ['침착성'], ['집중력'], ['판단력']]),
    ]
  }

  return [
    metric('speed', '스피드', '속도', [['주력'], ['순간 속도', '순발력']]),
    metric('aerial', '공중볼', '공중', [['점프 거리'], ['헤더']]),
    metric('vision', '시야', '시야', [['시야'], ['패스'], ['천재성']]),
    metric('attacking', '공격', '공격', [['골 결정력'], ['오프 더 볼', '공격 위치 선정'], ['침착성']]),
    metric('technique', '테크닉', '기술', [['개인기'], ['퍼스트 터치'], ['드리블']]),
    metric('defending', '수비', '수비', [['태클'], ['마크', '일대일 마크'], ['위치 선정', '수비 위치 선정']]),
    metric('physical', '피지컬', '피지컬', [['몸싸움'], ['지구력'], ['균형 감각'], ['민첩성']]),
    metric('mental', '멘탈', '멘탈', [['승부욕'], ['판단력'], ['예측력'], ['팀워크'], ['대담성'], ['집중력']]),
  ]
}

function averageAbilityGroups(abilities: Map<string, number>, groups: string[][]) {
  const values = groups
    .map((labels) => labels.map((label) => abilities.get(normalizeAbilityLabel(label))).find((value): value is number => typeof value === 'number'))
    .filter((value): value is number => typeof value === 'number')

  if (values.length === 0) return 0
  return values.reduce((sum, value) => sum + value, 0) / values.length
}

function normalizeAbilityLabel(label: string) {
  return label.trim().replace(/\s+/g, ' ')
}

function octagonPoints(values: number[], radius: number) {
  return values.map((value, index) => {
    const angle = -Math.PI / 2 + index * (Math.PI / 4)
    const clamped = Math.max(0, Math.min(1, value))
    const x = 50 + Math.cos(angle) * radius * clamped
    const y = 50 + Math.sin(angle) * radius * clamped
    return `${x.toFixed(2)},${y.toFixed(2)}`
  })
}

function abilityCategoryLabel(category: string) {
  if (category === 'technical') return '기술'
  if (category === 'mental') return '정신'
  if (category === 'physical') return '신체'
  if (category === 'goalkeeping') return '골키퍼'
  return category
}

function abilityTone(value: number) {
  if (value >= 17) return 'elite'
  if (value >= 14) return 'good'
  if (value >= 10) return 'ok'
  return 'low'
}

function RiskDetail({ label, value }: { label: string; value: string }) {
  const riskLevel = value === '위험' || value === '고위험' ? 'danger' : value === '주의' || value === '검증 필요' ? 'warn' : 'safe'
  return (
    <span className={`risk-detail risk-${riskLevel}`}>
      <small>{label}</small>
      <strong>{value}</strong>
    </span>
  )
}

function NarrativeBlock({ text }: { text?: string }) {
  if (!text) return null
  return (
    <div className="report-narrative">
      {text.split('\n\n').map((paragraph, index) => (
        <p key={`${index}-${paragraph}`} style={{ margin: index === 0 ? 0 : '0.5rem 0 0' }}>
          {index === 0 && <Sparkles size={14} style={{ display: 'inline', marginRight: '5px', verticalAlign: 'text-bottom', color: 'var(--accent)' }} />}
          {paragraph.split('\n').map((line, lineIndex) => (
            <Fragment key={`${line}-${lineIndex}`}>
              {lineIndex > 0 && <br />}
              {renderNarrativeInline(line, `${index}-${lineIndex}`)}
            </Fragment>
          ))}
        </p>
      ))}
    </div>
  )
}

function renderNarrativeInline(text: string, keyPrefix: string): ReactNode[] {
  const nodes: ReactNode[] = []
  let cursor = 0
  let key = 0

  while (cursor < text.length) {
    const start = text.indexOf('**', cursor)
    if (start < 0) {
      nodes.push(<Fragment key={`${keyPrefix}-t-${key}`}>{text.slice(cursor)}</Fragment>)
      break
    }

    const end = text.indexOf('**', start + 2)
    if (end < 0) {
      nodes.push(<Fragment key={`${keyPrefix}-t-${key}`}>{text.slice(cursor)}</Fragment>)
      break
    }

    if (start > cursor) {
      nodes.push(<Fragment key={`${keyPrefix}-t-${key++}`}>{text.slice(cursor, start)}</Fragment>)
    }

    const strongText = text.slice(start + 2, end)
    nodes.push(<strong key={`${keyPrefix}-b-${key++}`}>{strongText}</strong>)
    cursor = end + 2
  }

  return nodes
}

function CandidateSection({
  title,
  emptyText,
  candidates,
  knowledgeLevel,
  basis,
  onSelect,
}: {
  title: string
  emptyText: string
  candidates: ScoutingCandidate[]
  knowledgeLevel: number
  basis: CandidateDesignBasis
  onSelect: (candidate: ScoutingCandidate) => void
}) {
  return (
    <section className="candidates-section">
      <h3><Star size={16} /> {title}</h3>
      <div className="candidate-grid">
        {candidates.length === 0 ? (
          <p className="no-candidates">{emptyText}</p>
        ) : (
          candidates.map((candidate, i) => (
            <CandidateCard
              key={`${title}-${candidate.label}-${candidate.uid ?? candidate.position}`}
              candidate={candidate}
              rank={i}
              knowledgeLevel={knowledgeLevel}
              basis={basis}
              onClick={() => onSelect(candidate)}
            />
          ))
        )}
      </div>
    </section>
  )
}

type CountryFocus = {
  name: string
  display: string
  geoName: string
  region: string
  lat: number
  lng: number
  x: number
  y: number
  accent: string
  mapPath: string
  markerX: number
  markerY: number
}

type WorldCountryFeature = {
  type: 'Feature'
  properties: { name: string }
  geometry: {
    type: 'Polygon' | 'MultiPolygon'
    coordinates: unknown[]
  }
}

type ClubGlobeMarker = {
  id: string
  name: string
  nation: string
  playerCount: number
  lat: number
  lng: number
  accent: string
}

const COUNTRY_FOCI: CountryFocus[] = [
  { name: '잉글랜드', display: 'England', geoName: 'United Kingdom', region: 'Europe', lat: 52.4, lng: -1.6, x: 48, y: 30, accent: '#b8ff3d', mapPath: 'polygon(35% 10%, 56% 8%, 69% 24%, 63% 43%, 73% 58%, 58% 84%, 39% 76%, 30% 54%, 20% 44%, 30% 28%)', markerX: 54, markerY: 55 },
  { name: '스페인', display: 'Spain', geoName: 'Spain', region: 'Europe', lat: 40.2, lng: -3.7, x: 45, y: 39, accent: '#ffdf4d', mapPath: 'polygon(15% 24%, 48% 12%, 79% 22%, 85% 50%, 65% 78%, 26% 74%, 12% 54%)', markerX: 53, markerY: 45 },
  { name: '독일', display: 'Germany', geoName: 'Germany', region: 'Europe', lat: 51.1, lng: 10.2, x: 51, y: 33, accent: '#5bf0ff', mapPath: 'polygon(39% 8%, 62% 14%, 76% 34%, 68% 63%, 55% 83%, 31% 78%, 21% 52%, 28% 27%)', markerX: 51, markerY: 47 },
  { name: '프랑스', display: 'France', geoName: 'France', region: 'Europe', lat: 46.2, lng: 2.2, x: 47, y: 36, accent: '#7da8ff', mapPath: 'polygon(28% 15%, 61% 12%, 82% 35%, 72% 69%, 47% 86%, 19% 65%, 13% 34%)', markerX: 52, markerY: 48 },
  { name: '이탈리아', display: 'Italy', geoName: 'Italy', region: 'Europe', lat: 42.8, lng: 12.5, x: 51, y: 42, accent: '#39f093', mapPath: 'polygon(27% 8%, 52% 13%, 62% 35%, 77% 48%, 65% 61%, 77% 83%, 61% 91%, 45% 68%, 35% 48%, 19% 32%)', markerX: 54, markerY: 54 },
  { name: '포르투갈', display: 'Portugal', geoName: 'Portugal', region: 'Europe', lat: 39.5, lng: -8.0, x: 42, y: 39, accent: '#ff6f91', mapPath: 'polygon(41% 12%, 63% 17%, 58% 82%, 35% 88%, 29% 54%)', markerX: 47, markerY: 50 },
  { name: '네덜란드', display: 'Netherlands', geoName: 'Netherlands', region: 'Europe', lat: 52.1, lng: 5.3, x: 49, y: 31, accent: '#ff9f43', mapPath: 'polygon(38% 11%, 60% 13%, 72% 35%, 62% 70%, 40% 85%, 27% 54%)', markerX: 52, markerY: 42 },
  { name: '브라질', display: 'Brazil', geoName: 'Brazil', region: 'South America', lat: -14.2, lng: -51.9, x: 39, y: 64, accent: '#31f07b', mapPath: 'polygon(31% 9%, 64% 13%, 85% 38%, 76% 72%, 48% 92%, 22% 72%, 14% 36%)', markerX: 54, markerY: 48 },
  { name: '아르헨티나', display: 'Argentina', geoName: 'Argentina', region: 'South America', lat: -34.0, lng: -64.0, x: 34, y: 75, accent: '#5fc7ff', mapPath: 'polygon(47% 6%, 65% 17%, 58% 44%, 69% 63%, 52% 92%, 34% 78%, 39% 48%, 28% 24%)', markerX: 50, markerY: 55 },
  { name: '미국', display: 'United States', geoName: 'United States of America', region: 'North America', lat: 39.3, lng: -98.6, x: 23, y: 40, accent: '#89a7ff', mapPath: 'polygon(10% 27%, 39% 13%, 72% 21%, 90% 45%, 74% 68%, 36% 78%, 12% 58%)', markerX: 55, markerY: 48 },
  { name: '대한민국', display: 'South Korea', geoName: 'South Korea', region: 'Asia', lat: 36.5, lng: 127.8, x: 78, y: 43, accent: '#ff5c7a', mapPath: 'polygon(46% 8%, 62% 18%, 70% 39%, 60% 68%, 45% 90%, 31% 69%, 36% 43%, 29% 22%)', markerX: 52, markerY: 48 },
  { name: '일본', display: 'Japan', geoName: 'Japan', region: 'Asia', lat: 36.2, lng: 138.3, x: 82, y: 44, accent: '#ff7a59', mapPath: 'polygon(50% 7%, 64% 18%, 58% 33%, 70% 48%, 56% 66%, 63% 88%, 44% 80%, 50% 59%, 37% 44%, 45% 27%)', markerX: 55, markerY: 50 },
]

const DEFAULT_COUNTRY = COUNTRY_FOCI[0]
const WORLD_COUNTRIES = feature(
  countriesTopo as never,
  (countriesTopo as { objects: { countries: unknown } }).objects.countries as never,
) as unknown as { features: WorldCountryFeature[] }
const WORLD_COUNTRY_FEATURES = WORLD_COUNTRIES.features
const GLOBE_PIXEL_RATIO = 0.8

const COUNTRY_ALIASES: Record<string, string> = {
  england: '잉글랜드',
  english: '잉글랜드',
  uk: '잉글랜드',
  'united kingdom': '잉글랜드',
  spain: '스페인',
  spanish: '스페인',
  germany: '독일',
  german: '독일',
  france: '프랑스',
  french: '프랑스',
  italy: '이탈리아',
  italian: '이탈리아',
  portugal: '포르투갈',
  portuguese: '포르투갈',
  netherlands: '네덜란드',
  holland: '네덜란드',
  brazil: '브라질',
  argentina: '아르헨티나',
  'united states': '미국',
  usa: '미국',
  korea: '대한민국',
  'south korea': '대한민국',
  japan: '일본',
}

function normalizeCountryKey(value?: string | null) {
  return value?.trim().toLowerCase().replace(/[._-]+/g, ' ').replace(/\s+/g, ' ') ?? ''
}

function findCountryFocus(value?: string | null) {
  const normalized = normalizeCountryKey(value)
  if (!normalized) return null
  const alias = COUNTRY_ALIASES[normalized] ?? value
  return COUNTRY_FOCI.find((country) => country.name === alias || normalizeCountryKey(country.display) === normalized) ?? null
}

function findCountryFocusByGeoName(geoName: string) {
  return COUNTRY_FOCI.find((country) => country.geoName === geoName) ?? null
}

function inferClubNation(teamName?: string | null) {
  const name = normalizeCountryKey(teamName)
  if (!name) return null
  const patterns: [RegExp, string][] = [
    [/\b(aston villa|manchester|arsenal|liverpool|chelsea|tottenham|newcastle|west ham|leeds|everton|brighton|wolves|fulham|brentford|crystal palace|nottingham)\b/, '잉글랜드'],
    [/\b(barcelona|real madrid|atletico|valencia|sevilla|villarreal|bilbao|sociedad|betis)\b/, '스페인'],
    [/\b(bayern|dortmund|leverkusen|leipzig|wolfsburg|stuttgart|frankfurt|gladbach)\b/, '독일'],
    [/\b(psg|paris|marseille|lyon|monaco|lille|rennes|nice)\b/, '프랑스'],
    [/\b(juventus|milan|inter|napoli|roma|lazio|atalanta|fiorentina)\b/, '이탈리아'],
    [/\b(benfica|porto|sporting|braga)\b/, '포르투갈'],
    [/\b(ajax|psv|feyenoord|az alkmaar|twente)\b/, '네덜란드'],
    [/\b(fluminense|flamengo|palmeiras|santos|corinthians|sao paulo|gremio)\b/, '브라질'],
    [/\b(river plate|boca|racing club|independiente|san lorenzo)\b/, '아르헨티나'],
    [/\b(seoul|ulsan|jeonbuk|pohang|suwon|daegu|incheon|gwangju)\b/, '대한민국'],
    [/\b(tokyo|kashima|urawa|yokohama|kawasaki|gamba|vissel)\b/, '일본'],
    [/\b(inter miami|la galaxy|lafc|new york|atlanta united|seattle|portland)\b/, '미국'],
  ]
  return patterns.find(([pattern]) => pattern.test(name))?.[1] ?? null
}

function getClubFocus(teamName: string, nation?: string | null) {
  return findCountryFocus(nation) ?? findCountryFocus(inferClubNation(teamName)) ?? DEFAULT_COUNTRY
}

function ScoutingView({
  teamName,
  clubId,
  knowledgeLevel,
  squadInfo,
  report,
  history,
  budget,
  userClub,
  scoutNetwork,
  busy,
  scouts,
  selectedScoutIndex,
  selectedScout,
  onTeamNameChange,
  onClubIdChange,
  onKnowledgeLevelChange,
  onScoutSelect,
  onScoutAdd,
  onScoutRemove,
  onRefreshScouts,
  onCollect,
  onRefreshBudget,
  onBuild,
  onRestoreHistory,
}: {
  teamName: string
  clubId: string
  knowledgeLevel: number
  squadInfo: SquadInfo | null
  report: ScoutingReport | null
  history: ScoutingHistoryEntry[]
  budget: ScoutingBudgetResult | null
  userClub: ClubIdentityResult | null
  scoutNetwork: UserClubScoutsResult | null
  busy: boolean
  scouts: Scout[]
  selectedScoutIndex: number
  selectedScout: Scout | null
  onTeamNameChange: (value: string) => void
  onClubIdChange: (value: string) => void
  onKnowledgeLevelChange: (value: number) => void
  onScoutSelect: (index: number) => void
  onScoutAdd: (scout: Scout) => void
  onScoutRemove: (index: number) => void
  onRefreshScouts: () => void
  onCollect: () => void
  onRefreshBudget: () => void
  onBuild: () => void
  onRestoreHistory: (entry: ScoutingHistoryEntry, report: ScoutingReport, level: number) => void
}) {
  const [showScoutManager, setShowScoutManager] = useState(false)
  const [newScoutName, setNewScoutName] = useState('')
  const [newScoutJca, setNewScoutJca] = useState(10)
  const [newScoutJpa, setNewScoutJpa] = useState(10)
  const [newScoutAdaptability, setNewScoutAdaptability] = useState(10)
  const [selectedCandidate, setSelectedCandidate] = useState<ScoutingCandidate | null>(null)
  const [reportOpenKey, setReportOpenKey] = useState('')
  const [selectedCountryGeoName, setSelectedCountryGeoName] = useState<string | null>(null)
  // 메모리 한정 드릴다운 캐시. uid → L4/L5까지 enrich 된 candidate.
  // 같은 게임 날짜에서는 항상 같은 문구가 재현된다 (백엔드가 game_date 시드 사용).
  const [drilldowns, setDrilldowns] = useState<Record<number, ScoutingCandidate>>({})
  // uid → 드릴다운에서 받은 본문 단락. 팀 보고서에서 해당 선수의 단락을 이것으로 교체한다.
  const [drilldownNarratives, setDrilldownNarratives] = useState<Record<number, string>>({})
  const [drilldownBusy, setDrilldownBusy] = useState(false)
  const [drilldownError, setDrilldownError] = useState<string | null>(null)
  const maxPa = Math.max(1, ...(report?.paBands.map((band) => band.count) ?? [1]))
  const maxCa = Math.max(1, ...(report?.caBands.map((band) => band.count) ?? [1]))
  const stageItems = scoutingStageItems(report?.knowledgeLevel ?? knowledgeLevel)
  const reportLevel = report?.knowledgeLevel ?? knowledgeLevel
  const rawProspectCandidates = report?.prospectCandidates ?? report?.candidates ?? []
  const rawSeniorCandidates = report?.seniorCandidates ?? []
  const prospectCandidates = useMemo(
    () => rawProspectCandidates.map((c) => (c.uid != null && drilldowns[c.uid] ? drilldowns[c.uid] : c)),
    [rawProspectCandidates, drilldowns],
  )
  const seniorCandidates = useMemo(
    () => rawSeniorCandidates.map((c) => (c.uid != null && drilldowns[c.uid] ? drilldowns[c.uid] : c)),
    [rawSeniorCandidates, drilldowns],
  )
  // 모달에 표시될 candidate: 드릴다운 결과가 있으면 그쪽을 우선.
  const modalCandidate = useMemo(() => {
    if (!selectedCandidate) return null
    if (selectedCandidate.uid != null && drilldowns[selectedCandidate.uid]) {
      return drilldowns[selectedCandidate.uid]
    }
    return selectedCandidate
  }, [selectedCandidate, drilldowns])
  // 팀 보고서가 새로 빌드되면 이전 드릴다운은 무효.
  const reportKeySig = report ? `${report.teamName}:${report.squadKind}:${report.knowledgeLevel}` : ''
  useEffect(() => {
    setDrilldowns({})
    setDrilldownNarratives({})
    setDrilldownError(null)
  }, [reportKeySig])

  // 팀 보고서 narrative를 drilldown 결과 swap-in 하여 재조립.
  // 백엔드가 prospectSummaryPrologue + prospectParagraphs를 별도 제공하면 이를 사용한다.
  // 미제공(구버전 호환) 시에는 기존 prospectSummaryNarrative를 그대로 사용.
  const mergedProspectNarrative = useMemo(() => {
    if (!report) return ''
    if (report.prospectParagraphs && report.prospectSummaryPrologue != null) {
      const parts: string[] = []
      if (report.prospectSummaryPrologue) parts.push(report.prospectSummaryPrologue)
      for (const p of report.prospectParagraphs) {
        const body = p.uid != null && drilldownNarratives[p.uid] ? drilldownNarratives[p.uid] : p.body
        parts.push(body)
      }
      return parts.join('\n\n')
    }
    return report.prospectSummaryNarrative ?? ''
  }, [report, drilldownNarratives])

  const mergedSeniorNarrative = useMemo(() => {
    if (!report) return ''
    if (report.seniorParagraphs && report.seniorSummaryPrologue != null) {
      const parts: string[] = []
      if (report.seniorSummaryPrologue) parts.push(report.seniorSummaryPrologue)
      for (const p of report.seniorParagraphs) {
        const body = p.uid != null && drilldownNarratives[p.uid] ? drilldownNarratives[p.uid] : p.body
        parts.push(body)
      }
      return parts.join('\n\n')
    }
    return report.seniorSummaryNarrative ?? ''
  }, [report, drilldownNarratives])

  const mergedSummaryNarrative = useMemo(() => {
    const sections: string[] = []
    if (mergedProspectNarrative) sections.push(mergedProspectNarrative)
    if (mergedSeniorNarrative) sections.push(mergedSeniorNarrative)
    return sections.join('\n\n')
  }, [mergedProspectNarrative, mergedSeniorNarrative])

  const runDrilldown = useCallback(
    async (candidate: ScoutingCandidate, level: 4 | 5) => {
      if (candidate.uid == null) {
        setDrilldownError('선수 UID를 알 수 없어 드릴다운을 수행할 수 없습니다.')
        return
      }
      const rankIndex = rawProspectCandidates.findIndex((c) => c.uid === candidate.uid)
      setDrilldownBusy(true)
      setDrilldownError(null)
      try {
        const result = await invoke<PlayerDetailReport>('scout_player_detail', {
          request: {
            playerUid: candidate.uid,
            knowledgeLevel: level,
            rankIndex: rankIndex >= 0 ? rankIndex : 0,
            scoutJca: selectedScout?.jca ?? null,
            scoutJpa: selectedScout?.jpa ?? null,
          },
        })
        setDrilldowns((prev) => ({ ...prev, [result.playerUid]: result.candidate }))
        if (result.narrative) {
          setDrilldownNarratives((prev) => ({ ...prev, [result.playerUid]: result.narrative }))
        }
      } catch (e) {
        setDrilldownError(String(e))
      } finally {
        setDrilldownBusy(false)
      }
    },
    [rawProspectCandidates, selectedScout],
  )
  const clubFocus = getClubFocus(squadInfo?.teamName ?? teamName, squadInfo?.nation)
  const canOpenReport = Boolean(squadInfo)
  const reportContextKey = squadInfo ? `${squadInfo.inputId}:${squadInfo.teamName}` : ''
  const reportOpen = canOpenReport && reportOpenKey === reportContextKey
  const selectedScoutSignature = selectedScout ? `${selectedScout.jca}:${selectedScout.jpa}` : 'exact'
  const reportScoutSignature = report?.scoutJca != null && report.scoutJpa != null ? `${report.scoutJca}:${report.scoutJpa}` : 'exact'
  const reportNeedsBuild = !report || report.knowledgeLevel !== knowledgeLevel || reportScoutSignature !== selectedScoutSignature
  const costEstimate = useMemo(
    () => estimateScoutingCost({ squadInfo, knowledgeLevel, selectedScout, userClub, budget, history }),
    [budget, history, knowledgeLevel, selectedScout, squadInfo, userClub],
  )
  const countryIntel = useMemo(() => buildCountryIntel(history), [history])
  const selectedCountryIntel = selectedCountryGeoName ? countryIntel[selectedCountryGeoName] ?? null : null
  const selectedCountryLabel = selectedCountryGeoName ? countryLabelFromGeoName(selectedCountryGeoName) : ''
  const reportActionRef = useRef({ busy, canOpenReport, reportContextKey, reportNeedsBuild })
  const onBuildRef = useRef(onBuild)

  useEffect(() => {
    reportActionRef.current = { busy, canOpenReport, reportContextKey, reportNeedsBuild }
  }, [busy, canOpenReport, reportContextKey, reportNeedsBuild])

  useEffect(() => {
    onBuildRef.current = onBuild
  }, [onBuild])

  const openClubReport = useCallback(() => {
    const action = reportActionRef.current
    if (!action.canOpenReport) return
    setReportOpenKey(action.reportContextKey)
    setSelectedCandidate(null)
    if (action.reportNeedsBuild && !action.busy) onBuildRef.current()
  }, [])

  function openHistoryEntry(entry: ScoutingHistoryEntry, targetLevel = entry.bestLevel) {
    const reportToOpen = findStoredReport(entry, targetLevel) ?? findBestStoredReport(entry)
    if (!reportToOpen) return
    onRestoreHistory(entry, reportToOpen, targetLevel)
    setReportOpenKey(`${entry.squadInfo.inputId}:${entry.squadInfo.teamName}`)
    setSelectedCandidate(null)
  }

  return (
    <div className="editor-page">
      <PageTitle title="스카우팅 센터" description="팀 UID로 선수단을 분석하고, 조사 단계에 따라 잠재 능력 구간을 점점 좁힙니다." />
      <div className="scout-layout">
        <section className="scout-form">
          <label>
            <span>스카우트할 팀 ID</span>
            <input
              value={clubId}
              onChange={(event) => onClubIdChange(event.target.value)}
              onKeyDown={(event) => {
                if (event.key === 'Enter') onCollect()
              }}
              placeholder="예: 15671"
            />
          </label>
          <label>
            <span>팀 이름</span>
            <input value={teamName} onChange={(event) => onTeamNameChange(event.target.value)} placeholder="팀 확인 후 자동 입력" readOnly={!squadInfo} />
          </label>
          <label>
            <span>조사 단계</span>
            <select value={knowledgeLevel} onChange={(event) => onKnowledgeLevelChange(Number(event.target.value))}>
              <option value={1}>1단계: 넓은 PA 구간</option>
              <option value={2}>2단계: 중간 PA 구간</option>
              <option value={3}>3단계: 10 단위 구간 + 카드</option>
            </select>
          </label>
          <label>
            <span>배정 스카우터</span>
            <select value={selectedScoutIndex} onChange={(event) => onScoutSelect(Number(event.target.value))}>
              <option value={-1}>스카우터 미배정 (정밀 분석)</option>
              {scouts.map((scout, index) => (
                <option key={`${scout.name}-${index}`} value={index}>
                  {scout.name} (CA판단: {scout.jca}, PA판단: {scout.jpa}{scout.adaptability != null ? `, 적응력: ${scout.adaptability}` : ''})
                </option>
              ))}
            </select>
          </label>
          {selectedScout && (
            <div className="scout-attr-bar">
              <div className="scout-attr">
                <span>CA판단</span>
                <div className="attr-bar-track"><i style={{ width: `${(selectedScout.jca / 20) * 100}%` }} /></div>
                <strong>{selectedScout.jca}</strong>
              </div>
              <div className="scout-attr">
                <span>PA판단</span>
                <div className="attr-bar-track"><i style={{ width: `${(selectedScout.jpa / 20) * 100}%` }} /></div>
                <strong>{selectedScout.jpa}</strong>
              </div>
              <div className="scout-attr">
                <span>적응력</span>
                <div className="attr-bar-track"><i style={{ width: `${((selectedScout.adaptability ?? 0) / 20) * 100}%` }} /></div>
                <strong>{selectedScout.adaptability ?? '-'}</strong>
              </div>
            </div>
          )}
          <div className="scout-manage-row">
            <button type="button" className="soft-action" onClick={() => setShowScoutManager(true)}>
              <UsersRound size={17} />
              스카우터 관리
            </button>
          </div>
          {costEstimate && (
            <div className="scouting-cost-card">
              <div className="squad-summary-head">
                <Calculator size={18} />
                <div>
                  <span>예상 스카우팅 비용</span>
                  <strong>{formatMoney(costEstimate.amount)}</strong>
                </div>
              </div>
              <div className="cost-note">실제 예산은 아직 차감하지 않습니다.</div>
              <div className="cost-factor-grid">
                {costEstimate.factors.map((factor) => (
                  <div key={factor.label}>
                    <span>{factor.label}</span>
                    <strong>{factor.value}</strong>
                  </div>
                ))}
              </div>
              {costEstimate.projectedRemaining != null && (
                <div className="cost-projection">
                  <span>차감 가정 잔액</span>
                  <strong>{formatMoney(costEstimate.projectedRemaining)}</strong>
                </div>
              )}
              <p>{costEstimate.notes.join(' ')}</p>
            </div>
          )}
          <div className="squad-summary-card budget-card">
            <div className="squad-summary-head">
              <ListChecks size={18} />
              <div>
                <span>내 스카우트 예산</span>
                <strong>{budget ? formatMoney(budget.remainingBudget) : '미확인'}</strong>
              </div>
            </div>
            {budget ? (
              <>
                <div className="squad-summary-grid">
                  <Metric label="시즌" value={formatMoney(budget.seasonBudget)} />
                  <Metric label="남은 예산" value={formatMoney(budget.remainingBudget)} />
                </div>
                <div className="squad-breakdown">
                  <div>
                    <span>패키지</span>
                    <strong>{recruitmentPackageLabel(budget.recruitmentPackage)}</strong>
                  </div>
                  <div>
                    <span>무제한</span>
                    <strong>{budget.unlimitedScouting ? '켜짐' : '꺼짐'}</strong>
                  </div>
                </div>
              </>
            ) : (
              <p>유저 팀의 감독 데이터에서 예산을 읽어 확인합니다.</p>
            )}
            <button type="button" className="soft-action scout-soft" disabled={busy} onClick={onRefreshBudget}>
              {busy ? <Loader2 size={17} className="spin" /> : <Search size={17} />}
              예산 읽기
            </button>
          </div>
          {squadInfo ? (
            <div className="squad-summary-card">
              <div className="squad-summary-head">
                <Building2 size={18} />
                <div>
                  <span>스카우팅 대상</span>
                  <strong>{squadInfo.teamName}</strong>
                </div>
              </div>
              <div className="squad-summary-grid">
                <Metric label="선수" value={`${squadInfo.playerCount}명`} />
                <Metric label="선수단" value={`${squadInfo.teamCount}개`} />
                <Metric label="국가" value={squadInfo.nation ?? clubFocus.name} />
                <Metric label="명성" value={formatReputation(squadInfo.reputation)} />
              </div>
              <div className="squad-breakdown">
                {squadInfo.squads.map((squad) => (
                  <div key={`${squad.teamType}-${squad.teamTypeLabel}`}>
                    <span>{squad.teamTypeLabel}</span>
                    <strong>{squad.playerCount}명</strong>
                  </div>
                ))}
              </div>
            </div>
          ) : (
            <div className="squad-summary-card empty">
              <Building2 size={18} />
              <p>팀 ID를 확인하면 구단명과 선수단 구성이 여기에 표시됩니다.</p>
            </div>
          )}
          <div className="scout-collect-row">
            <button type="button" className="soft-action scout-soft" disabled={busy} onClick={onCollect}>
              {busy ? <Loader2 size={17} className="spin" /> : <Search size={17} />}
              팀 ID 확인
            </button>
          </div>
          <button type="button" className="primary-action scout-build" disabled={busy || !squadInfo} onClick={openClubReport}>
            {busy ? <Loader2 size={17} className="spin" /> : <Search size={17} />}
            {reportNeedsBuild ? `${knowledgeLevel}단계 리포트 생성` : '리포트 열기'}
          </button>
        </section>

        <section className="scout-report">
          <ScoutWorldFocus
            key={reportContextKey || 'scout-world-idle'}
            teamName={squadInfo?.teamName ?? teamName}
            clubId={clubId}
            focus={clubFocus}
            squadInfo={squadInfo}
            countryIntel={countryIntel}
            selectedCountryGeoName={selectedCountryGeoName}
            selectedCountryIntel={selectedCountryIntel}
            selectedCountryLabel={selectedCountryLabel}
            onOpenReport={openClubReport}
            onSelectCountry={setSelectedCountryGeoName}
            onOpenHistory={openHistoryEntry}
          />
          {reportOpen && report ? (
            <>
              <div className="report-header-row">
                <Metric label="확인" value={`${report.resolvedPlayers}/${report.totalRequested}`} />
                <Metric label="유망주" value={`${report.prospectCount ?? prospectCandidates.length}명`} />
                <Metric label="전성기 이상" value={`${report.seniorCount ?? seniorCandidates.length}명`} />
                <Metric label="조사 단계" value={`${report.knowledgeLevel}단계`} />
                <Metric label="미확인" value={`${report.unresolvedUids.length}`} />
              </div>
              {report.scoutJca != null && report.scoutJpa != null ? (
                <div className="report-scout-badge">
                  <UserRound size={16} />
                  <span>담당 스카우터 배정됨 · CA판단 <strong>{report.scoutJca}</strong> · PA판단 <strong>{report.scoutJpa}</strong></span>
                </div>
              ) : (
                <div className="report-scout-badge cheat">
                  <Shield size={16} />
                  <span>스카우터 미배정 · <strong>정밀 분석 모드</strong> (실제 수치 표시)</span>
                </div>
              )}
              <div className="stage-ladder">
                {stageItems.map((item) => (
                  <article key={item.level} className={item.unlocked ? 'stage-step unlocked' : 'stage-step locked'}>
                    <span>{item.level}단계</span>
                    <strong>{item.title}</strong>
                    <p>{item.description}</p>
                  </article>
                ))}
              </div>
              {mergedProspectNarrative || mergedSeniorNarrative ? (
                <>
                  <NarrativeBlock text={mergedProspectNarrative} />
                  <NarrativeBlock text={mergedSeniorNarrative} />
                </>
              ) : (
                <NarrativeBlock text={mergedSummaryNarrative} />
              )}
              <CandidateSection
                title="유망주 리포트"
                emptyText="24세 이하로 분류된 선수가 없습니다."
                candidates={prospectCandidates}
                knowledgeLevel={reportLevel}
                basis="pa"
                onSelect={setSelectedCandidate}
              />
              <CandidateSection
                title="전성기 이상 리포트"
                emptyText="25세 이상으로 분류된 선수가 없습니다."
                candidates={seniorCandidates}
                knowledgeLevel={reportLevel}
                basis="ca"
                onSelect={setSelectedCandidate}
              />
              <div className="report-bands-row">
                <BandPanel title="PA 분포" bands={report.paBands} max={maxPa} />
                <BandPanel title="CA 분포" bands={report.caBands} max={maxCa} />
              </div>
              {modalCandidate && (
                <PlayerDetailModal
                  candidate={modalCandidate}
                  onClose={() => setSelectedCandidate(null)}
                  onDrilldown={(level) => runDrilldown(modalCandidate, level)}
                  drilldownBusy={drilldownBusy}
                  drilldownError={drilldownError}
                />
              )}
            </>
          ) : reportOpen && canOpenReport ? (
            <div className="scout-empty scout-loading">
              {busy ? <Loader2 size={34} className="spin" /> : <Search size={36} />}
              <h3>{busy ? '리포트 생성 중입니다.' : '리포트를 준비할 수 있습니다.'}</h3>
              <p>{busy ? '구단 정보창에서 요청한 선수단 분석을 정리하고 있습니다.' : '구단 정보창을 다시 누르거나 리포트 생성 버튼으로 분석을 시작하세요.'}</p>
            </div>
          ) : null}
        </section>
      </div>
      {showScoutManager && (
        <div className="modal-backdrop" onMouseDown={() => setShowScoutManager(false)}>
          <section className="scout-manager-modal" onMouseDown={(event) => event.stopPropagation()}>
            <button type="button" className="modal-close" onClick={() => setShowScoutManager(false)} aria-label="닫기">
              x
            </button>
            <div className="scout-manager-head">
              <div>
                <span>Scout Room</span>
                <h3>스카우터 관리</h3>
              </div>
              <button type="button" className="soft-action" disabled={busy} onClick={onRefreshScouts}>
                {busy ? <Loader2 size={17} className="spin" /> : <Search size={17} />}
                구단 스카우터 읽기
              </button>
            </div>
            {scoutNetwork && (
              <div className="scout-network-card compact">
                <div className="squad-summary-head">
                  <UserRound size={18} />
                  <div>
                    <span>스카우팅 네트워크</span>
                    <strong>{scoutNetwork.clubName}</strong>
                  </div>
                </div>
                <div className="squad-summary-grid">
                  <Metric label="수집" value={`${scoutNetwork.importedCount}/${scoutNetwork.recruitmentTeamCount}명`} />
                  <Metric label="저장" value={`${scouts.length}명`} />
                </div>
              </div>
            )}
            <div className="scout-manager-grid">
              <div className="scout-network-list">
                {scouts.length === 0 ? (
                  <div className="scout-manager-empty">등록된 스카우터가 없습니다.</div>
                ) : (
                  scouts.map((scout, index) => (
                    <div key={`${scout.name}-${scout.jca}-${scout.jpa}-${scout.adaptability ?? 'na'}-${index}`} className={index === selectedScoutIndex ? 'scout-network-row active' : 'scout-network-row'}>
                      <button type="button" className="scout-row-main" onClick={() => onScoutSelect(index)}>
                        <strong>{scout.name}</strong>
                        <span>CA/PA 판단 및 적응력만 사용</span>
                      </button>
                      <div className="scout-network-ratings">
                        <span>JCA <strong>{scout.jca}</strong></span>
                        <span>JPA <strong>{scout.jpa}</strong></span>
                        <span>적응 <strong>{scout.adaptability ?? '-'}</strong></span>
                      </div>
                      <button type="button" className="icon-danger" onClick={() => onScoutRemove(index)} aria-label={`${scout.name} 삭제`}>
                        <Trash2 size={15} />
                      </button>
                    </div>
                  ))
                )}
              </div>
              <div className="scout-add-form">
                <input placeholder="스카우터 이름" value={newScoutName} onChange={(e) => setNewScoutName(e.target.value)} />
                <label>
                  <span>CA판단 (1-20)</span>
                  <input type="number" min={1} max={20} value={newScoutJca} onChange={(e) => setNewScoutJca(Number(e.target.value))} />
                </label>
                <label>
                  <span>PA판단 (1-20)</span>
                  <input type="number" min={1} max={20} value={newScoutJpa} onChange={(e) => setNewScoutJpa(Number(e.target.value))} />
                </label>
                <label>
                  <span>적응력 (1-20)</span>
                  <input type="number" min={1} max={20} value={newScoutAdaptability} onChange={(e) => setNewScoutAdaptability(Number(e.target.value))} />
                </label>
                <button
                  type="button"
                  className="primary-action"
                  disabled={!newScoutName.trim()}
                  onClick={() => {
                    onScoutAdd({
                      name: newScoutName.trim(),
                      jca: Math.max(1, Math.min(20, newScoutJca)),
                      jpa: Math.max(1, Math.min(20, newScoutJpa)),
                      adaptability: Math.max(1, Math.min(20, newScoutAdaptability)),
                    })
                    setNewScoutName('')
                    setNewScoutJca(10)
                    setNewScoutJpa(10)
                    setNewScoutAdaptability(10)
                  }}
                >
                  스카우터 등록
                </button>
              </div>
            </div>
          </section>
        </div>
      )}
    </div>
  )
}

const ScoutWorldFocus = memo(function ScoutWorldFocus({
  teamName,
  clubId,
  focus,
  squadInfo,
  countryIntel,
  selectedCountryGeoName,
  selectedCountryIntel,
  selectedCountryLabel,
  onOpenReport,
  onSelectCountry,
  onOpenHistory,
}: {
  teamName: string
  clubId: string
  focus: CountryFocus
  squadInfo: SquadInfo | null
  countryIntel: Record<string, CountryIntel>
  selectedCountryGeoName: string | null
  selectedCountryIntel: CountryIntel | null
  selectedCountryLabel: string
  onOpenReport: () => void
  onSelectCountry: (geoName: string) => void
  onOpenHistory: (entry: ScoutingHistoryEntry, targetLevel?: number) => void
}) {
  const displayName = squadInfo?.teamName || teamName || '스카우팅 대상'
  const displayNation = squadInfo?.nation ?? focus.name
  const canOpen = Boolean(squadInfo)
  const globeRef = useRef<GlobeMethods | undefined>(undefined)
  const containerRef = useRef<HTMLDivElement | null>(null)
  const [stageSize, setStageSize] = useState({ width: 920, height: 620 })
  const panelClassName = [
    'scout-focus-panel',
    canOpen ? 'ready' : 'idle',
  ].filter(Boolean).join(' ')
  const focusedCountryName = focus.geoName
  const maxIntelCount = Math.max(1, ...Object.values(countryIntel).map((intel) => intel.count))
  const clubMarker = useMemo<ClubGlobeMarker | null>(() => {
    if (!squadInfo) return null
    return {
      id: String(squadInfo.inputId),
      name: displayName,
      nation: displayNation,
      playerCount: squadInfo.playerCount,
      lat: focus.lat,
      lng: focus.lng,
      accent: focus.accent,
    }
  }, [displayName, displayNation, focus.accent, focus.lat, focus.lng, squadInfo])
  const markerData = clubMarker ? [clubMarker] : []

  useEffect(() => {
    const node = containerRef.current
    if (!node) return undefined

    const observer = new ResizeObserver(([entry]) => {
      const width = Math.max(520, Math.round(entry.contentRect.width))
      const height = Math.max(520, Math.round(entry.contentRect.height))
      setStageSize((current) => (current.width === width && current.height === height ? current : { width, height }))
    })
    observer.observe(node)
    return () => observer.disconnect()
  }, [])

  useEffect(() => {
    const globe = globeRef.current
    if (!globe) return

    const controls = globe.controls()
    controls.enableDamping = false
    controls.rotateSpeed = 0.58
    controls.zoomSpeed = 0.74
    controls.autoRotate = false
    globe.renderer().setPixelRatio(GLOBE_PIXEL_RATIO)
    globe.pointOfView(
      canOpen
        ? { lat: focus.lat, lng: focus.lng, altitude: 1.22 }
        : { lat: 24, lng: 18, altitude: 2.45 },
      canOpen ? 1500 : 900,
    )
  }, [canOpen, focus.lat, focus.lng])

  function selectCountry(country: object, lat: number, lng: number) {
    const geoName = getWorldCountryName(country)
    onSelectCountry(geoName)
    const globe = globeRef.current
    if (globe) {
      const knownFocus = findCountryFocusByGeoName(geoName)
      globe.pointOfView(
        knownFocus ? { lat: knownFocus.lat, lng: knownFocus.lng, altitude: 1.3 } : { lat, lng, altitude: 1.35 },
        650,
      )
    }
  }

  return (
    <section className={panelClassName}>
      <div className="scout-focus-head">
        <div>
          <span>Global Scouting Map</span>
          <h3>{canOpen ? `${displayNation}로 이동 중` : '구단 ID를 입력하고 Enter 또는 확인 버튼을 누르세요.'}</h3>
        </div>
        <strong>{canOpen ? focus.region : 'Standby'}</strong>
      </div>
      <div className="scout-map-panel" ref={containerRef}>
        <Globe
          ref={globeRef}
          width={stageSize.width}
          height={stageSize.height}
          backgroundColor="rgba(5, 13, 14, 1)"
          globeImageUrl={earthDarkUrl}
          globeCurvatureResolution={10}
          showAtmosphere
          atmosphereColor={focus.accent}
          atmosphereAltitude={0.14}
          showGraticules={false}
          polygonsData={WORLD_COUNTRY_FEATURES}
          polygonGeoJsonGeometry={(country) => (country as WorldCountryFeature).geometry as never}
          polygonLabel={(country) => (country as WorldCountryFeature).properties.name}
          polygonAltitude={(country) => (getWorldCountryName(country) === focusedCountryName ? 0.028 : 0.003)}
          polygonCapColor={(country) => countryIntelFillColor(getWorldCountryName(country), focusedCountryName, focus.accent, countryIntel, maxIntelCount)}
          polygonSideColor={(country) => (getWorldCountryName(country) === focusedCountryName ? `${focus.accent}55` : 'rgba(12, 26, 26, 0.48)')}
          polygonStrokeColor={(country) => (getWorldCountryName(country) === focusedCountryName ? '#eefcf4' : 'rgba(202, 255, 229, 0.34)')}
          polygonCapCurvatureResolution={6}
          polygonsTransitionDuration={0}
          pointsData={markerData}
          pointLat="lat"
          pointLng="lng"
          pointAltitude={0.045}
          pointRadius={0.28}
          pointResolution={8}
          pointsTransitionDuration={0}
          pointColor={() => focus.accent}
          htmlElementsData={markerData}
          htmlLat="lat"
          htmlLng="lng"
          htmlAltitude={0.08}
          htmlElement={(marker) => createClubGlobeElement(marker as ClubGlobeMarker, clubId, onOpenReport)}
          enablePointerInteraction
          showPointerCursor
          onPolygonClick={(country, _event, coords) => selectCountry(country, coords.lat, coords.lng)}
          onGlobeReady={() => {
            const globe = globeRef.current
            if (!globe) return
            const controls = globe.controls()
            controls.enableDamping = false
            controls.rotateSpeed = 0.58
            controls.zoomSpeed = 0.74
            controls.autoRotate = false
            globe.renderer().setPixelRatio(GLOBE_PIXEL_RATIO)
          }}
        />
        <div className="globe-hint">
          <MapPinned size={17} />
          <span>{canOpen ? '마우스로 드래그해 지구본을 돌릴 수 있습니다. 구단 정보창을 클릭하면 스카우팅 리포트를 생성합니다.' : '구단 소재지를 확인하면 실제 국가 경계가 표시된 지구본이 해당 국가로 이동합니다.'}</span>
        </div>
        {selectedCountryGeoName && (
          <CountryHistoryPanel
            label={selectedCountryLabel}
            intel={selectedCountryIntel}
            onClose={() => onSelectCountry('')}
            onOpenHistory={onOpenHistory}
          />
        )}
      </div>
    </section>
  )
})

function getWorldCountryName(country: object) {
  return (country as WorldCountryFeature).properties.name
}

function createClubGlobeElement(
  marker: ClubGlobeMarker,
  clubId: string,
  onOpenReport: () => void,
) {
  const button = document.createElement('button')
  button.type = 'button'
  button.className = 'club-dossier globe-club-card'

  const dot = document.createElement('span')
  dot.className = 'club-marker-dot'
  dot.style.background = marker.accent

  const title = document.createElement('strong')
  title.textContent = marker.name

  const meta = document.createElement('small')
  meta.textContent = `ID ${clubId || marker.id} · ${marker.playerCount}명 · ${marker.nation}`

  button.append(dot, title, meta)
  button.addEventListener('click', (event) => {
    event.preventDefault()
    event.stopPropagation()
    onOpenReport()
  })

  return button
}

function CountryHistoryPanel({
  label,
  intel,
  onClose,
  onOpenHistory,
}: {
  label: string
  intel: CountryIntel | null
  onClose: () => void
  onOpenHistory: (entry: ScoutingHistoryEntry, targetLevel?: number) => void
}) {
  const entries = intel?.entries ?? []
  return (
    <aside className="country-history-panel">
      <div className="country-history-head">
        <div>
          <span>Scouting Intel</span>
          <strong>{label || '선택 국가'}</strong>
        </div>
        <button type="button" onClick={onClose}>닫기</button>
      </div>
      {entries.length === 0 ? (
        <p className="country-history-empty">이 국가에서 저장된 스카우팅 리포트가 없습니다.</p>
      ) : (
        <div className="country-history-list">
          {entries.map((entry) => {
            const bestReport = findBestStoredReport(entry)
            const nextLevel = Math.min(5, entry.bestLevel + 1)
            return (
              <article key={entry.id} className="country-history-card">
                <div>
                  <span>{entry.countryName}</span>
                  <strong>{entry.teamName}</strong>
                  <small>{entry.reportCount}개 리포트 · 최고 {entry.bestLevel}단계 · {formatHistoryTime(entry.updatedAt)}</small>
                </div>
                <div className="country-history-actions">
                  <button type="button" onClick={() => bestReport && onOpenHistory(entry, bestReport.knowledgeLevel)}>
                    다시 보기
                  </button>
                  <button type="button" disabled={entry.bestLevel >= 5} onClick={() => onOpenHistory(entry, nextLevel)}>
                    {entry.bestLevel >= 5 ? '최고 단계' : `${nextLevel}단계 준비`}
                  </button>
                </div>
              </article>
            )
          })}
        </div>
      )}
    </aside>
  )
}

function Metric({ label, value }: { label: string; value: string }) {
  return (
    <article className="metric">
      <span>{label}</span>
      <strong>{value}</strong>
    </article>
  )
}

function formatMoney(value: number) {
  return new Intl.NumberFormat('en-US', {
    maximumFractionDigits: 0,
  }).format(value)
}

function recruitmentPackageLabel(value?: number | null) {
  switch (value) {
    case 1:
      return '없음'
    case 2:
      return '소속 디비전'
    case 3:
      return '주변 디비전'
    case 4:
      return '국가'
    case 5:
      return '지역'
    case 6:
      return '대륙'
    case 7:
      return '세계'
    default:
      return '미확인'
  }
}

function formatReputation(value?: number | null) {
  if (typeof value !== 'number' || !Number.isFinite(value)) return '미확인'
  return `${formatMoney(Math.round(value))}/10,000`
}

function estimateScoutingCost({
  squadInfo,
  knowledgeLevel,
  selectedScout,
  userClub,
  budget,
  history,
}: {
  squadInfo: SquadInfo | null
  knowledgeLevel: number
  selectedScout: Scout | null
  userClub: ClubIdentityResult | null
  budget: ScoutingBudgetResult | null
  history: ScoutingHistoryEntry[]
}): ScoutingCostEstimate | null {
  if (!squadInfo) return null

  const level = Math.max(1, Math.min(5, Math.round(knowledgeLevel)))
  const playerCount = Math.max(1, squadInfo.playerCount)
  const baseByLevel = [0, 6_000, 12_000, 22_000, 38_000, 62_000]
  const perPlayerByLevel = [0, 140, 220, 360, 520, 760]
  const baseAmount = baseByLevel[level] + playerCount * perPlayerByLevel[level]

  const userNation = comparableNationKey(userClub?.nation)
  const targetNation = comparableNationKey(squadInfo.nation)
  const countryKnown = Boolean(userNation && targetNation)
  const sameCountry = countryKnown && userNation === targetNation
  const countryMultiplier = !countryKnown ? 1 : sameCountry ? 0.78 : 1.24

  const adaptability = typeof selectedScout?.adaptability === 'number' ? selectedScout.adaptability : null
  const adaptabilityMultiplier = adaptability == null
    ? 1.08
    : 1.18 - ((Math.max(1, Math.min(20, adaptability)) - 1) / 19) * 0.32

  const reputation = typeof squadInfo.reputation === 'number' ? Math.max(500, Math.min(10_000, squadInfo.reputation)) : null
  const reputationMultiplier = reputation == null ? 1 : 0.82 + (reputation / 10_000) * 0.74

  const packageMultiplier = recruitmentPackageCostMultiplier(budget?.recruitmentPackage, sameCountry, countryKnown)
  const historyEntry = history.find((entry) => String(entry.squadInfo.inputId) === String(squadInfo.inputId))
  const historyMultiplier = historyEntry ? (historyEntry.bestLevel >= level ? 0.55 : 0.82) : 1

  const amount = roundMoney(baseAmount * countryMultiplier * adaptabilityMultiplier * reputationMultiplier * packageMultiplier * historyMultiplier)
  const projectedRemaining = budget ? Math.max(0, budget.remainingBudget - amount) : null

  return {
    amount,
    baseAmount,
    projectedRemaining,
    factors: [
      { label: '단계/선수', value: `${level}단계 · ${playerCount}명` },
      { label: '국가', value: !countryKnown ? '중립' : sameCountry ? '동일 국가' : '해외 조사' },
      { label: '스카우터', value: adaptability == null ? '적응력 미확인' : `적응력 ${adaptability}` },
      { label: '구단 명성', value: reputation == null ? '중립' : formatReputation(reputation) },
      { label: '패키지', value: recruitmentPackageLabel(budget?.recruitmentPackage) },
      { label: '기록', value: historyEntry ? `기존 ${historyEntry.bestLevel}단계` : '신규 조사' },
    ],
    notes: [
      `기초 ${formatMoney(baseAmount)}에 국가, 적응력, 명성, 패키지, 기존 기록 보정을 적용했습니다.`,
      '현재는 표시 전용이며 메모리 예산 차감은 수행하지 않습니다.',
    ],
  }
}

function recruitmentPackageCostMultiplier(value?: number | null, sameCountry = false, countryKnown = false) {
  switch (value) {
    case 1:
      return 1.15
    case 2:
    case 3:
      return countryKnown && sameCountry ? 0.98 : 1.12
    case 4:
      return countryKnown && sameCountry ? 0.9 : 1.08
    case 5:
      return countryKnown && sameCountry ? 0.92 : 0.98
    case 6:
      return 0.96
    case 7:
      return 0.92
    default:
      return 1
  }
}

function comparableNationKey(value?: string | null) {
  return findCountryFocus(value)?.name ?? normalizeCountryKey(value)
}

function roundMoney(value: number) {
  return Math.max(1_000, Math.round(value / 500) * 500)
}

function BandPanel({ title, bands, max }: { title: string; bands: ScoutingBand[]; max: number }) {
  return (
    <section className="report-panel">
      <h3>{title}</h3>
      <div className="band-list">
        {bands.map((band) => (
          <div key={band.label} className="band-row">
            <span>{band.label}</span>
            <div className="band-track">
              <i style={{ width: `${Math.max(4, (band.count / max) * 100)}%` }} />
            </div>
            <strong>{band.count}</strong>
          </div>
        ))}
      </div>
    </section>
  )
}

function scoutingStageItems(level: number) {
  const items = [
    ['기초 탐문', 'PA/CA를 넓은 구간으로 보고 이 팀에 주목할 자원이 있는지 판단합니다.'],
    ['후보 신원 확인', '상위 후보의 이름과 UID를 알아 실제 추적 리스트를 만듭니다.'],
    ['성장 궤도 산정', '잠재 능력과 현재 능력의 차이를 기반으로 성장 선순위를 가립니다.'],
    ['성향 힌트', '프로의식, 야망, 근성을 기반으로 성장 가능성의 질을 확인합니다.'],
    ['리스크 검토', '부상 빈도, 꾸준함, 중요 경기, 압박 처리를 묶어 최종 위험도를 봅니다.'],
  ] as const

  return items.map(([title, description], index) => ({
    level: index + 1,
    title,
    description,
    unlocked: level >= index + 1,
  }))
}

function PageTitle({ title, description }: { title: string; description?: string }) {
  return (
    <header className="page-title">
      <div>
        <h2>{title}</h2>
      </div>
      {description && <span>{description}</span>}
    </header>
  )
}

function ratingTone(value: number) {
  if (value >= 20) return 'elite'
  if (value >= 18) return 'natural'
  if (value >= 15) return 'good'
  if (value >= 12) return 'ok'
  return 'low'
}

function formatChange(value: FieldValue) {
  if (typeof value === 'boolean') return value ? '켜짐' : '꺼짐'
  return value
}

function toSavedPlayer(result: ScanResult): SavedPlayer {
  return {
    uid: result.uid,
    name: result.name,
    lastSeen: Date.now(),
  }
}

function loadSavedPlayers(key: string): SavedPlayer[] {
  if (typeof window === 'undefined') return []
  try {
    const raw = window.localStorage.getItem(key)
    if (!raw) return []
    const parsed = JSON.parse(raw)
    if (!Array.isArray(parsed)) return []
    return parsed
      .filter((item): item is SavedPlayer => typeof item?.uid === 'number')
      .map((item) => ({
        uid: item.uid,
        name: typeof item.name === 'string' ? item.name : null,
        lastSeen: typeof item.lastSeen === 'number' ? item.lastSeen : 0,
      }))
      .sort((a, b) => b.lastSeen - a.lastSeen)
  } catch {
    return []
  }
}

function savePlayers(key: string, players: SavedPlayer[]) {
  if (typeof window !== 'undefined') {
    window.localStorage.setItem(key, JSON.stringify(players))
  }
  return players
}

function loadScoutingHistory(): ScoutingHistoryEntry[] {
  if (typeof window === 'undefined') return []
  try {
    const raw = window.localStorage.getItem(SCOUTING_HISTORY_KEY)
    if (!raw) return []
    const parsed = JSON.parse(raw)
    if (!Array.isArray(parsed)) return []
    return parsed
      .filter(isScoutingHistoryEntry)
      .map((entry) => ({
        ...entry,
        reportCount: Object.keys(entry.reports).length,
        bestLevel: getBestStoredLevel(entry),
      }))
      .sort((a, b) => b.updatedAt - a.updatedAt)
  } catch {
    return []
  }
}

function saveScoutingHistory(entries: ScoutingHistoryEntry[]) {
  if (typeof window !== 'undefined') {
    window.localStorage.setItem(SCOUTING_HISTORY_KEY, JSON.stringify(entries.slice(0, 80)))
  }
  return entries
}

function isScoutingHistoryEntry(value: unknown): value is ScoutingHistoryEntry {
  if (!value || typeof value !== 'object') return false
  const entry = value as Partial<ScoutingHistoryEntry>
  return (
    typeof entry.id === 'string' &&
    typeof entry.clubId === 'string' &&
    typeof entry.teamName === 'string' &&
    typeof entry.countryName === 'string' &&
    typeof entry.countryGeoName === 'string' &&
    typeof entry.updatedAt === 'number' &&
    Boolean(entry.squadInfo) &&
    Array.isArray(entry.playerUids) &&
    Boolean(entry.reports) &&
    typeof entry.reports === 'object'
  )
}

function upsertScoutingHistory(
  entries: ScoutingHistoryEntry[],
  squadInfo: SquadInfo,
  playerUids: number[],
  report: ScoutingReport,
  focus: CountryFocus,
) {
  const id = `${focus.geoName}:${squadInfo.inputId}`
  const reportKey = scoutingReportHistoryKey(report.knowledgeLevel)
  const previous = entries.find((entry) => entry.id === id)
  const reports = {
    ...(previous?.reports ?? {}),
    [reportKey]: report,
  }
  const nextEntry: ScoutingHistoryEntry = {
    id,
    clubId: String(squadInfo.inputId),
    teamName: squadInfo.teamName,
    nation: squadInfo.nation,
    countryName: focus.name,
    countryGeoName: focus.geoName,
    squadInfo,
    playerUids,
    reports,
    bestLevel: Math.max(...Object.values(reports).map((storedReport) => storedReport.knowledgeLevel)),
    reportCount: Object.keys(reports).length,
    updatedAt: Date.now(),
  }

  return [nextEntry, ...entries.filter((entry) => entry.id !== id)].sort((a, b) => b.updatedAt - a.updatedAt)
}

function scoutingReportHistoryKey(level: number) {
  return `level:${level}`
}

function findStoredReport(entry: ScoutingHistoryEntry, level: number) {
  return entry.reports[scoutingReportHistoryKey(level)] ?? null
}

function findBestStoredReport(entry: ScoutingHistoryEntry) {
  const reports = Object.values(entry.reports)
  return reports.sort((a, b) => b.knowledgeLevel - a.knowledgeLevel)[0] ?? null
}

function getBestStoredLevel(entry: ScoutingHistoryEntry) {
  const best = findBestStoredReport(entry)
  return best?.knowledgeLevel ?? entry.bestLevel ?? 1
}

function buildCountryIntel(entries: ScoutingHistoryEntry[]) {
  return entries.reduce<Record<string, CountryIntel>>((acc, entry) => {
    const current = acc[entry.countryGeoName] ?? { count: 0, maxLevel: 1, entries: [] }
    current.count += Math.max(1, entry.reportCount)
    current.maxLevel = Math.max(current.maxLevel, entry.bestLevel)
    current.entries.push(entry)
    current.entries.sort((a, b) => b.updatedAt - a.updatedAt)
    acc[entry.countryGeoName] = current
    return acc
  }, {})
}

function countryIntelFillColor(
  geoName: string,
  focusedCountryName: string,
  accent: string,
  intelByCountry: Record<string, CountryIntel>,
  maxIntelCount: number,
) {
  if (geoName === focusedCountryName) return `${accent}cc`
  const intel = intelByCountry[geoName]
  if (!intel) return 'rgba(36, 76, 73, 0.54)'
  const power = Math.min(1, intel.count / maxIntelCount)
  const alpha = 0.28 + power * 0.5
  const green = Math.round(190 + power * 65)
  return `rgba(${green}, 255, 61, ${alpha.toFixed(2)})`
}

function countryLabelFromGeoName(geoName: string) {
  return COUNTRY_FOCI.find((country) => country.geoName === geoName)?.name ?? geoName
}

function formatHistoryTime(value: number) {
  return new Intl.DateTimeFormat('ko-KR', {
    month: '2-digit',
    day: '2-digit',
    hour: '2-digit',
    minute: '2-digit',
  }).format(value)
}

function loadGameDate() {
  if (typeof window === 'undefined') return ''
  return window.localStorage.getItem(GAME_DATE_KEY) ?? ''
}

function parseGameDateInput(value: string): ParsedGameDate | null {
  const match = /^(\d{4})-(\d{2})-(\d{2})$/.exec(value.trim())
  if (!match) return null
  const year = Number(match[1])
  const month = Number(match[2])
  const day = Number(match[3])
  const parsed = new Date(Date.UTC(year, month - 1, day))
  if (
    parsed.getUTCFullYear() !== year ||
    parsed.getUTCMonth() !== month - 1 ||
    parsed.getUTCDate() !== day
  ) {
    return null
  }
  return { year, month, day }
}

function parseUidList(input: string) {
  return Array.from(
    new Set(
      input
        .split(/[\s,;]+/)
        .map((part) => Number(part.trim()))
        .filter((value) => Number.isInteger(value) && value > 0),
    ),
  )
}

function makeMockScoutingReport(teamName: string, squadKind: string, knowledgeLevel: number, playerUids: number[]): ScoutingReport {
  const paSeeds = [184, 172, 165, 158, 151, 143, 136, 129, 118, 96]
  const caSeeds = [148, 132, 121, 110, 104, 98, 86, 78, 65, 52]
  const ageSeeds = [18, 20, 23, 25, 27, 31, 19, 24, 29, 22]
  const positionsSeed = ['ST', 'CM', 'CB', 'LW', 'GK', 'RB']
  const players = playerUids.map((uid, index) => ({
    uid,
    ca: caSeeds[index % caSeeds.length],
    pa: paSeeds[index % paSeeds.length],
    age: ageSeeds[index % ageSeeds.length],
    position: positionsSeed[index % positionsSeed.length],
  }))
  const prospects = players.filter((player) => player.age <= 24).sort((a, b) => b.pa - a.pa || b.ca - a.ca)
  const seniors = players.filter((player) => player.age > 24).sort((a, b) => b.ca - a.ca || b.pa - a.pa)
  const paBands = makeBands(players.map((player) => player.pa), knowledgeLevel)
  const caBands = makeBands(players.map((player) => player.ca), knowledgeLevel)
  const positionCounts = Array.from(
    players.reduce((counts, player) => counts.set(player.position, (counts.get(player.position) ?? 0) + 1), new Map<string, number>()),
  )
    .map(([label, count]) => ({ label, count }))
    .sort((a, b) => b.count - a.count)

  const prospectSummaryNarrative = [
    knowledgeLevel === 1
      ? `[1단계 기초 탐문] ${teamName}의 ${squadKind} 기초 탐문이 완료되었습니다. 브라우저 미리보기 기준으로 눈에 띄는 재능들이 있다는 인상을 받았습니다. 보다 정확한 평가를 위해 추가 스카우팅을 권장합니다.`
      : null,
    knowledgeLevel === 2
      ? `[2단계 후보 신원 확인] 24세 이하 ${prospects.length}명을 확인한 결과, 전반적으로 상위권 리그 경쟁 수준으로 파악됩니다. 특히 상위 2명은 주목할 만한 잠재력을 보유하고 있습니다.`
      : null,
    knowledgeLevel === 3
      ? '[3단계 성장 궤도 산정] 상위권 리그 경쟁 전력 수준으로 평가됩니다. 특출난 엘리트급 원석이 1명 확인되었으며, 젊은 자원 중심의 구성으로 장기적 성장 가능성이 높습니다. 가장 주목할 선수는 **미리보기 유망주 1**이며, 플레이 스타일 비교군은 **메시, 나니 외 1명**입니다.'
      : null,
    knowledgeLevel === 4
      ? '[4단계 현장 성향 검증] 재능과 정신력을 동시에 갖춘 희귀 자원이 확인되었습니다. 이번 단계에서는 숫자보다 현장 장면을 우선했습니다. 훈련장, 원정 이동, 경기 후 통로에서 나온 관찰 메모를 선수별로 묶어 아래에 정리합니다.\n\n**최우선 추적 대상**인 **미리보기 유망주 1**은 **CM** 포지션에서 확인된 자원입니다. 주요 관찰 샘플은 **비가 그친 뒤 잔디가 무거웠던 주중 원정의 후반 70분 이후**에서 확보했습니다. 성격 일화는 **U21 코치가 공유한 유소년 시절 훈련 일지**에서 수집됐습니다. **비 오는 유소년 경기 후 빈 관중석 앞에서 혼자 우승 세리머니를 연습했다는 목격담이 있습니다. 민망함보다 상상력이 먼저인 선수입니다.** 히든 성향은 **비공개 연습경기 종료 후 코치진이 남긴 역할 변경 기록**에서 더 구체적으로 드러났습니다. **훈련 전 주사위를 굴려 어느 포지션으로 보낼지 정해도 크게 문제 없겠다는 농담이 나옵니다. 과장이지만, 과장이 가능한 선수입니다.** 다음 관찰은 **원정 이동이 긴 경기의 후반 75분 이후**에서 한 번 더 잡는 편이 좋겠습니다.'
      : null,
    knowledgeLevel >= 5
      ? `[5단계 전문가 기밀 리포트] ${teamName}의 ${squadKind} - 유망주 ${prospects.length}명 최종 판정.\n재능과 멘탈리티를 모두 갖춘 자원이 확인되었습니다. 경쟁 클럽에 선점당하기 전에 움직여야 합니다.\n반복 리스크는 **빅매치 적응**입니다. 상위권 맞대결, 원정 더비, 컵 대회 후반 라운드를 따로 분리해 관찰해야 합니다.\n\n**최우선 영입 후보**인 **미리보기 유망주 1**은 **CM** 포지션에서 확인된 자원입니다. 주요 관찰 샘플은 **홈 경기, 원정 경기, 비공개 훈련을 각각 한 차례씩 묶은 3회 관찰 샘플**에서 확보했습니다. 플레이 스타일 관찰: **폭발적인 침투와 마무리 패턴이 상위권 공격수와 닮았습니다.** 특히 **전환 직후 세 번째 터치에서 패스 각도를 바꾼 장면**에서 이 패턴이 반복됐습니다. 리스크 등급은 **관리 가능한 리스크**입니다. 최종 검증 액션은 **더비나 컵 대회 후반 라운드처럼 관중 소음이 커지는 경기에서 첫 15분의 볼 요구 횟수를 따로 체크해야 합니다**.`
      : null,
  ].filter(Boolean).join('\n\n')
  const seniorSummaryNarrative = [
    knowledgeLevel === 1
      ? `[전성기 이상 리포트] ${teamName}의 ${squadKind}에서 25세 이상 선수 ${seniors.length}명을 별도 분류했습니다. 이 그룹은 플레이 유사 선수 비교 없이 현재 능력과 잠재 능력 구간만으로 판단합니다.`
      : null,
    knowledgeLevel === 2
      ? `[현재 전력 분포] 즉시 전력권으로 볼 수 있는 선수는 ${seniors.filter((player) => player.ca >= 140).length}명이며, 잔여 PA가 눈에 띄는 선수는 ${seniors.filter((player) => player.pa >= 160).length}명입니다.`
      : null,
    knowledgeLevel === 3
      ? '[CA/PA 판정] 전성기 이상 그룹은 현재 능력 순으로 우선 검토하고, 잠재 능력은 추가 상승 여지 확인용으로만 사용합니다.'
      : null,
    knowledgeLevel === 4
      ? '[전성기 이상 주요 선수]\n\n**1순위** 후보인 **미리보기 전성기 1**은 **CM** 포지션의 전성기 이상 자원입니다. 현재 능력 구간과 잠재 능력 구간을 함께 보되, 즉시 전력성 중심으로 판단해야 합니다.'
      : null,
    knowledgeLevel >= 5
      ? '[최종 판정] 상위 소수 자원 위주로 선별 접근하는 편이 효율적입니다. 전성기 이상 그룹은 장기 성장성보다 현재 능력, 잔여 PA, 계약 비용을 기준으로 좁혀야 합니다.'
      : null,
  ].filter(Boolean).join('\n\n')

  const prospectCandidates = prospects
    .slice(0, 6)
    .map((player, index) => ({
      label: knowledgeLevel >= 2 ? `미리보기 유망주 ${index + 1}` : `유망주 후보 ${index + 1}`,
      uid: knowledgeLevel >= 2 ? player.uid : null,
      position: player.position,
      age: player.age,
      nation: index % 2 === 0 ? '대한민국' : '브라질',
      ca: player.ca,
      pa: player.pa,
      caBand: findBand(player.ca, knowledgeLevel),
      paBand: findBand(player.pa, knowledgeLevel),
      abilities: knowledgeLevel >= 3 ? makeMockAbilities(index) : [],
      comparisons: knowledgeLevel >= 3 ? (index === 0 ? ['메시', '나니', '네이마르'] : ['손흥민', '그리즈만', '살라']) : [],
      developmentBand: knowledgeLevel >= 3 ? (index === 0 ? '최우선 발굴 대상' : '성장 궤도 진입 중') : null,
      comparisonPhrase: knowledgeLevel >= 3 ? (index === 0 ? '폭발적인 침투와 마무리 패턴이 상위권 공격수와 닮았습니다.' : '전방 압박과 연계 성향이 돋보입니다.') : null,
      recommendation: knowledgeLevel >= 3 ? (index === 0 ? '최우선 추적 대상' : '상위 후보군 유지') : null,
      personalityHint: knowledgeLevel >= 4 ? (index === 0 ? '엘리트 멘탈리티' : '좋은 성장 성향') : null,
      personalityNotes: knowledgeLevel >= 4 ? (
        index === 0
          ? [
              '야망: 비 오는 유소년 경기 후 빈 관중석 앞에서 혼자 우승 세리머니를 연습했다는 목격담이 있습니다. 민망함보다 상상력이 먼저인 선수입니다.',
              '프로의식: 훈련장 열쇠 담당자가 이 선수의 귀가 시간을 기준으로 조명을 끈다는 말이 있습니다. 마지막 슈팅 소리가 들리면 그제야 하루가 끝난다고 합니다.',
            ]
          : [
              '압박감 대처: PK 연습 때 코치가 일부러 관중 소리를 크게 틀자 루틴이 무너졌습니다. 킥보다 호흡이 먼저 흔들리는 장면이 뚜렷했습니다.',
              '참을성: 상대 수비수가 귓속말 한 번 하면 다음 경합이 개인전으로 바뀝니다. 도발을 들으면 전술판보다 복수심을 먼저 읽는 순간이 있습니다.',
            ]
      ) : [],
      hiddenNotes: knowledgeLevel >= 4 ? (
        index === 0
          ? [
              '꾸준함: 현지 팬들은 이 선수를 7점짜리 담요라고 부릅니다. 화려하게 불타지는 않아도 추운 경기에서 늘 덮을 수 있는 선수라는 뜻입니다.',
              '다재다능: 훈련 전 주사위를 굴려 어느 포지션으로 보낼지 정해도 크게 문제 없겠다는 농담이 나옵니다. 과장이지만, 과장이 가능한 선수입니다.',
              '중요 경기: 승부차기 명단을 정할 때 손을 번쩍 든 첫 번째 선수였습니다. 성공 후 세리머니보다 골키퍼에게 먼저 다음 키커 방향을 알려주는 여유까지 보였습니다.',
            ]
          : [
              '부상 빈도: 유소년 시절부터 결장 사유가 대부분 감기나 학교 일정이었다는 이야기가 있습니다. 보양식을 많이 먹고 자랐다는 팀 내 농담이 괜히 나온 게 아닙니다.',
              '꾸준함: 지난 원정 3연전을 직접 관찰했는데, 첫 경기 평점이 8.1이었고 두 번째는 5.4였습니다. 셋째 날 현지 기자가 혹시 형제가 대신 나온 거냐고 물을 정도였습니다.',
              '스포츠맨십: 심판 판정에 항의하다가 교체 투입 1분 만에 경고 두 장을 받은 적이 있다는 현장 보고가 있습니다. 감정 조절이 경기 계획에 포함돼야 합니다.',
            ]
      ) : [],
      riskHint: knowledgeLevel >= 5 ? (index === 0 ? '관리 가능한 리스크' : '주의 필요') : null,
      riskDetails: knowledgeLevel >= 5 ? {
        injury: index === 0 ? '관리 가능' : '주의',
        consistency: index === 0 ? '안정' : '양호',
        bigMatches: index === 0 ? '검증 필요' : '위험',
        pressure: index === 0 ? '양호' : '검증 필요',
        weakestAxis: '빅매치 적응',
        note: '빅매치 적응은 검증 필요 단계이며, 가장 안정적인 축은 경기력 안정성(안정)입니다.',
      } : null,
    }))

  const seniorCandidates = seniors
    .slice(0, 6)
    .map((player, index) => ({
      label: knowledgeLevel >= 2 ? `미리보기 전성기 선수 ${index + 1}` : `전성기 후보 ${index + 1}`,
      uid: knowledgeLevel >= 2 ? player.uid : null,
      position: player.position,
      age: player.age,
      nation: index % 2 === 0 ? '잉글랜드' : '스페인',
      ca: player.ca,
      pa: player.pa,
      caBand: findBand(player.ca, knowledgeLevel),
      paBand: findBand(player.pa, knowledgeLevel),
      abilities: knowledgeLevel >= 3 ? makeMockAbilities(index + 2) : [],
      comparisons: [],
      developmentBand: null,
      comparisonPhrase: null,
      recommendation: null,
      personalityHint: null,
      personalityNotes: [],
      hiddenNotes: [],
      riskHint: null,
      riskDetails: null,
    }))

  return {
    teamName,
    squadKind,
    knowledgeLevel,
    totalRequested: playerUids.length,
    resolvedPlayers: playerUids.length,
    prospectCount: prospects.length,
    seniorCount: seniors.length,
    paBands,
    caBands,
    positionCounts,
    prospectCandidates,
    seniorCandidates,
    candidates: prospectCandidates,
    unresolvedUids: [],
    summaryNarrative: [prospectSummaryNarrative, seniorSummaryNarrative].filter(Boolean).join('\n\n'),
    prospectSummaryNarrative,
    seniorSummaryNarrative,
    scoutJca: null,
    scoutJpa: null,
  }
}

function makeBands(values: number[], knowledgeLevel: number) {
  return bandRanges(knowledgeLevel).map(([label, min, max]) => ({
    label,
    count: values.filter((value) => value >= min && value <= max).length,
  }))
}

function makeMockUserClubScouts(): UserClubScoutsResult {
  const scouts: Scout[] = [
    {
      name: '미리보기 수석 스카우트',
      jca: 17,
      jpa: 18,
      adaptability: 14,
    },
    {
      name: '미리보기 남미 담당',
      jca: 15,
      jpa: 17,
      adaptability: 18,
    },
    {
      name: '미리보기 데이터 분석관',
      jca: 13,
      jpa: 14,
      adaptability: 13,
    },
  ]

  return {
    clubPtr: 0,
    clubName: '미리보기 구단',
    recruitmentTeamCount: scouts.length,
    importedCount: scouts.length,
    scouts,
    source: 'preview',
  }
}

function makeMockAbilities(seed: number): ScoutingAbility[] {
  const base = [
    ['크로스', 'technical', 12],
    ['드리블', 'technical', 15],
    ['골 결정력', 'technical', 14],
    ['헤더', 'technical', 12],
    ['마크', 'technical', 11],
    ['패스', 'technical', 13],
    ['태클', 'technical', 10],
    ['퍼스트 터치', 'technical', 16],
    ['개인기', 'technical', 15],
    ['오프 더 볼', 'mental', 14],
    ['시야', 'mental', 13],
    ['예측력', 'mental', 15],
    ['판단력', 'mental', 13],
    ['위치 선정', 'mental', 12],
    ['대담성', 'mental', 14],
    ['팀워크', 'mental', 12],
    ['집중력', 'mental', 13],
    ['침착성', 'mental', 15],
    ['순간 속도', 'physical', 16],
    ['주력', 'physical', 15],
    ['점프 거리', 'physical', 13],
    ['지구력', 'physical', 14],
    ['몸싸움', 'physical', 11],
    ['균형 감각', 'physical', 13],
    ['민첩성', 'physical', 15],
    ['반사 신경', 'goalkeeping', 13],
    ['일대일 방어', 'goalkeeping', 12],
    ['공중 장악력', 'goalkeeping', 12],
    ['핸들링', 'goalkeeping', 13],
    ['수비 조율', 'goalkeeping', 12],
    ['장악력', 'goalkeeping', 11],
    ['킥', 'goalkeeping', 12],
    ['던지기', 'goalkeeping', 11],
    ['뛰쳐나가기', 'goalkeeping', 13],
  ] as const

  return base.map(([label, category, value], index) => ({
    label,
    category,
    value: Math.max(1, Math.min(20, value + ((seed + index) % 5) - 2)),
  }))
}

function findBand(value: number, knowledgeLevel: number) {
  return bandRanges(knowledgeLevel).find(([, min, max]) => value >= min && value <= max)?.[0] ?? '미확인'
}

function bandRanges(knowledgeLevel: number): [string, number, number][] {
  if (knowledgeLevel === 1) return [['1-119', 1, 119], ['120-149', 120, 149], ['150-169', 150, 169], ['170-200', 170, 200]]
  if (knowledgeLevel === 2) {
    return [['1-99', 1, 99], ['100-119', 100, 119], ['120-139', 120, 139], ['140-159', 140, 159], ['160-179', 160, 179], ['180-200', 180, 200]]
  }
  return [
    ['1-99', 1, 99],
    ['100-109', 100, 109],
    ['110-119', 110, 119],
    ['120-129', 120, 129],
    ['130-139', 130, 139],
    ['140-149', 140, 149],
    ['150-159', 150, 159],
    ['160-169', 160, 169],
    ['170-179', 170, 179],
    ['180-189', 180, 189],
    ['190-200', 190, 200],
  ]
}

export default App
