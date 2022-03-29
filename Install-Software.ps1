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
choco install sonos-controller
choco install mpv
choco install vlc

Write-Output "--- Installing communication apps ---"
choco install slack
choco install discord
choco install signal
choco install whatsapp

Write-Output "--- Installing gaming clients ---"
choco install steam-client
choco install goggalaxy
choco install epicgameslauncher
choco install origin
choco install itch
choco install playnite
choco install parsec

Write-Output "--- Installing productivity applications ---"
choco install 1password4
choco install dropbox
choco install notion
choco install markdownmonster
choco install qownnotes
choco install drawio
choco install zettlr
choco install speedcrunch

Write-Output "--- Installing IDEs and developer tools---"
choco install sublimetext3
choco install sublimetext3.powershellalias
choco install vscodium
choco install meld

Write-Output "--- Installing network tools and VPN tools ---"
choco install nordvpn
choco install putty.install
choco install windowsfirewallcontrol
choco install openvpn
choco install tailscale
choco install glasswire
choco install wnetwatcher

Write-Output "--- Installing command line terminals ---"
choco install microsoft-windows-terminal
choco install fluent-terminal
choco install tabby
Write-Output "--- Installing command line tools ---"
choco install bat
choco install fzf
choco install fd
choco install ripgrep
choco install bottom
choco install ag
choco install nmap
choco install ntop
choco install gotop
choco install tldr
choco install tldr-plusplus
choco install less
Write-Output "--- Installing command line applications ---"
choco install ffmpeg
choco install yt-dlp

# Write-Output "--- Installing Linux ---"
# choco install wsl2 # Disabled until we know size impact of WSL2

Write-Output "--- Installing system utilities ---"
choco install rufus
choco install etcher
choco install processhacker
choco install keypirinha
choco install autohotkey
choco install quicklook
choco install eartrumpet
choco install barrier
choco install treesizefree
choco install runinbash
choco install 7zip.install
choco install f.lux
choco install everything
choco install geekuninstaller
choco install espanso
choco install powertoys
choco install startuplist.portable
choco install displayfusion
choco install bulk-crap-uninstaller
choco install windrstat
choco install guiformat

Write-Output "--- Installing desktop modification utilities ---"
choco install translucenttb
choco install lively

Write-Output "--- Installing system monitoring and benchmarking tools  ---"
choco install gpu-z
choco install ssd-z.portable
choco install crystaldiskinfo
choco install hwmonitor
choco install furmark
choco install occt
choco install prime95.portable
choco install perfview
choco install aida64-extreme

Write-Output "--- Installing screensavers  ---"
choco install thematrix

Write-Output "--- Installing fonts ---"
choco install firacodenf
choco install inconsolata
choco install hackfont
choco install SourceCodePro

Write-Output "--- Installing Chrome Extensions ---"
choco install ublockorigin-chrome
choco install https-everywhere-chrome

Write-Output "--- Installing chocolatey line utilities ---"
choco install choco-cleaner

Write-Output "--- Installing specific computer drivers ---"
choco install icue
choco install amd-ryzen-chipset
choco install streamdeck
choco install lghub
choco install kingston-ssd-manager
choco install samsung-nvme-driver
# choco install nvidia-display-driver
# choco install disable-nvidia-telemetry

choco install samsung-magician
