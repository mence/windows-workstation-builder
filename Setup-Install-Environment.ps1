# https://github.com/PatrickGallucci/boxstarter/blob/0fca2c142145159d44cdf300b13143b87b299f4f/boxstarter.ps1#L13
# Boxstarter Options
Write-Output "=== Setting Boxstarter variables ==="
mkdir c:\temp -Confirm:0 -ErrorAction Ignore
$Boxstarter.Log="C:\temp\boxstarter.log"
$Boxstarter.SuppressLogging=$false
$Boxstarter.RebootOk=$true # Allow reboots?
$Boxstarter.NoPassword=$false # Is this a machine with no login password?
$Boxstarter.AutoLogin=$true # Save my password securely and auto-login after a reboot

Write-Output "--- Setting global confirmation for Chocolatey ---"
choco feature enable -n allowGlobalConfirmation
