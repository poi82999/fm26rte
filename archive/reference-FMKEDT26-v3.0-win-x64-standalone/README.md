# FMKEDT26 v3.0

Small Windows editor for selected Football Manager 26 player values.

BY FMKOREA.COM 학원장

## Features

- Attach to the running `fm.exe` process.
- Load a player by unique ID.
- Edit verified mapped values only:
  - Height
  - Squad Number
  - Skin Colour
  - Birth Date
  - International Caps and Goals
  - Current Ability
  - Potential Ability
  - Asking Price
  - Wage
  - Contract Start, Expiry, and Signed/Joined Date
  - Match Sharpness
  - Condition
  - Jadedness
  - Home, Current, and World Reputation
  - Personality values
- Korean and English field labels.
- Technical, mental, physical, hidden-attribute editing is intentionally not included in this build.

## Safety and Transparency

This app reads and writes memory in the locally running `fm.exe` process by using Windows APIs such as `ReadProcessMemory` and `WriteProcessMemory`.

Because of that, Windows SmartScreen or antivirus tools may treat unsigned builds as suspicious. This project does not include persistence, startup registration, network communication, telemetry, or background services.

Recommended distribution practices:

- Publish release builds from source.
- Do not pack or obfuscate the executable.
- Provide a SHA256 checksum for release archives.
- Sign release binaries with an Authenticode code-signing certificate when possible.

## Build

Requirements:

- Windows x64
- .NET SDK 10.0 or newer to build
- .NET Desktop Runtime 10.0 x64 to run the `lite` release
- No installed runtime is needed for the `standalone` release

Build both release packages:

```powershell
.\scripts\build-release.ps1
```

The release zips are written to `dist/`.

- `*-lite.zip`: smallest package, requires .NET Desktop Runtime 10.0 x64.
- `*-standalone.zip`: larger package, runs without installing .NET.

## Usage

1. Start Football Manager 26 and load your save.
2. Run `FMKEDT26.exe`.
3. Select `fm.exe` and click `Connect`.
4. Enter the player unique ID.
5. Click `Load Player`.
6. Change values in the `New` column.
7. Enable write and click `Apply Changes`.

## Notes

Use this on your own local saves. Online, competitive, or shared environments may violate game or community rules.

This build does not include player name search. Load players by UID only.
