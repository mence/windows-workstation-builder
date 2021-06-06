Write-Output "=== Chocolatey Application Installs ==="

Write-Output "--- Installing core system applications ---"
choco install git

Write-Output "--- Installing system configuration tools ---"
choco install msiafterburner

Write-Output "--- Installing browsers ---"
choco install googlechrome
choco install firefox
choco install microsoft-edge

Write-Output "--- Installing media applications ---"
choco install spotify
choco install mpv

Write-Output "--- Installing communication apps ---"
choco install slack
choco install discord

Write-Output "--- Installing gaming clients ---"
choco install steam-client
choco install goggalaxy
choco install epicgameslauncher
choco install itch

Write-Output "--- Installing gaming tools ---"
choco install nyrna

Write-Output "--- Installing network tools and VPN tools ---"
choco install nordvpn
choco install putty.install
choco install windowsfirewallcontrol
choco install openvpn

Write-Output "--- Installing IDEs ---"
choco install sublimetext3
choco install vscode

Write-Output "--- Installing command line tools ---"
choco install microsoft-windows-terminal
choco install fluent-terminal
choco install bat
choco install fzf
choco install fd
choco install ripgrep
choco install bottom

Write-Output "--- Installing personal productivity applications ---"
choco install 1password
choco install dropbox
choco install notion

# Write-Output "--- Installing Linux ---"
# choco install wsl2 # Disabled until we know size impact of WSL2

Write-Output "--- Installing system utilities ---"
choco install rufus
choco install etcher
choco install processhacker
choco install everything
choco install gpu-z
choco install ssd-z.portable
choco install crystaldiskinfo
choco install keypirinha
choco install autohotkey
choco install quicklook
choco install eartrumpet
choco install barrier
choco install treesizefree
choco install runinbash
choco install 7zip.install
choco install f.lux

Write-Output "--- Installing fonts ---"
choco install firacodenf
choco install inconsolata
