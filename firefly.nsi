; example2.nsi
;
; This script is based on example1.nsi, but it remember the directory, 
; has uninstall support and (optionally) installs start menu shortcuts.
;
; It will install example2.nsi into a directory that the user selects,

;--------------------------------

; The name of the installer
Name "ө��淭ǽ����"

; The file to write
OutFile "firefly-proxy-win-0.1.3-install.exe"

; The default installation directory
InstallDir $DESKTOP\Firefly

; Request application privileges for Windows Vista
RequestExecutionLevel user

;--------------------------------

; Pages
Page components
Page directory
Page instfiles

UninstPage uninstConfirm
UninstPage instfiles

;--------------------------------

; The stuff to install
Section "ө��淭ǽ����"

  SectionIn RO
  
  ; Set output path to the installation directory.
  SetOutPath $INSTDIR
  
  ; Put file there
  File /r "build\exe.win32-2.7\*.*"
  
  WriteUninstaller "uninstall.exe"
  
SectionEnd

; Optional section (can be disabled by the user)
Section "��ʼ�˵�"

  CreateDirectory "$SMPROGRAMS\Firefly"
  CreateShortcut "$SMPROGRAMS\Firefly\Uninstall.lnk" "$INSTDIR\uninstall.exe" "" "$INSTDIR\uninstall.exe" 0
  CreateShortcut "$SMPROGRAMS\Firefly\ө��淭ǽ����.lnk" "$INSTDIR\firefly.exe"
  
SectionEnd

Section "��ݷ�ʽ"

  CreateShortcut "$DESKTOP\ө��淭ǽ����.lnk" "$INSTDIR\firefly.exe"
  
SectionEnd

;--------------------------------

; Uninstaller

Section "Uninstall"
 
  ; Remove files and uninstaller
  Delete "$INSTDIR\*.*"

  ; Remove shortcuts, if any
  Delete "$SMPROGRAMS\Firefly\*.*"
  Delete "$DESKTOP\ө��淭ǽ����.lnk"

  ; Remove directories used
  RMDir /r "$SMPROGRAMS\Firefly"
  RMDir /r "$INSTDIR"

SectionEnd

