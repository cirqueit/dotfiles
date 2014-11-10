set nocompatible
filetype off             
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'gmarik/Vundle.vim'
Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-unimpaired'
Plugin 'tpope/vim-speeddating'
Plugin 'tpope/vim-leiningen'
Plugin 'tpope/vim-projectionist'
Plugin 'tpope/vim-fireplace'
Plugin 'tpope/vim-dispatch'
Plugin 'tpope/vim-repeat'
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-commentary'
Plugin 'tpope/vim-vinegar'
Plugin 'tpope/vim-sensible'

Plugin 'guns/vim-clojure-static'
Plugin 'guns/vim-clojure-highlight'
Plugin 'guns/vim-sexp'
Plugin 'tpope/vim-sexp-mappings-for-regular-people'

Plugin 'tpope/vim-markdown'
Plugin 'tpope/vim-haml'
Plugin 'elzr/vim-json'
Plugin 'derekwyatt/vim-scala'
Plugin 'hylang/vim-hy'
Plugin 'pangloss/vim-javascript'
Plugin 'kchmck/vim-coffee-script'
Plugin 'digitaltoad/vim-jade'
Plugin 'wavded/vim-stylus'
Plugin 'othree/html5.vim'
Plugin 'othree/javascript-libraries-syntax.vim'
Plugin 'darkwind-mt/bluespec'
Plugin 'dag/vim-fish'

Plugin 'christoomey/vim-tmux-navigator'
Plugin 'kien/ctrlp.vim'
Plugin 'benmills/vimux'
Plugin 'cirqueit/rainbow'
Plugin 'cirqueit/chrome'

Plugin 'Valloric/YouCompleteMe'
call vundle#end()
runtime! plugin/sensible.vim

let g:syntastic_python_checkers = ['flake8']
let g:sexp_filetypes = 'clojure,scheme,lisp,timl,hy'

let g:rainbow_active = 1
let g:rainbow_ctermfgs = ['231', '119', '85', '33', '99', '92', '204']

let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'

set laststatus=0

map Y y$
nmap <F1> <nop>
set pastetoggle=<F2>

set hidden
set wildmode=list:longest

set ignorecase
set smartcase
set title
set splitbelow
set splitright

set t_Co=256
set background=dark
colorscheme chrome

set softtabstop=4 
set shiftwidth=4 
set tabstop=4
set expandtab

set hlsearch
nnoremap <silent> <CR> mx:nohlsearch<CR><CR>`x

set clipboard=unnamedplus

cmap w!! w !sudo tee > /dev/null %

"tab, then spaces
:command! -range=% -nargs=0 Stab execute "<line1>,<line2>s/^\\( \\{".&ts."\\}\\)\\+/\\=substitute(submatch(0), ' \\{".&ts."\\}', '\\t', 'g')"


function! Insta()
    silent w
    if &ft=='clojure'
        silent Require!
        call feedkeys("mxcpp`x")
    elseif &ft =~ '.*\(python\|javascript\|coffee\).*'
        call feedkeys("mxV\<Space>\<Space>`x")
    else
        if !exists("g:VimuxRunnerIndex") || _VimuxHasRunner(g:VimuxRunnerIndex) == -1
            call VimuxOpenRunner()
        endif
        if !exists("g:VimuxLastCommand")
            call VimuxPromptCommand()
        else
            call VimuxRunLastCommand()
        endif
    endif
endfunction

function! InstaREPL()
    silent w
    if !exists("g:VimuxRunnerIndex") || _VimuxHasRunner(g:VimuxRunnerIndex) == -1
        call VimuxOpenRunner()
        if &ft =~ 'python'
            call VimuxRunCommand("ipython")
        elseif &ft =~ 'javascript'
            call VimuxRunCommand("node")
        elseif &ft =~ 'coffee'
            call VimuxRunCommand("coffee")
        endif
        sleep 400m
    endif
    call VimuxSendText(@v)
    if @v[-1:] != "\n"
        call VimuxSendKeys("Enter")
    endif
    sleep 50m
    call system("tmux copy-mode -t ".g:VimuxRunnerIndex)
    call system("tmux send-keys -t ".g:VimuxRunnerIndex." kvky")
    sleep 50m
    let @+ = substitute(@+, '^\n*\s*', "", "")
    let @+ = substitute(@+, '\n*$', "", "")
    echomsg @+
endfunction

let mapleader = " "
vmap <silent> <Leader><Space> "vy :call InstaREPL()<CR>
nmap <silent> <Leader><Space> :call Insta()<CR>
nmap <silent> <Leader>c :call VimuxPromptCommand()<CR>
nmap <silent> <Leader>x :call VimuxCloseRunner()<CR>
let g:VimuxUseNearest = 0
let g:VimuxRunnerType = "window"

set shell=/bin/bash
