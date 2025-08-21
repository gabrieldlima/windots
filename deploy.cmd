@echo off
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
set "zedConfigDestination=%USERPROFILE%\source\windots\zed"

if exist "%zedConfigSource%" (
    rmdir /S /Q "%zedConfigSource%"
)

if not exist "%zedConfigDestination%" (
    mkdir "%zedConfigDestination%"
)

mklink /D "%zedConfigSource%" "%zedConfigDestination%"
