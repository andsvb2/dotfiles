#  Environment

# Note: Directory names should be absolute and must NOT contain trailing slashes ('/')
# NOTE: Variaveis foram definidas em ~/.pam_environment 

# XDG Base Directories
export XDG_CACHE_HOME="$HOME/.cache"
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_DATA_HOME="$HOME/.local/share"

# Tools
export EDITOR='emacsclient -t'
export VISUAL='emacsclient'
export HGMERGE='emacsclient -t'
export ALTERNATE_EDITOR='nano'
export TERMINAL='xfce4-terminal'
export BROWSER='firefox'

# QT e GTK
export QT_QPA_PLATFORMTHEME="qt5ct"
export QT_AUTO_SCREEN_SCALE_FACTOR=0
export GTK2_RC_FILES="$HOME/.gtkrc-2.0"

#  Localization

export LANG="pt_BR.UTF-8"
export LANGUAGE="pt_BR.UTF-8"
export LC_CTYPE="pt_BR.UTF-8"
export LC_NUMERIC="pt_BR.UTF-8"
export LC_TIME="en_DK.UTF-8"
export LC_COLLATE="C"
export LC_MONETARY="pt_BR.UTF-8"
export LC_MESSAGES="pt_BR.UTF-8"
export LC_PAPER="pt_BR.UTF-8"
export LC_NAME="pt_BR.UTF-8"
export LC_ADDRESS="pt_BR.UTF-8"
export LC_TELEPHONE="pt_BR.UTF-8"
export LC_MEASUREMENT="pt_BR.UTF-8"
export LC_IDENTIFICATION="pt_BR.UTF-8"
export LC_ALL=""

#  Executables PATH

if [ -n "$DESKTOP_SESSION" ];then
    eval $(gnome-keyring-daemon --start)
    export SSH_AUTH_SOCK
fi

# automatically remove duplicates from these arrays
# adiciona entrada para infopath
typeset -U infopath infopath
path=("$HOME/.local/bin" "/usr/local/texlive/2020/bin/x86_64-linux" "$path[@]")
export PATH

typeset -U manpath
manpath=("/usr/local/texlive/2020/texmf-dist/doc/man" "$manpath[@]")
export MANPATH

typeset -U infopath
manpath=("/usr/local/texlive/2020/texmf-dist/doc/info" "$infopath[@]")
export INFOPATH
