#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
PS1='[\u@\h \W]\$ '
# >>> BEGIN ADDED BY CNCHI INSTALLER
BROWSER=/usr/bin/firefox
EDITOR=/usr/bin/nano
# <<< END ADDED BY CNCHI INSTALLER
#PATH=/home/anderson/.texlive/2016/bin/x86_64-linux:$PATH; export PATH
#MANPATH=/home/anderson/.texlive/2016/texmf-dist/doc/man:$MANPATH; export MANPATH
#INFOPATH=/home/anderson/.texlive/2016/texmf-dist/doc/info:$INFOPATH; export INFOPATH 
alias gog-lin='lgogdownloader --download --game all --platform linux'
alias gog-all='lgogdownloader --download --game all --platform linux+windows'
alias e='emacs -nw'
if [ $TILIX_ID ] || [ $VTE_VERSION ]; then
        source /etc/profile.d/vte.sh
fi

#exec fish
