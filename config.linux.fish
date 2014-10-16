alias pbcopy='xclip -selection clipboard'
alias pbpaste='xclip -selection clipboard -o'

function psof
    switch (count $argv)
        case 0
            quartus_pgm -m JTAG -o "p;vblox1.sof"
        case \*
            quartus_pgm -m JTAG -c $argv[1] -o "p;vblox1.sof"
    end
end

function pelf
    switch (count $argv)
        case 0
            nios2-download -r -g *.elf
        case \*
            nios2-download -r -g -c $argv[1] *.elf
    end
end

function perm
    switch (count $argv)
        case 0
            nios2-terminal
        case \*
            nios2-terminal -c $argv[1]
    end
end

function pet
    pelf $argv ;and perm $argv
end
