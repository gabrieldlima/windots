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
    $powershellFolder = "${userprofile}\Documents\Powershell"
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
}


# ------------------------------------------------------------------------------
# Update and install winget packages
# ------------------------------------------------------------------------------
function make-packages () {
    # Update winget
    winget update
    winget upgrade --all

    # Install packages
    winget install "agilebits.1password"
    winget install "burntSushi.ripgrep.msvc"
    winget install "fastfetch-cli.fastfetch"
    winget install "guru3D.rtss"
    winget install "llvm.llvm"
    winget install "logitech.ghub"
    winget install "microsoft.powershell"
    winget install "microsoft.powertoys"
    winget install "microsoft.visualstudio.community"
    winget install "neovim.neovim"
    winget install "ramensoftware.windhawk"
    winget install "sharkdp.fd"
    winget install "valve.steam"
    winget install "zen-team.zen-browser"
}


# ------------------------------------------------------------------------------
# Run all
# ------------------------------------------------------------------------------

make-folders
make-farm
make-packages
