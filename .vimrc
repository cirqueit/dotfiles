set rtp+=~/.fzf

call plug#begin()
if has ('nvim')
    " Plug 'floobits/floobits-neovim'
endif
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

Plug 'davidhalter/jedi-vim'

Plug 'plasticboy/vim-markdown'
Plug 'elzr/vim-json'
Plug 'derekwyatt/vim-scala'
Plug 'pangloss/vim-javascript'
Plug 'mxw/vim-jsx'
Plug 'kchmck/vim-coffee-script'
Plug 'digitaltoad/vim-jade'
Plug 'wavded/vim-stylus'
Plug 'othree/html5.vim'
Plug 'othree/javascript-libraries-syntax.vim'

Plug 'wellle/tmux-complete.vim'
Plug 'christoomey/vim-tmux-navigator'
Plug 'benmills/vimux'
Plug 'tmux-plugins/vim-tmux-focus-events'

Plug 'cirqueit/chrome'
Plug 'cirqueit/vim-invert-marks'

Plug 'ajh17/VimCompletesMe'

Plug 'junegunn/rainbow_parentheses.vim'
Plug 'junegunn/vim-peekaboo'
Plug 'junegunn/fzf', {'dir': '~/.fzf', 'do': 'yes \| ./install'}
call plug#end()
runtime! plugin/sensible.vim
set laststatus=2

au FileType python setlocal completeopt-=preview
if has('nvim')
    " let g:jedi#force_py_version=3
endif
let g:jedi#popup_on_dot = 0

let g:sexp_filetypes='clojure,scheme,lisp,timl,hy'

let g:jsx_ext_required = 0

let g:matchparen_insert_timeout = 5
let g:rainbow#max_level = 16
let g:rainbow#pairs = [['(', ')'], ['[', ']'], ['{', '}']]
let g:rainbow#colors = {
\   'dark': [
\     ['119', 'white'],
\     ['85',  'white'],
\     ['33',  'white'],
\     ['99',  'white'],
\     ['92',  'white'],
\     ['204', 'white'],
\     ['231', 'white']
\   ]}
au VimEnter * RainbowParentheses

set nohidden
set nobackup
set noswapfile
set nowritebackup
set autoread

set undodir=~/.vim/undo
set undofile

nnoremap Y y$
nnoremap Q @q
vnoremap Q :norm @q<cr>

nmap <F1> <nop>
set pastetoggle=<F2>

set hidden
set wildmode=list:longest

set ignorecase
set smartcase
set title
set splitbelow
set splitright
set foldlevel=99

set t_Co=256
set background=dark
colorscheme chrome

set softtabstop=4 
set shiftwidth=4 
set tabstop=4
set expandtab

set hlsearch
nnoremap <silent> <CR> mx:nohlsearch<CR><CR>`x

set clipboard+=unnamedplus

set relativenumber
set number
set scrolloff=10

cmap w!! w !sudo tee > /dev/null %

"tab, then spaces
:command! -range=% -nargs=0 Stab execute "<line1>,<line2>s/^\\( \\{".&ts."\\}\\)\\+/\\=substitute(submatch(0), ' \\{".&ts."\\}', '\\t', 'g')"

let mapleader = " "
nnoremap <silent><leader><space> :Dispatch<CR>
nnoremap <silent><leader>c :Copen<CR>
nnoremap <silent><leader>t :FZF<CR>

autocmd FileType python nunmap <leader><space>
autocmd FileType python nnoremap <leader><space> :!python %<CR>

if has ('nvim')
    tnoremap <C-[> <C-\><C-n>
    tnoremap <C-h> <C-\><C-n><C-w>h
    tnoremap <C-j> <C-\><C-n><C-w>j
    tnoremap <C-k> <C-\><C-n><C-w>k
    tnoremap <C-l> <C-\><C-n><C-w>l
    nnoremap <leader>\ :vsp \| term<cr>
    nnoremap <leader>- :sp \| term<cr>
endif

set fillchars=vert: 

set shell=/bin/bash
