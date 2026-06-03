# FM26 세이브 분석 도구 — 테스트 방법

## 준비

### 1단계: FM26 세이브 파일 준비

```powershell
# PowerShell에서 세이브 파일 위치 확인
$savePath = "$env:USERPROFILE\Documents\Sports Interactive\Football Manager 26\games"
Get-ChildItem $savePath -Filter "*.fm" | Select-Object Name, @{Name="SizeMB"; Expression={[math]::Round($_.Length/1MB, 2)}}, LastWriteTime
```

**예상 출력**:
```
Name                           SizeMB LastWriteTime
----                           ------ -------------
My Save.fm                    50.23  2026-05-17 15:30:00
```

없으면 **FM26 게임을 시작해서 새 게임을 저장**하세요.

---

## 테스트 방법 A: Dev 모드 (권장)

### 1단계: Dev 서버 시작

```bash
cd "c:\Users\신민석\dev\fm26-rte\apps\fm26-player-editor"
npm run dev
```

이 명령은:
- TypeScript를 컴파일
- Vite dev 서버를 포트 1420에 시작
- Tauri 앱을 dev 모드로 실행
- **자동으로 DevTools를 활성화** ✅

### 2단계: DevTools 열기

앱이 실행되면:
- **F12** 키 누르기 (또는 우클릭 → Inspect)
- Chrome DevTools가 열림

### 3단계: Console에서 테스트

DevTools 하단의 **Console** 탭을 클릭한 후:

```javascript
// 헤더 분석
await invoke('analyze_save_file', {
  path: 'C:\\Users\\신민석\\Documents\\Sports Interactive\\Football Manager 26\\games\\[세이브파일명].fm'
})
```

**주의**: 경로의 백슬래시를 `\\`로 이스케이프해야 합니다.

**결과 예시**:
```json
{
  "magic": [93, 0, 0, 0, 40, ...],
  "magic_hex": "5d 00 00 00 28 ...",
  "file_size": 52428800,
  "compression": "LZMA",
  "chunks_preview": [
    {
      "offset": 0,
      "length": 2048,
      "type_tag": 12,
      "preview": "offset=0 len=2048 tag=0x0000000c data=00 00 00 0c ..."
    }
  ]
}
```

---

## 테스트 방법 B: 릴리즈 빌드 (쉬운 방법)

### 1단계: 앱 실행

```bash
"c:\Users\신민석\dev\fm26-rte\FM26-Player-Editor.exe"
```

### 2단계: DevTools 활성화

앱 창에서:
- **우클릭** → **Inspect** (또는 **Inspect Element**)
- DevTools가 열림

또는 앱 코드에 버튼을 추가할 수 있음 (아래 참고).

---

## 테스트 케이스

### Test 1: 헤더 분석

```javascript
const result = await invoke('analyze_save_file', {
  path: 'C:\\Users\\신민석\\Documents\\Sports Interactive\\Football Manager 26\\games\\[세이브].fm'
})

console.log('압축 포맷:', result.compression)
console.log('파일 크기:', result.file_size)
console.log('청크 개수:', result.chunks_preview.length)
```

**확인 항목**:
- ✅ `compression` = "LZMA" 또는 "LZ4"
- ✅ `file_size` > 10,000,000 (10MB 이상)
- ✅ `chunks_preview.length` > 0

---

### Test 2: LZMA 압축 해제 & 내부 청크 분석

```javascript
const result = await invoke('decompress_and_analyze', {
  path: 'C:\\Users\\신민석\\Documents\\Sports Interactive\\Football Manager 26\\games\\[세이브].fm'
})

console.log('디코드된 크기:', result.decompressed_size)
console.log('첫 100바이트:', result.first_100_bytes_hex)
console.log('감지된 청크:', result.detected_chunks.length)
```

**확인 항목**:
- ✅ `decompressed_size` > 40,000,000 (40MB 이상)
- ✅ `first_100_bytes_hex` = 규칙적인 hex 패턴
- ✅ `detected_chunks.length` > 10 (여러 청크 감지)

---

### Test 3: 결과 저장 & 분석

```javascript
// 헤더 분석 결과
const header = await invoke('analyze_save_file', {
  path: 'C:\\Users\\신민석\\Documents\\Sports Interactive\\Football Manager 26\\games\\[세이브].fm'
})

// 압축 해제 결과
const decompressed = await invoke('decompress_and_analyze', {
  path: 'C:\\Users\\신민석\\Documents\\Sports Interactive\\Football Manager 26\\games\\[세이브].fm'
})

// 결과를 파일로 저장
const fs = require('fs')
fs.writeFileSync(
  'C:\\Users\\신민석\\Desktop\\save-analysis.json',
  JSON.stringify({ header, decompressed }, null, 2)
)

console.log('✅ 결과를 저장했습니다: C:\\Users\\신민석\\Desktop\\save-analysis.json')
```

결과 파일을 열어서 JSON 포맷이 타당한지 확인하세요.

---

## 예상 결과

### 성공 (LZMA)
```
압축 포맷: LZMA ✅
디코드된 크기: 45,000,000 ✅
첫 청크: offset=0 len=2048 tag=0x0000000c ✅
```

### 실패 케이스

| 증상 | 원인 | 해결 |
| --- | --- | --- |
| `compress되지 않은 파일 (잘못된 시그니처)` | LZMA 아님 | LZ4/다른 포맷 지원 추가 필요 |
| `디코드 실패` | LZMA 라이브러리 호환 문제 | lzma-rs 버전 업그레이드 |
| `청크가 0개` | 청크 패턴 인식 못함 | 스캔 로직 조정 필요 |

---

## 결과 리포트

테스트 후 이 정보를 알려주세요:

```
✅ Test 1 헤더 분석:
  - 압축 포맷: [LZMA/LZ4/기타]
  - 파일 크기: [MB]
  - 감지된 청크 개수: [수]

✅ Test 2 압축 해제:
  - 디코드 성공 여부: [Yes/No]
  - 디코드된 크기: [MB]
  - 감지된 청크 개수: [수]

✅ Test 3 첫 청크 정보:
  - offset: [바이트]
  - length: [바이트]
  - type_tag: [16진수]
  - 데이터 프리뷰: [hex]
```

---

## 추가: 앱에 테스트 버튼 추가 (선택사항)

UI에 "세이브 분석" 버튼을 추가하면 더 쉬울 수 있습니다. 필요하면 알려주세요.
