# Powershell Profile Config for Windows Server
# Author: @tpkreepur

# If Chocolatey is not installed, install it, otherwise update it
if (!(Get-InstalledPackage -Name chocolatey)) {
    Set-ExecutionPolicy Bypass -Scope Process -Force; [System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072; iex ((New-Object System.Net.WebClient).DownloadString('https://community.chocolatey.org/install.ps1'))
    choco feature enable -n allowGlobalConfirmation
    Import-Module $env:ChocolateyInstall\helpers\chocolateyProfile.psm1
} else {
    choco upgrade chocolatey -y
    choco feature enable -n allowGlobalConfirmation
    Import-Module $env:ChocolateyInstall\helpers\chocolateyProfile.psm1
}

# If oh-my-posh is not installed, install it and HACK Nerd Font, otherwise update it
if (!(Get-InstalledPackage -Name oh-my-posh)) {
    choco install oh-my-posh -y
    refreshenv
    oh-my-posh font install Hack
} else {
    choco upgrade oh-my-posh -y
    oh-my-posh init pwsh --config "$env:POSH_THEMES_PATH/.mytheme.omp.json" | Invoke-Expression
}
