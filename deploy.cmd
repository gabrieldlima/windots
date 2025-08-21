@echo off
@REM ===========================================================================

set "windowsTerminalConfigSource=%LOCALAPPDATA%\Packages\Microsoft.WindowsTerminal_8wekyb3d8bbwe\LocalState\settings.json"
set "windowsTerminalConfigDestination=%USERPROFILE%\Source\repos\windots\wt\settings.json"

if exist "%windowsTerminalConfigSource%" (
    del "%windowsTerminalConfigSource%"
)

mklink "%windowsTerminalConfigSource%" "%windowsTerminalConfigDestination%"

@REM ===========================================================================
set "gitConfigSource=%USERPROFILE%\.gitconfig"
set "gitConfigDestination=%USERPROFILE%\Source\repos\windots\.gitconfig"

if exist "%gitConfigSource%" (
    del "%gitConfigSource%"
)

mklink "%gitConfigSource%" "%gitConfigDestination%"