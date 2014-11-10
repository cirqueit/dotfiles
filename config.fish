alias tmux="tmux -2"
alias smux="tmux -S /tmp/shared"
# share sock -> chmod 777 /tmp/shared
# pair       -> smux a
# read-only  -> smux a -r
# free       -> smux new -t 0"

alias tl='tmux ls'

function ta
    switch (count $argv)
        case 0
            tmux attach 
        case \*
            tmux attach -t $argv
    end
end

set PATH ~/bin/ $PATH

set --erase fish_greeting

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

if test (uname) = "Darwin"
    . .config/fish/config.osx.fish
else
    . .config/fish/config.linux.fish
end