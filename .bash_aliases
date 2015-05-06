alias keys='killall xcape > /dev/null 2>&1; setxkbmap -option ctrl:nocaps && xcape -e "Control_L=Escape"'

alias nv='nvim'
alias vi='vim'

alias tmux='tmux -2'
alias t='tmux -2'

alias ipy='ipython'
alias p='ipython'

alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
alias .....='cd ../../../..'
alias ......='cd ../../../../..'

alias l='ls -alF'
alias ll='ls -l'

export EDITOR=vim
export PATH=~/bin:$PATH
export PYTHONSTARTUP=~/.pythonrc

set -o vi

export FZF_DEFAULT_OPTS='-x'

fd() {
    DIR=`find ${1:-*} -path '*/\.*' -prune -o -type d -print 2> /dev/null | fzf-tmux` \
    && cd "$DIR"
}

fda() {
    DIR=`find ${1:-*} -type d 2> /dev/null | fzf-tmux` && cd "$DIR"
}

fkill() {
    pid=$(ps -ef | sed 1d | fzf -m | awk '{print $2}')

    if [ "x$pid" != "x" ]
    then
        kill -${1:-9} $pid
    fi
}

fbr() {
    local branches branch
    branches=$(git branch --all | grep -v HEAD) &&
    branch=$(echo "$branches" | fzf-tmux -h 15 +m) &&
    git checkout $(echo "$branch" | sed "s/.* //" | sed "s#remotes/[^/]*/##")
}

fco() {
    local commits commit
    commits=$(git log --pretty=oneline --abbrev-commit --reverse) &&
    commit=$(echo "$commits" | fzf +s +m -e) &&
    git checkout $(echo "$commit" | sed "s/ .*//")
}

ftags() {
    local line
    [ -e tags ] &&
    line=$(
    awk 'BEGIN { FS="\t" } !/^!/ {print toupper($4)"\t"$1"\t"$2"\t"$3}' tags |
    cut -c1-80 | fzf --nth=1,2
    ) && $EDITOR $(cut -f3 <<< "$line") -c "set nocst" \
    -c "silent tag $(cut -f2 <<< "$line")"
}

fe() {
    local file
    file=$(fzf-tmux --query="$1" --select-1 --exit-0)
    [ -n "$file" ] && ${EDITOR:-vim} "$file"
}

if [ -n "$TMUX_PANE" ]; then
    fzf_tmux_helper() {
        local sz=$1; shift
        local cmd=$1; shift
        tmux split-window $sz \
        "bash -c \"\$(tmux send-keys -t $TMUX_PANE \"\$(source ~/.fzf.bash; $cmd)\" $*)\""
    }
    # https://github.com/wellle/tmux-complete.vim
    fzf_tmux_words() {
        fzf_tmux_helper \
        '-p 40' \
        'tmuxwords.rb --all --scroll 500 --min 5 | fzf --multi | paste -sd" " -'
    }
    # ftpane - switch pane (@george-b)
    ftpane() {
        local panes current_window current_pane target target_window target_pane
        panes=$(tmux list-panes -s -F '#I:#P - #{pane_current_path} #{pane_current_command}')
        current_pane=$(tmux display-message -p '#I:#P')
        current_window=$(tmux display-message -p '#I')
        target=$(echo "$panes" | grep -v "$current_pane" | fzf +m --reverse) || return
        target_window=$(echo $target | awk 'BEGIN{FS=":|-"} {print$1}')
        target_pane=$(echo $target | awk 'BEGIN{FS=":|-"} {print$2}' | cut -c 1)
        if [[ $current_window -eq $target_window ]]; then
            tmux select-pane -t ${target_window}.${target_pane}
        else
            tmux select-pane -t ${target_window}.${target_pane} &&
            tmux select-window -t $target_window
        fi
    }
    # Bind CTRL-X-CTRL-T to tmuxwords.sh
    bind '"\C-x\C-t": "$(fzf_tmux_words)\e\C-e"'
fi

fs() {
    local session
    session=$(tmux list-sessions -F "#{session_name}" | \
    fzf-tmux --query="$1" --select-1 --exit-0) &&
    tmux switch-client -t "$session"
}

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
