call plug#begin()
Plug 'gmarik/Vundle.vim'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-unimpaired'
Plug 'tpope/vim-speeddating'
Plug 'tpope/vim-leiningen'
Plug 'tpope/vim-projectionist'
Plug 'tpope/vim-fireplace'
Plug 'tpope/vim-dispatch'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-vinegar'
Plug 'tpope/vim-sensible'

Plug 'guns/vim-clojure-static'
Plug 'guns/vim-clojure-highlight'
Plug 'guns/vim-sexp'
Plug 'tpope/vim-sexp-mappings-for-regular-people'

Plug 'tpope/vim-markdown'
Plug 'tpope/vim-haml'
Plug 'elzr/vim-json'
Plug 'derekwyatt/vim-scala'
Plug 'hylang/vim-hy'
Plug 'pangloss/vim-javascript'
Plug 'kchmck/vim-coffee-script'
Plug 'digitaltoad/vim-jade'
Plug 'wavded/vim-stylus'
Plug 'othree/html5.vim'
Plug 'othree/javascript-libraries-syntax.vim'
Plug 'darkwind-mt/bluespec'
Plug 'dag/vim-fish'

Plug 'christoomey/vim-tmux-navigator'
Plug 'kien/ctrlp.vim'
Plug 'benmills/vimux'
Plug 'cirqueit/rainbow'
Plug 'cirqueit/chrome'

Plug 'Valloric/YouCompleteMe'
call plug#end()
runtime! plugin/sensible.vim

let g:syntastic_python_checkers = ['flake8']
let g:sexp_filetypes = 'clojure,scheme,lisp,timl,hy'

let g:rainbow_active = 1
let g:rainbow_ctermfgs = ['119', '85', '33', '99', '92', '204', '231']

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

if has('unnamedplus')
    set clipboard=unnamedplus
else
    set clipboard=unnamed
endif

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
    let @+ = substitute(@+, '^\n\s*', "", "")
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
