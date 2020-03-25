# Affinity Designer AppleScripts

Affinity Designer Scripting via AppleScript

## AFExport

Script that automates exporting from Affinity Designer

There are 2 targets:

- exportAppIcons: exports macos application icon sizes
- exportStatusBarIcon: exports an NSStatusBar icon (expects the AF document to be size 64x64 @ 300DPI)

## Limitations

There is no AppleScript access to select the export type. To workaround that limitation, the user must go an manually select the export type prior to using this script.

## Usage

```bash
## Export app icons 16 / 32 /64 /128 / 256 / 512 (ie. Demo-16.png)
osascript afexport.applescript Demo app

## Export status bar icon (ie. Demo-StatusBar.pdf)
osascript afexport.applescript Demo status
```
