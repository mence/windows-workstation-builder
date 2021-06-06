# Windows Workstation Builder

Scripts to build my Windows workstation. Uses [Boxstarter](https://boxstarter.org/) and [Chocolately](https://chocolatey.org/).

1. Install Boxstarter: `Install-Boxstarter.ps1`
2. Prepare system environment for installs: `Setup-Install-Environment.ps1`
3. Remove any bloatware applications already installed: `Remove-Default-Apps.ps1`
4. Disable unwanted Windows Services: `Disable-Services.ps1`
5. Disable Windows telemetry via HOSTS or Firewall blocking: `Disable-Telemetry.ps1`
6. Configure system: `System-Configuration.ps1`
7. Install software: `Install-Software.ps1`
8. Cleanup from install: `Cleanup.ps1`

TODO: Call Setup through to Cleanup from a single calling script
