Write-Output "=== Boxstarter Commands ==="

Write-Output "--- Set Execution Policy to Unrestricted. ---"
Update-ExecutionPolicy Unrestricted

Write-Output "--- Install any outstanding Windows Updates and reboot. ---"
Install-WindowsUpdate -acceptEula
if (Test-PendingReboot) { Invoke-Reboot }

# Power Options - disable hibernation and disable monitor standby
Write-Host "--- Configuring power options. Disabling monitor standby/timeout and system hibernation. --- "
powercfg -change -monitor-timeout-ac 0
powercfg -change -standby-timeout-ac 0
powercfg -h off

Write-Output "--- Disable UAC. Temporary until installation is complete. ---"
Disable-UAC
Write-Output "--- Disable Microsoft Update. Temporary until installation is complete. ---"
Disable-MicrosoftUpdate

# Configuration settings from https://boxstarter.org/WinConfig
Write-Output "--- Turn off Internet Explorer Enhanced Security Configuration that is on by default on Server OS versions. ---"
Disable-InternetExplorerESC
Write-Output "--- Turn off the GameBar Tips of Windows 10 that are shown when a game - or what Windows 10 thinks is a game - is launched. ---"
Disable-GameBarTips
Write-Output "--- Disable the Bing Internet Search when searching from the search field in the Taskbar or Start Menu. ---"
Disable-BingSearch
Write-Output "--- Allow Remote Desktop access to machine and enables Remote Desktop firewall rule. ---"
Enable-RemoteDesktop

# https://github.com/laurentkempe/Cacao/blob/af7a2a39b479cb076ee0b33ce13a2d88623d428a/scripts/SystemConfiguration.ps1#L3
Write-Output "--- Enable developer mode on the system ---"
Set-ItemProperty -Path HKLM:\Software\Microsoft\Windows\CurrentVersion\AppModelUnlock -Name AllowDevelopmentWithoutDevLicense -Value 1

Write-Output "--- Replace command prompt with PowerShell in start menu and Win+X --- "
Set-CornerNavigationOptions -EnableUsePowerShellOnWinX

Write-Output "=== Configure Windows Explorer ==="

Write-Output "--- Set Windows Explorer to show hidden and protected objects, and show extensions. ---"
Set-WindowsExplorerOptions -EnableShowHiddenFilesFoldersDrives -EnableShowProtectedOSFiles -EnableShowFileExtensions

# https://github.com/laurentkempe/Cacao/blob/master/scripts/FileExplorerSettings.ps1
Write-Output "--- Set Windows Explorer to expand to the actual folder you're in ---"
Set-ItemProperty -Path HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced -Name NavPaneExpandToCurrentFolder -Value 1
Write-Output "--- Show all folders in the Navigation Pane like the Recycle Bin ---"
Set-ItemProperty -Path HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced -Name NavPaneShowAllFolders -Value 1
Write-Output "--- Launch Explorer to This PC ---"
Set-ItemProperty -Path HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced -Name LaunchTo -Value 1
Write-Output "--- Set multi-monitor taskbar mode ---"
Set-ItemProperty -Path HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced -Name MMTaskbarMode -Value 2

# https://github.com/PatrickGallucci/boxstarter/blob/0fca2c142145159d44cdf300b13143b87b299f4f/boxstarter.ps1#L109
Write-Output "=== Disable Application suggestions and automatic installation ==="
Function DisableAppSuggestions {
  Write-Output "--- Disabling Application suggestions... ---"
  Set-ItemProperty -Path "HKCU:\Software\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" -Name "ContentDeliveryAllowed" -Type DWord -Value 0
  Set-ItemProperty -Path "HKCU:\Software\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" -Name "OemPreInstalledAppsEnabled" -Type DWord -Value 0
  Set-ItemProperty -Path "HKCU:\Software\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" -Name "PreInstalledAppsEnabled" -Type DWord -Value 0
  Set-ItemProperty -Path "HKCU:\Software\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" -Name "PreInstalledAppsEverEnabled" -Type DWord -Value 0
  Set-ItemProperty -Path "HKCU:\Software\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" -Name "SilentInstalledAppsEnabled" -Type DWord -Value 0
  Set-ItemProperty -Path "HKCU:\Software\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" -Name "SubscribedContent-310093Enabled" -Type DWord -Value 0
  Set-ItemProperty -Path "HKCU:\Software\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" -Name "SubscribedContent-314559Enabled" -Type DWord -Value 0
  Set-ItemProperty -Path "HKCU:\Software\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" -Name "SubscribedContent-338387Enabled" -Type DWord -Value 0
  Set-ItemProperty -Path "HKCU:\Software\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" -Name "SubscribedContent-338388Enabled" -Type DWord -Value 0
  Set-ItemProperty -Path "HKCU:\Software\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" -Name "SubscribedContent-338389Enabled" -Type DWord -Value 0
  Set-ItemProperty -Path "HKCU:\Software\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" -Name "SubscribedContent-338393Enabled" -Type DWord -Value 0
  Set-ItemProperty -Path "HKCU:\Software\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" -Name "SubscribedContent-353694Enabled" -Type DWord -Value 0
  Set-ItemProperty -Path "HKCU:\Software\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" -Name "SubscribedContent-353696Enabled" -Type DWord -Value 0
  Set-ItemProperty -Path "HKCU:\Software\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" -Name "SubscribedContent-353698Enabled" -Type DWord -Value 0
  Set-ItemProperty -Path "HKCU:\Software\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" -Name "SystemPaneSuggestionsEnabled" -Type DWord -Value 0
  If (!(Test-Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows\CloudContent")) {
    New-Item -Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows\CloudContent" -Force | Out-Null
  }
  Set-ItemProperty -Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows\CloudContent" -Name "DisableWindowsConsumerFeatures" -Type DWord -Value 1
  If (!(Test-Path "HKLM:\SOFTWARE\Policies\Microsoft\WindowsInkWorkspace")) {
    New-Item -Path "HKLM:\SOFTWARE\Policies\Microsoft\WindowsInkWorkspace" -Force | Out-Null
  }
  Set-ItemProperty -Path "HKLM:\SOFTWARE\Policies\Microsoft\WindowsInkWorkspace" -Name "AllowSuggestedAppsInWindowsInkWorkspace" -Type DWord -Value 0
  # Empty placeholder tile collection in registry cache and restart Start Menu process to reload the cache
  If ([System.Environment]::OSVersion.Version.Build -ge 17134) {
    $key = Get-ItemProperty -Path "HKCU:\Software\Microsoft\Windows\CurrentVersion\CloudStore\Store\Cache\DefaultAccount\*windows.data.placeholdertilecollection\Current"
    Set-ItemProperty -Path $key.PSPath -Name "Data" -Type Binary -Value $key.Data[0..15]
    Stop-Process -Name "ShellExperienceHost" -Force -ErrorAction SilentlyContinue
  }
}
DisableAppSuggestions
