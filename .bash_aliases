shopt -s autocd
alias keys='killall xcape > /dev/null 2>&1; xcape -e "Control_L=Escape"'

alias ipusb='sudo /usr/lib/linux-lts-utopic-tools-3.16.0-62/usbip'
alias ipusbd='sudo /usr/lib/linux-lts-utopic-tools-3.16.0-62/usbipd'

alias tmux='tmux -2'

alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
alias .....='cd ../../../..'
alias ......='cd ../../../../..'

alias l='ls -alF'
alias ll='ls -lrt'

type nvim >/dev/null 2>&1 && alias vim=nvim
type nvim >/dev/null 2>&1 && alias vi="nvim -u NONE"

# if [ !$DISPLAY ]; then
#   if [ "$SSH_CLIENT" ]; then
#     export DISPLAY=:0
#   fi
# fi

export EDITOR=nvim
export PATH=~/.cabal/bin:~/bin:$PATH
export PYTHONSTARTUP=~/.pythonrc
export COLORTERM=screen-256color

set -o vi
bind -m vi-insert "\C-l":clear-screen

# export FZF_DEFAULT_OPTS="--extended"
# export FZF_DEFAULT_COMMAND='ag -l -g ""'
# export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
