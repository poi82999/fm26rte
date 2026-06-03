import { spawnSync } from 'node:child_process'
import fs from 'node:fs'
import path from 'node:path'
import { fileURLToPath } from 'node:url'

const scriptDir = path.dirname(fileURLToPath(import.meta.url))
const appRoot = path.resolve(scriptDir, '..')
const repoRoot = path.resolve(appRoot, '..', '..')
const tauriRoot = path.join(appRoot, 'src-tauri')
const makensis = 'C:\\Program Files (x86)\\NSIS\\makensis.exe'
const releaseExe = path.join(tauriRoot, 'target', 'release', 'fm26-rte.exe')
const generatedSetup = path.join(
  tauriRoot,
  'target',
  'release',
  'bundle',
  'nsis',
  'FM26-Player-Editor-Setup.exe',
)
const releaseSetup = path.join(repoRoot, 'artifacts', 'release', 'FM26-Player-Editor-Setup.exe')

if (!fs.existsSync(makensis)) {
  throw new Error(`NSIS makensis not found: ${makensis}`)
}

if (!fs.existsSync(releaseExe)) {
  throw new Error(`Release exe not found. Run npm run exe:build first: ${releaseExe}`)
}

const result = spawnSync(makensis, ['manual-installer.nsi'], {
  cwd: tauriRoot,
  stdio: 'inherit',
})

if (result.status !== 0) {
  throw new Error(`makensis failed with exit code ${result.status}`)
}

if (!fs.existsSync(generatedSetup)) {
  throw new Error(`Generated setup not found: ${generatedSetup}`)
}

fs.mkdirSync(path.dirname(releaseSetup), { recursive: true })
fs.copyFileSync(generatedSetup, releaseSetup)

const sizeMb = (fs.statSync(releaseSetup).size / 1024 / 1024).toFixed(2)
console.log(`Copied setup to ${releaseSetup} (${sizeMb} MB)`)
