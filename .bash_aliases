alias keys='killall xcape > /dev/null 2>&1; setxkbmap -option ctrl:nocaps && xcape -e "Control_L=Escape"'

alias tmux='tmux -2'

alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
alias .....='cd ../../../..'
alias ......='cd ../../../../..'

alias l='ls -alF'
alias ll='ls -l'

export EDITOR=vim
export PATH=~/.cabal/bin:~/bin:$PATH
export PYTHONSTARTUP=~/.pythonrc
export COLORTERM=xterm-256color

set -o vi

export FZF_DEFAULT_OPTS='-x'

source $HOME/.z.sh
unalias z 2> /dev/null
z() {
    if [[ -z "$*" ]]; then
        cd "$(_z -l 2>&1 | fzf-tmux +s --tac | sed 's/^[0-9,.]* *//')"
    else
        _z "$@"
    fi
}

v() {
  local files
  files=$(grep '^>' ~/.viminfo | cut -c3- |
          while read line; do
            [ -f "${line/\~/$HOME}" ] && echo "$line"
          done | fzf-tmux -d -m -q "$*" -1) && vim ${files//\~/$HOME}
}

t() {
    local session
    session=$(tmux list-sessions -F "#{session_name}" | \
    fzf-tmux --query="$1" --select-1 --exit-0)
    if [[ -z "$TMUX_PANE" ]]; then
        tmux attach -t "$session"
    else
        tmux switch-client -t "$session"
    fi
}

d() {
    DIR=`find ${1:-*} -path '*/\.*' -prune -o -type d -print 2> /dev/null | fzf-tmux` \
    && cd "$DIR"
}
