@echo off
@REM ===========================================================================

winget install --exact --id=AgileBits.1Password
winget install --exact --id=Discord.Discord
winget install --exact --id=Git.Git
winget install --exact --id=Logitech.GHUB
winget install --exact --id=Microsoft.PowerShell
winget install --exact --id=Microsoft.PowerToys
winget install --exact --id=RamenSoftware.Windhawk
winget install --exact --id=Spotify.Spotify
winget install --exact --id=Valve.Steam
winget install --exact --id=Wacom.WacomTabletDriver
winget install --exact --id=Zen-Team.Zen-Browser

@REM ===========================================================================

set "windowsTerminalConfigSource=%LOCALAPPDATA%\Packages\Microsoft.WindowsTerminal_8wekyb3d8bbwe\LocalState\settings.json"
set "windowsTerminalConfigDestination=%USERPROFILE%\.windots\wt\settings.json"

if exist "%windowsTerminalConfigSource%" (
    del "%windowsTerminalConfigSource%"
)

mklink "%windowsTerminalConfigSource%" "%windowsTerminalConfigDestination%"

@REM ===========================================================================
set "gitConfigSource=%USERPROFILE%\.gitconfig"
set "gitConfigDestination=%USERPROFILE%\.windots\git\.gitconfig"

if exist "%gitConfigSource%" (
    del "%gitConfigSource%"
)

mklink "%gitConfigSource%" "%gitConfigDestination%"

@REM ===========================================================================
set "zedConfigSource=%APPDATA%\zed"
set "zedConfigDestination=%USERPROFILE%\.windots\zed"

if exist "%zedConfigSource%" (
    rmdir /S /Q "%zedConfigSource%"
)

if not exist "%zedConfigDestination%" (
    mkdir "%zedConfigDestination%"
)

mklink /D "%zedConfigSource%" "%zedConfigDestination%"

@REM ===========================================================================
set "vimConfigSource=%USERPROFILE%\.vimrc"
set "vimDestination=%USERPROFILE%\.windots\vim\.vimrc"

if exist "%vimConfigSource%" (
    del "%vimConfigSource%"
)

mklink "%vimConfigSource%" "%vimDestination%"

@REM ===========================================================================
set "powershellConfigSource=%USERPROFILE%\Documents\PowerShell\Microsoft.PowerShell_profile.ps1"
set "powershellDestination=%USERPROFILE%\.windots\powershell\profile.ps1"

if exist "%powershellConfigSource%" (
    del "%powershellConfigSource%"
)

mklink "%powershellConfigSource%" "%powershellDestination%"
