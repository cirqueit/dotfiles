alias tmux="tmux -2"
alias pbcopy='xclip -selection clipboard'
alias pbpaste='xclip -selection clipboard -o'

set PATH ~/bin/ $PATH

set --erase fish_greeting
set -xU LSCOLORS "ExGxFxdxCxfxDxxbadacad"

function fish_user_key_bindings
    fish_vi_key_bindings
    bind -M insert \cf forward-char
end

function fish_prompt
    set_color normal
    echo -n  (prompt_pwd)
    if test $TERM = "screen-256color"
        if test -n $TMUX
            set_color 5fffaf 
        end
    end
    echo -n ' ❯ '
end
