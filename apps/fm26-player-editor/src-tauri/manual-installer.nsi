Unicode true
Name "FM26 Player Editor"
OutFile "target\release\bundle\nsis\FM26-Player-Editor-Setup.exe"
InstallDir "$LOCALAPPDATA\Programs\FM26 Player Editor"
RequestExecutionLevel user

Page directory
Page instfiles
UninstPage uninstConfirm
UninstPage instfiles

Section "Install"
  SetOutPath "$INSTDIR"
  File "target\release\fm26-rte.exe"
  CreateDirectory "$INSTDIR\faces"
  WriteUninstaller "$INSTDIR\Uninstall.exe"

  CreateDirectory "$SMPROGRAMS\FM26 Player Editor"
  CreateShortcut "$SMPROGRAMS\FM26 Player Editor\FM26 Player Editor.lnk" "$INSTDIR\fm26-rte.exe"
  CreateShortcut "$DESKTOP\FM26 Player Editor.lnk" "$INSTDIR\fm26-rte.exe"

  WriteRegStr HKCU "Software\Microsoft\Windows\CurrentVersion\Uninstall\FM26 Player Editor" "DisplayName" "FM26 Player Editor"
  WriteRegStr HKCU "Software\Microsoft\Windows\CurrentVersion\Uninstall\FM26 Player Editor" "DisplayVersion" "0.1.0"
  WriteRegStr HKCU "Software\Microsoft\Windows\CurrentVersion\Uninstall\FM26 Player Editor" "Publisher" "FM26 RTE"
  WriteRegStr HKCU "Software\Microsoft\Windows\CurrentVersion\Uninstall\FM26 Player Editor" "DisplayIcon" "$INSTDIR\fm26-rte.exe"
  WriteRegStr HKCU "Software\Microsoft\Windows\CurrentVersion\Uninstall\FM26 Player Editor" "UninstallString" "$INSTDIR\Uninstall.exe"
SectionEnd

Section "Uninstall"
  Delete "$DESKTOP\FM26 Player Editor.lnk"
  Delete "$SMPROGRAMS\FM26 Player Editor\FM26 Player Editor.lnk"
  RMDir "$SMPROGRAMS\FM26 Player Editor"
  Delete "$INSTDIR\fm26-rte.exe"
  Delete "$INSTDIR\Uninstall.exe"
  RMDir "$INSTDIR\faces"
  RMDir "$INSTDIR"
  DeleteRegKey HKCU "Software\Microsoft\Windows\CurrentVersion\Uninstall\FM26 Player Editor"
SectionEnd
