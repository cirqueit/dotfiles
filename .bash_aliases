alias r='ranger'
alias yt='youtube-dl --restrict-filenames'
alias tmux='tmux -2'
alias keys='killall xcape > /dev/null 2>&1; setxkbmap -option ctrl:nocaps && xcape -e "Control_L=Escape"'

alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
alias .....='cd ../../../..'
alias ......='cd ../../../../..'

alias l='ls -alF'
alias ll='ls -l'
alias v='vim'

export EDITOR=vim
export PATH=~/bin:$PATH
. ~/.z.sh
