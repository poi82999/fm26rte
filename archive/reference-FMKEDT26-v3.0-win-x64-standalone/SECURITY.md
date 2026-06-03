# Security Notes

FMKEDT26 is a local Windows desktop utility.

## What the app does

- Opens the selected `fm.exe` process.
- Reads memory to locate the player data block.
- Writes only the values shown in the editor after the user enables writing and clicks `Apply Changes`.

## What the app does not do

- No network requests.
- No telemetry.
- No startup registration.
- No service installation.
- No background persistence.
- No file encryption or unrelated file access.

## Antivirus and SmartScreen

Unsigned memory-editing tools are commonly flagged or warned by Windows SmartScreen and antivirus products. Code signing and transparent source releases reduce risk but do not guarantee that a first-time download will avoid SmartScreen prompts.

For public releases, prefer:

- Reproducible release builds.
- Authenticode signing.
- SHA256 checksums.
- No executable packing, compression, or obfuscation.
