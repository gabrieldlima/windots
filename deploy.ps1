# ------------------------------------------------------------------------------
# Install scoop
# ------------------------------------------------------------------------------
Set-ExecutionPolicy -ExecutionPolicy RemoteSigned -Scope CurrentUser
Invoke-RestMethod -Uri https://get.scoop.sh | Invoke-Expression

# ------------------------------------------------------------------------------
# Update scoop
# ------------------------------------------------------------------------------
scoop install git
scoop update

# ------------------------------------------------------------------------------
# Add buckets
# ------------------------------------------------------------------------------
scoop bucket add extras
scoop bucket add games
scoop bucket add nerd-fonts
scoop bucket add versions

# ------------------------------------------------------------------------------
# Install packages
# ------------------------------------------------------------------------------
scoop install 7zip
scoop install bat
scoop install cmake
scoop install discord
scoop install fastfetch
scoop install fd
scoop install ffmpeg
scoop install file
scoop install fzf
scoop install ghostscript
scoop install imagemagick
scoop install innounp
scoop install iosevka-nf
scoop install jq
scoop install less
scoop install llvm
scoop install lua-language-server
scoop install neovim-nightly
scoop install ninja
scoop install nu
scoop install pcsx2
scoop install poppler
scoop install powertoys
scoop install ppsspp
scoop install pwsh
scoop install resvg
scoop install ripgrep
scoop install steam
scoop install vcredist
scoop install vcredist2005
scoop install vcredist2008
scoop install vcredist2010
scoop install vcredist2012
scoop install vcredist2013
scoop install vcredist2022
scoop install wezterm-nightly
scoop install windhawk
scoop install yazi
scoop install zoxide
