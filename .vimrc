set rtp+=~/.fzf

call plug#begin()

" completion
Plug 'Shougo/deoplete.nvim'
Plug 'davidhalter/jedi-vim'
Plug 'ajh17/VimCompletesMe'

" pope
Plug 'tpope/vim-surround'
Plug 'tpope/vim-speeddating'
Plug 'tpope/vim-dispatch'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-vinegar'
Plug 'tpope/vim-sleuth'

" june
Plug 'junegunn/rainbow_parentheses.vim'
Plug 'junegunn/fzf', {'dir': '~/.fzf', 'do': 'yes \| ./install'}
Plug 'junegunn/fzf.vim'

" colors
Plug 'cirqueit/chrome'

" languages
Plug 'guns/vim-sexp'
Plug 'tpope/vim-sexp-mappings-for-regular-people'
Plug 'plasticboy/vim-markdown'
Plug 'pangloss/vim-javascript'
Plug 'mxw/vim-jsx'

" tmux
Plug 'christoomey/vim-tmux-navigator'
Plug 'wellle/tmux-complete.vim'

call plug#end()

" completion
let g:deoplete#enable_at_startup = 1
autocmd FileType python setlocal omnifunc=jedi#completions
set completeopt-=preview
let g:jedi#completions_enabled = 0
let g:jedi#auto_vim_configuration = 0
let g:jedi#smart_auto_mappings = 0
let g:jedi#show_call_signatures = 0


" commentary settings
autocmd Filetype vhdl set commentstring=--\ %s
autocmd Filetype clojure set commentstring=;;\ %s


" leader bindings
let mapleader = " "
let localmapleader = " "

nnoremap <silent><leader>t :FZF -m<CR>
nnoremap <silent><leader><leader> :!!<CR>

" colorscheme w/ rainbow parenthesis
set background=dark
colorscheme chrome

let g:rainbow#pairs = [['(', ')'], ['[', ']'], ['{', '}']]
let g:rainbow#colors = {
\   'dark': [
\     ['85',  '#00ff00'],
\     ['33',  '#00ffff'],
\     ['99',  '#00bfff'],
\     ['92',  '#836fff'],
\     ['204', '#ff00ff'],
\     ['231', '#9830ff'],
\     ['231', '#00ff7f'],
\   ]}
autocmd FileType * RainbowParentheses

" misc settings
set relativenumber
set number
set clipboard+=unnamedplus,unnamed
set wildmode=longest,list
set fillchars=vert: 
set hidden
set splitbelow
set splitright
set foldlevel=99
set ignorecase
set smartcase
set smarttab
set shiftwidth=4 
set tabstop=4
set expandtab
set hlsearch
set incsearch
set backspace=indent,eol,start
set scrolloff=10
set virtualedit=block

" misc bindings
nnoremap <silent> <CR> mx:nohlsearch<CR><CR>`x
nnoremap Y y$
nmap <F1> <nop>
set pastetoggle=<F2>
cmap w!! w !sudo tee > /dev/null %

" tabs to indent then spaces
:command! -range=% -nargs=0 Stab execute "<line1>,<line2>s/^\\( \\{".&ts."\\}\\)\\+/\\=substitute(submatch(0), ' \\{".&ts."\\}', '\\t', 'g')"
