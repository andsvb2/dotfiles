#######################################################################################
###  ENVIRONMENT
#######################################################################################

### NOTE: Directory names should be absolute and must NOT contain trailing slashes ('/')
### NOTE: Variaveis foram definidas em ~/.pam_environment 

### XDG Base Directories
# export XDG_CACHE_HOME='/home/anderson/.cache'
# export XDG_CONFIG_HOME='/home/anderson/.config'
# export XDG_DATA_HOME='/home/anderson/.local/share'

### Tools
# export EDITOR='emacsclient -t'
# export VISUAL='emacsclient -t'
# export HGMERGE='emacsclient -t'
# export ALTERNATE_EDITOR='nano'
# export TERMINAL='xfce4-terminal'

#######################################################################################
###  LOCALIZATION
#######################################################################################

# export LANG="pt_BR.UTF-8"
# export LANGUAGE="pt_BR:en_US:es_PE"
# export LC_CTYPE="pt_BR.UTF-8"
# export LC_COLLATE="C"
# export LC_TIME="en_DK.UTF-8"
# export LC_NUMERIC="pt_BR.UTF-8"
# export LC_MONETARY="pt_BR.UTF-8"
# export LC_MESSAGES="pt_BR.UTF-8"


#######################################################################################
###  EXECUTABLES PATH
#######################################################################################

if [ -n "$DESKTOP_SESSION" ];then
    eval $(gnome-keyring-daemon --start)
    export SSH_AUTH_SOCK
fi

typeset -U path
path=("$HOME/.local/bin" "/usr/local/texlive/2020/bin/x86_64-linux" "$path[@]")
export PATH

typeset -U manpath
manpath=("/usr/local/texlive/2020/texmf-dist/doc/man" "$manpath[@]")
export MANPATH

typeset -U infopath
manpath=("/usr/local/texlive/2020/texmf-dist/doc/info" "$infopath[@]")
export INFOPATH
