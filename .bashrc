# editor
export EDITOR=vim

# set vi editing mode
set -o vi

# don't put duplicate lines or lines starting with space in the history.
HISTCONTROL=ignoreboth

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=1000
HISTFILESIZE=2000


svndiff()     { svn diff "$@" | colordiff; }
svndiffless() { svn diff "$@" | colordiff | less -R; }

# aliases
#alias ll='ls -alhF --color=auto'
alias ll='exa --long --header --git -a -F'
alias l='ls -lhF --color=auto'
alias grep="grep --color=auto"
alias egrep="egrep --color=auto"
alias fgrep="fgrep --color=auto"
alias gccg='gcc -g -Wall'
alias g++g='g++ -g -Wall'
alias valc='valgrind --leak-check=yes'
alias senv='source env/bin/activate'
alias penv='deactivate'
alias mkd='mkdir -pv'
alias yayr='yay -Rsn'
alias jn="source ~/anaconda3/bin/activate && jupyter-lab"
alias cond="conda deactivate"
alias yt="youtube-dl --add-metadata -ic"
alias ssh="TERM='xterm-256color' ssh"
alias wcuda='watch -n 0.1 nvidia-smi'
alias pdf='evince'
alias pn='cd ~/Documents/Research/pytorch && source ~/anaconda3/bin/activate && conda activate pytorch && jupyter notebook'
alias v='nvim'

alias mountdvmm='sshfs dave@mango.cs.columbia.edu:/dvmm-filer2/users/dave ~/DVMMLab/ -oIdentityFile=~/.ssh/id_rsa'
alias unmountdvmm='cd ~ && sudo umount ~/DVMMLab/'

# git bare stuff
alias bit='/usr/bin/git --git-dir=$HOME/dotfiles/ --work-tree=$HOME'

#neofetch

# export
export PATH=~/.local/bin/:$PATH
export PATH=~/.scripts/:$PATH

PROMPT_DIRTRIM=2
txtblk='\[\e[0;30m\]' # Black - Regular
txtred='\[\e[0;31m\]' # Red
txtgrn='\[\e[0;32m\]' # Green
txtylw='\[\e[0;33m\]' # Yellow
txtblu='\[\e[0;34m\]' # Blue
txtpur='\[\e[0;35m\]' # Purple
txtcyn='\[\e[0;36m\]' # Cyan
txtwht='\[\e[0;37m\]' # White
bldblk='\[\e[1;30m\]' # Black - Bold
bldred='\[\e[1;31m\]' # Red
bldgrn='\[\e[1;32m\]' # Green
bldylw='\[\e[1;33m\]' # Yellow
bldblu='\[\e[1;34m\]' # Blue
bldpur='\[\e[1;35m\]' # Purple
bldcyn='\[\e[1;36m\]' # Cyan
bldwht='\[\e[1;37m\]' # White
unkblk='\[\e[4;30m\]' # Black - Underline
undred='\[\e[4;31m\]' # Red
undgrn='\[\e[4;32m\]' # Green
undylw='\[\e[4;33m\]' # Yellow
undblu='\[\e[4;34m\]' # Blue
undpur='\[\e[4;35m\]' # Purple
undcyn='\[\e[4;36m\]' # Cyan
undwht='\[\e[4;37m\]' # White
bakblk='\[\e[40m\]' # Black - Background
bakred='\[\e[41m\]' # Red
bakgrn='\[\e[42m\]' # Green
bakylw='\[\e[43m\]' # Yellow
bakblu='\[\e[44m\]' # Blue
bakpur='\[\e[45m\]' # Purple
bakcyn='\[\e[46m\]' # Cyan
bakwht='\[\e[47m\]' # White
txtrst='\[\e[0m\]' # Text Reset

# defualts
O_BARCE="$txtcyn[$txtrst"
USER="$txtblu\u$txtrst"
AT="$bldylw@$txtrst"
HOST="$txtgrn\h$txtrst"
PROMT_PWD="$txtrst\w"
C_BARCE="$txtcyn]$txtrst"

if [ "$HOSTNAME" = 'dave-xps' ]; then
    O_BARCE="$txtred[$txtrst"
    USER="$txtpur\u$txtrst"
    AT="$bldylw@$txtrst"
    HOST="$txtgrn\h$txtrst"
    PROMT_PWD="$txtcyn\w"
    C_BARCE="$txtred]$txtrst"
fi
export PS1="$O_BARCE$USER$AT$HOST $PROMT_PWD$C_BARCE$ "
#export PS1="${txtred}[${txtblu}\u${bldylw}@${txtpur}\h ${txtcyn}\w${txtred}]${txtrst}$ "

PROMPT_COMMAND='echo -en "\033]0;$("pwd") | $HOSTNAME\a"'
