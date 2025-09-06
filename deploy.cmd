@echo off
@REM ===========================================================================

winget install AgileBits.1Password
winget install Discord.Discord
winget install Git.Git
winget install Logitech.GHUB
winget install Microsoft.PowerToys
winget install Microsoft.VisualStudio.2022.Community
winget install Microsoft.VisualStudioCode
winget install Valve.Steam
winget install Wacom.WacomTabletDriver
winget install Zen-Team.Zen-Browser

@REM ===========================================================================

set "windowsTerminalConfigSource=%LOCALAPPDATA%\Packages\Microsoft.WindowsTerminal_8wekyb3d8bbwe\LocalState\settings.json"
set "windowsTerminalConfigDestination=%USERPROFILE%\source\repos\windots\wt\settings.json"

if exist "%windowsTerminalConfigSource%" (
    del "%windowsTerminalConfigSource%"
)

mklink "%windowsTerminalConfigSource%" "%windowsTerminalConfigDestination%"

@REM ===========================================================================
set "gitConfigSource=%USERPROFILE%\.gitconfig"
set "gitConfigDestination=%USERPROFILE%\source\repos\windots\.gitconfig"

if exist "%gitConfigSource%" (
    del "%gitConfigSource%"
)

mklink "%gitConfigSource%" "%gitConfigDestination%"

@REM ===========================================================================
set "zedConfigSource=%APPDATA%\zed"
set "zedConfigDestination=%USERPROFILE%\source\repos\windots\zed"

if exist "%zedConfigSource%" (
    rmdir /S /Q "%zedConfigSource%"
)

if not exist "%zedConfigDestination%" (
    mkdir "%zedConfigDestination%"
)

mklink /D "%zedConfigSource%" "%zedConfigDestination%"

@REM ===========================================================================
set "vimConfigSource=%USERPROFILE%\.vimrc"
set "vimDestination=%USERPROFILE%\source\repos\windots\vim\.vimrc"

if exist "%vimConfigSource%" (
    del "%vimConfigSource%"
)

mklink "%vimConfigSource%" "%vimDestination%"