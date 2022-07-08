# Boxstarter setup script
 
# Notes:
#  - This file has to be idempotent. it will be run several times if the
#    computer needs to be restarted. When that happens, Boxstarter schedules
#    this script to run again with an auto-logon. Fortunately choco install
#    handles trying to install the same package more than once.
#  - Pass -y to choco install to avoid interactive prompts
 
 
# Fix Windows Explorer
Set-WindowsExplorerOptions -EnableShowHiddenFilesFoldersDrives -EnableShowProtectedOSFiles -EnableShowFileExtensions -EnableShowFullPathInTitleBar

# Useful apps
choco install git -y -params '"/GitAndUnixToolsOnPath /NoAutoCrlf"'
 
# Install PowerShell Modules
Set-PSRepository -Name 'PSGallery' -InstallationPolicy Trusted

# Setup security for malware development
# More: https://gist.github.com/pe3zx/7c5e0080c3b0869ccba1f1dc2ea0c5e0
Set-MpPreference -DisableRealtimeMonitoring $true -ErrorAction Ignore;
Set-MpPreference -DisableBehaviorMonitoring $true -ErrorAction Ignore;
Set-MpPreference -DisableBlockAtFirstSeen $true -ErrorAction Ignore;
Set-MpPreference -DisableIOAVProtection $true -ErrorAction Ignore;
Set-MpPreference -DisablePrivacyMode $true -ErrorAction Ignore;
Set-MpPreference -SignatureDisableUpdateOnStartupWithoutEngine $true -ErrorAction Ignore;
Set-MpPreference -DisableArchiveScanning $true -ErrorAction Ignore;
Set-MpPreference -DisableIntrusionPreventionSystem $true -ErrorAction Ignore;
Set-MpPreference -DisableScriptScanning $true -ErrorAction Ignore;
Set-MpPreference -SubmitSamplesConsent 2 -ErrorAction Ignore;
Set-MpPreference -MAPSReporting 0 -ErrorAction Ignore;
Set-MpPreference -HighThreatDefaultAction 6 -Force -ErrorAction Ignore;
Set-MpPreference -ModerateThreatDefaultAction 6 -ErrorAction Ignore;
Set-MpPreference -LowThreatDefaultAction 6 -ErrorAction Ignore;
Set-MpPreference -SevereThreatDefaultAction 6 -ErrorAction Ignore
cmd /c reg add "HKLM\Software\Policies\Microsoft\Windows Defender\Real-Time Protection" /v "DisableOnAccessProtection" /t REG_DWORD /d "1" /f

# Reverse Engineering apps
choco install -y 010editor
choco install -y ida-free
choco install -y ollydbg
choco install -y sysinternals
