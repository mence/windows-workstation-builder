Write-Output "=== Disable Windows Services ==="

# https://github.com/W4RH4WK/Debloat-Windows-10/blob/master/scripts/disable-services.ps1

$services = @(
    "diagnosticshub.standardcollector.service" # Microsoft (R) Diagnostics Hub Standard Collector Service
    "DiagTrack"                                # Diagnostics Tracking Service
    "dmwappushservice"                         # WAP Push Message Routing Service (see known issues)
    "lfsvc"                                    # Geolocation Service
    "MapsBroker"                               # Downloaded Maps Manager
    "NetTcpPortSharing"                        # Net.Tcp Port Sharing Service
    "RemoteAccess"                             # Routing and Remote Access
    "RemoteRegistry"                           # Remote Registry
    "SharedAccess"                             # Internet Connection Sharing (ICS)
    "TrkWks"                                   # Distributed Link Tracking Client
    "WbioSrvc"                                 # Windows Biometric Service (required for Fingerprint reader / facial detection)
    "WMPNetworkSvc"                            # Windows Media Player Network Sharing Service
    "ndu"                                      # Windows Network Data Usage Monitor
)

foreach ($service in $services) {
    Write-Output "--- Trying to disable $service ---"
    Get-Service -Name $service | Set-Service -StartupType Disabled
}
