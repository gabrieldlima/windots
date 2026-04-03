# ╔═════════════════════════════════════════════════════════╗
# ║██╗    ██╗██╗███╗   ██╗██████╗  ██████╗ ████████╗███████╗║
# ║██║    ██║██║████╗  ██║██╔══██╗██╔═══██╗╚══██╔══╝██╔════╝║
# ║██║ █╗ ██║██║██╔██╗ ██║██║  ██║██║   ██║   ██║   ███████╗║
# ║██║███╗██║██║██║╚██╗██║██║  ██║██║   ██║   ██║   ╚════██║║
# ║╚███╔███╔╝██║██║ ╚████║██████╔╝╚██████╔╝   ██║   ███████║║
# ║ ╚══╝╚══╝ ╚═╝╚═╝  ╚═══╝╚═════╝  ╚═════╝    ╚═╝   ╚══════╝║
# ╚═════════════════════════════════════════════════════════╝


# --------------------------------------------------------------------------
# Create required folders
# --------------------------------------------------------------------------
function make-folders () {
    $powershellFolder = "C:\Users\gabrielgl\Documents\Powershell"
    if (Test-Path $powershellFolder) {
        Remove-Item $powershellFolder -Force
    }
    mkdir $powershellFolder
}


# --------------------------------------------------------------------------
# Create symbolic links
# --------------------------------------------------------------------------
function make-link ($target, $link) {
    if (Test-Path $link) {
        Remove-Item $link -Force
    }
    New-Item -Path $link -ItemType SymbolicLink -Value $target -Force
}

function make-farm () {
    $userprofile = $env:userprofile
    make-link "${userprofile}\.dotfiles\config\powershell\profile.ps1" "${userprofile}\Documents\Powershell\Microsoft.PowerShell_profile.ps1"
    make-link "${userprofile}\.dotfiles\config\vim\.vimrc" "${userprofile}\.vsvimrc"
    make-link "${userprofile}\.dotfiles\config\wt\settings.json" "${userprofile}\AppData\Local\Packages\Microsoft.WindowsTerminal_8wekyb3d8bbwe\LocalState\settings.json"
    make-link "${userprofile}\.dotfiles\config\git\config" "${userprofile}\.gitconfig"
    make-link "${userprofile}\.dotfiles\config\code\settings.json" "${userprofile}\AppData\Roaming\Code\User\settings.json"
}


# ------------------------------------------------------------------------------
# Update and install winget packages
# ------------------------------------------------------------------------------
function winget-install () {
    # Update winget
    winget update
    winget upgrade --all

    # Install packages
    winget install AgileBits.1Password
    winget install Fastfetch-cli.Fastfetch
    winget install Guru3D.RTSS
    winget install Logitech.GHUB
    winget install Microsoft.PowerToys
    winget install Microsoft.Powershell
    winget install Microsoft.VisualStudio.Community
    winget install Microsoft.VisualStudioCode
    winget install RamenSoftware.Windhawk
    winget install Valve.Steam
    winget install Zen-Team.Zen-Browser
}


# ------------------------------------------------------------------------------
# Run all
# ------------------------------------------------------------------------------

make-folders
make-farm
winget-install