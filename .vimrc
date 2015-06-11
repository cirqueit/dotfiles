set rtp+=~/.fzf

call plug#begin()

" pope
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
Plug 'tpope/vim-sleuth'

" june
Plug 'junegunn/rainbow_parentheses.vim'
Plug 'junegunn/fzf', {'dir': '~/.fzf', 'do': 'yes \| ./install'}

" me
Plug 'cirqueit/chrome'
Plug 'cirqueit/vim-invert-marks'

" complete
Plug 'ajh17/VimCompletesMe'

" clojure
Plug 'guns/vim-clojure-static'
Plug 'guns/vim-clojure-highlight'
Plug 'guns/vim-sexp'
Plug 'tpope/vim-sexp-mappings-for-regular-people'

" python
Plug 'davidhalter/jedi-vim'

" misc languages
Plug 'plasticboy/vim-markdown'
Plug 'derekwyatt/vim-scala'
Plug 'elzr/vim-json'
Plug 'pangloss/vim-javascript'
Plug 'mxw/vim-jsx'
Plug 'othree/html5.vim'
Plug 'othree/javascript-libraries-syntax.vim'

" tmux
Plug 'wellle/tmux-complete.vim'
Plug 'christoomey/vim-tmux-navigator'

call plug#end()

" jedi settings
au FileType python setlocal completeopt-=preview
if has('nvim')
    let g:jedi#force_py_version=3
endif
let g:jedi#popup_on_dot = 0
let g:jedi#goto_command = "[d"

" commentary settings
autocmd Filetype vhdl set commentstring=--\ %s

" dispatch settings
autocmd FileType python let b:dispatch = 'python %'

" leader bindings
let mapleader = " "

nnoremap <silent><leader>p :FZF<CR>

nnoremap <silent><leader><space> :Dispatch<CR>
nnoremap <silent><leader>d :Dispatch!<CR>
nnoremap <silent><leader>c :Copen<CR>
nnoremap <silent><leader>f :Focus
nnoremap <silent><leader>s :Start

" colorscheme w/ rainbow parenthesis
set t_Co=256
set background=dark
colorscheme chrome

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

" persistent undo w/ no backups or swap
set undofile
set undodir=~/.vim/undo
set undolevels=1000
set undoreload=10000
set autoread
set nobackup
set noswapfile
set nowritebackup

" misc settings
set relativenumber
set number
set clipboard+=unnamedplus
set wildmode=list:longest
set fillchars=vert: 
set hidden
set splitbelow
set splitright
set foldlevel=99
set smartcase
set smarttab
set shiftwidth=4 
set tabstop=4
set expandtab
set hlsearch

" misc bindings
nnoremap <silent> <CR> mx:nohlsearch<CR><CR>`x
nnoremap Y y$
nnoremap Q @q
vnoremap Q :norm @q<cr>
nmap <F1> <nop>
set pastetoggle=<F2>
cmap w!! w !sudo tee > /dev/null %

" tabs to indent then spaces
:command! -range=% -nargs=0 Stab execute "<line1>,<line2>s/^\\( \\{".&ts."\\}\\)\\+/\\=substitute(submatch(0), ' \\{".&ts."\\}', '\\t', 'g')"

" terminal bindings
if has ('nvim')
    tnoremap <C-[> <C-\><C-n>
    tnoremap <C-h> <C-\><C-n><C-w>h
    tnoremap <C-j> <C-\><C-n><C-w>j
    tnoremap <C-k> <C-\><C-n><C-w>k
    tnoremap <C-l> <C-\><C-n><C-w>l
    nnoremap <leader>\ :vsp \| term<cr>
    nnoremap <leader>- :sp \| term<cr>
endif
