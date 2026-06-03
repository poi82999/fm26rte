import { rm } from 'node:fs/promises'
import { resolve, sep } from 'node:path'

const root = resolve(import.meta.dirname, '..')
const dist = resolve(root, 'dist')

if (!dist.startsWith(root + sep)) {
  throw new Error(`Refusing to remove path outside project: ${dist}`)
}

await rm(dist, { recursive: true, force: true })
