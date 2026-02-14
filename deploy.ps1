# --------------------------------------------------------------------------
# Create symbolic links because i'm used to use GNU Stow on *nix.
# --------------------------------------------------------------------------
function make-link ($target, $link) {
    New-Item -Path $link -ItemType SymbolicLink -Value $target
}

function make-farm () {
    $userprofile = $env:userprofile
    make-link "${userprofile}\.dotfiles\config\powershell\profile.ps1" "${userprofile}\Documents\Powershell\Microsoft.PowerShell_profile.ps1"
    make-link "${userprofile}\.dotfiles\config\vim\.vimrc" "${userprofile}\.vsvimrc"
    make-link "${userprofile}\.dotfiles\config\wt\settings.json" "${userprofile}\AppData\Local\Packages\Microsoft.WindowsTerminal_8wekyb3d8bbwe\LocalState\settings.json"
    make-link "${userprofile}\.dotfiles\config\git\config" "${userprofile}\.gitconfig"
}


# ------------------------------------------------------------------------------
# Install, update and add scoop packages.
# ------------------------------------------------------------------------------
function scoop-install () {
    # Install scoop
    Set-ExecutionPolicy -ExecutionPolicy RemoteSigned -Scope CurrentUser
    Invoke-RestMethod -Uri https://get.scoop.sh | Invoke-Expression

    # Update scoop (its need git to update itself)
    scoop install git
    scoop update

    # Add buckets
    scoop bucket add extras
    scoop bucket add versions

    # Install packages
    scoop install 7zip
    scoop install cmake
    scoop install discord
    scoop install fastfetch
    scoop install gimp
    scoop install llvm
    scoop install powertoys
    scoop install pwsh
    scoop install steam
    scoop install uv
    scoop install zen-browser
    scoop install zoxide
}


# ------------------------------------------------------------------------------
# Update and add winget packages.
# NOTE: I only use winget for packages that has a specific problem with scoop.
# ------------------------------------------------------------------------------
function winget-install () {
    # Update winget
    winget update
    winget upgrade --all

    # Install packages
    winget install AgileBits.1Password
    winget install Logitech.GHUB
    winget install Microsoft.VisualStudio.Community
    winget install Microsoft.VisualStudioCode
    winget install Python.Python.3.10
    winget install RamenSoftware.Windhawk
    winget install Wacom.WacomTabletDriver
}


# --------------------------------------------------------------------------
# Run all
# --------------------------------------------------------------------------
make-farm
scoop-install
winget-install