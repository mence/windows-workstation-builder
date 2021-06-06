Write-Output "=== Cleaning up from install ==="

# Configuration settings from https://boxstarter.org/WinConfig

Write-Output "--- Re-enable UAC. ---"
Enable-UAC
Write-Output "--- Re-enable Microsoft Update. ---"
Enable-MicrosoftUpdate

Write-Output "--- Install any outstanding Windows Updates and reboot. ---"
Install-WindowsUpdate -acceptEula -GetUpdatesFromMS
if (Test-PendingReboot) { Invoke-Reboot }
