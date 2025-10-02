@echo off
@REM ===========================================================================

winget install AgileBits.1Password
winget install Discord.Discord
winget install Git.Git
winget install Logitech.GHUB
winget install Microsoft.PowerToys
@REM winget install Microsoft.VisualStudio.2022.Community
@REM winget install Microsoft.VisualStudioCode
winget install Valve.Steam
winget install Wacom.WacomTabletDriver
winget install Zen-Team.Zen-Browser

@REM ===========================================================================

set "windowsTerminalConfigSource=%LOCALAPPDATA%\Packages\Microsoft.WindowsTerminal_8wekyb3d8bbwe\LocalState\settings.json"
set "windowsTerminalConfigDestination=%USERPROFILE%\.windots\wt\settings.json"

if exist "%windowsTerminalConfigSource%" (
    del "%windowsTerminalConfigSource%"
)

mklink "%windowsTerminalConfigSource%" "%windowsTerminalConfigDestination%"

@REM ===========================================================================
set "gitConfigSource=%USERPROFILE%\.gitconfig"
set "gitConfigDestination=%USERPROFILE%\.windots\.gitconfig"

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
