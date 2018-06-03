######################################################################################
###
###                          __________       .__     
###                          \____    /  _____|  |__  
###                            /     /  /  ___/  |  \ 
###                           /     /_  \___ \|   Y  \
###                          /_______ \/____  >___|  /
###                                  \/     \/     \/ 
###                        ==============================
###                      ==== ZSH ENVIRONMENT SETTINGS ====
###                        ==============================
###
######################################################################################

#######################################################################################
###  ENVIRONMENT
#######################################################################################

### NOTE: Directory names should be absolute and must NOT contain trailing slashes ('/')

### XDG Base Directories
# export XDG_DATA_HOME='/home/anderson/.local/share'
# export XDG_CONFIG_HOME='/home/anderson/.config'
# export XDG_CACHE_HOME='/home/anderson/.cache'

### Editor
# export EDITOR='emacsclient'
# export VISUAL='emacsclient'
#export HGMERGE='emacsclient'

### Terminal
#export TERMINAL='termite'

### GPG
#export GNUPGHOME='/home/anderson/.config/gnupg'

### Pager
# export PAGER='less'

### Pass (password manager)
#export PASSWORD_STORE_DIR='/home/anderson/.local/var/password-store'

### Zsh
# export MARKPATH=/home/anderson/.local/var/zsh/marks
# export GIT_PROMPT_PREFIX="%{$fg[red]%}GIT %{$reset_color%}"
# export HG_PROMPT_PREFIX="%{$fg[red]%}HG %{$reset_color%}"

#######################################################################################
###  LOCALIZATION
#######################################################################################

# export LANG="pt_BR.UTF-8"
# export LC_CTYPE="pt_BR.UTF-8"
# export LC_COLLATE="pt_BR.UTF-8"
# export LC_TIME="pt_BR.UTF-8"
# export LC_NUMERIC="pt_BR.UTF-8"
# export LC_MONETARY="pt_BR.UTF-8"
# export LC_MESSAGES="pt_BR.UTF-8"
# export LC_ALL=pt_BR.UTF-8

#######################################################################################
###  MAN PAGE COLORS
#######################################################################################

# man() {
#     env LESS_TERMCAP_mb=$'\E[01;31m' \
#         LESS_TERMCAP_md=$'\E[01;31m' \
#         LESS_TERMCAP_me=$'\E[0m' \
#         LESS_TERMCAP_se=$'\E[0m' \
#         LESS_TERMCAP_so=$'\E[38m' \
#         LESS_TERMCAP_ue=$'\E[0m' \
#         LESS_TERMCAP_us=$'\E[32m' \
#         man "$@"
# }

#######################################################################################
###  EXECUTABLES PATH
#######################################################################################

# typeset -U path

if [ -n "$DESKTOP_SESSION" ];then
    eval $(gnome-keyring-daemon --start)
    export SSH_AUTH_SOCK
fi
