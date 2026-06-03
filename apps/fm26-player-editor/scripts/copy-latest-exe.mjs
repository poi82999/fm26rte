import fs from 'node:fs'
import path from 'node:path'
import { fileURLToPath } from 'node:url'

const scriptDir = path.dirname(fileURLToPath(import.meta.url))
const appRoot = path.resolve(scriptDir, '..')
const repoRoot = path.resolve(appRoot, '..', '..')
const source = path.join(appRoot, 'src-tauri', 'target', 'release', 'fm26-rte.exe')
const destinations = [
  path.join(repoRoot, 'FM26-Player-Editor.exe'),
  path.join(repoRoot, 'artifacts', 'release', 'FM26-Player-Editor.exe'),
]

if (!fs.existsSync(source)) {
  throw new Error(`Release exe not found: ${source}`)
}

const sleep = (ms) => new Promise((resolve) => setTimeout(resolve, ms))

async function copyWithRetry(from, to) {
  const retryableCodes = new Set(['EBUSY', 'EPERM'])
  let lastError
  for (let attempt = 0; attempt < 8; attempt += 1) {
    try {
      fs.copyFileSync(from, to)
      return
    } catch (error) {
      lastError = error
      if (!retryableCodes.has(error?.code) || attempt === 7) {
        throw error
      }
      await sleep(250 * (attempt + 1))
    }
  }
  throw lastError
}

for (const destination of destinations) {
  fs.mkdirSync(path.dirname(destination), { recursive: true })
  let copiedTo = destination
  try {
    await copyWithRetry(source, destination)
  } catch (error) {
    if (!['EBUSY', 'EPERM'].includes(error?.code)) {
      throw error
    }
    const parsed = path.parse(destination)
    copiedTo = path.join(parsed.dir, `${parsed.name}-next${parsed.ext}`)
    console.warn(`Destination is locked, writing next launch copy instead: ${copiedTo}`)
    await copyWithRetry(source, copiedTo)
  }

  const sizeMb = (fs.statSync(copiedTo).size / 1024 / 1024).toFixed(2)
  console.log(`Copied latest exe to ${copiedTo} (${sizeMb} MB)`)
}
