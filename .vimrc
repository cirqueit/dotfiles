set rtp+=~/.fzf

call plug#begin()

" pope
Plug 'tpope/vim-surround'
Plug 'tpope/vim-speeddating'
Plug 'tpope/vim-fireplace'
Plug 'tpope/vim-salve'
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

" me
Plug 'cirqueit/chrome'
Plug 'cirqueit/vim-invert-marks'

" complete
Plug 'ajh17/VimCompletesMe'

" languages
Plug 'guns/vim-sexp'
Plug 'tpope/vim-sexp-mappings-for-regular-people'
Plug 'davidhalter/jedi-vim'
Plug 'plasticboy/vim-markdown'
Plug 'elzr/vim-json'
Plug 'pangloss/vim-javascript'
Plug 'mxw/vim-jsx'
Plug 'chrisbra/Colorizer'

" tmux
Plug 'christoomey/vim-tmux-navigator'
Plug 'wellle/tmux-complete.vim'

call plug#end()

" jedi settings
if has('nvim')
    let g:jedi#force_py_version=3
endif
let g:jedi#goto_command = "[d"
let g:jedi#show_call_signatures = "2"

" commentary settings
autocmd Filetype vhdl set commentstring=--\ %s
autocmd Filetype clojure set commentstring=;;\ %s

" dispatch settings
autocmd FileType python let b:dispatch = 'python %'

" completion
let g:tmuxcomplete#trigger = 'omnifunc'
let b:vcm_tab_complete = 'omni'
au FileType text,markdown let b:vcm_tab_complete = 'dict'

" leader bindings
let mapleader = " "
let localmapleader = " "

nnoremap <silent><leader>t :FZF -m<CR>
nnoremap <silent><leader><leader> :Dispatch<CR>
nnoremap <leader>f :Focus 
nnoremap <silent><leader>c :ColorToggle<CR>
nnoremap <silent><leader>r :RainbowParentheses!!<CR>

" colorscheme w/ rainbow parenthesis
set t_Co=256
set background=dark
colorscheme chrome

let g:rainbow#pairs = [['(', ')'], ['[', ']'], ['{', '}']]
let g:rainbow#colors = {
\   'dark': [
\     ['119', 'white'],
\     ['85',  'white'],
\     ['33',  'white'],
\     ['99',  'white'],
\     ['92',  'white'],
\     ['204', 'white'],
\     ['231', 'white'],
\   ]}


" misc settings
set relativenumber
set number
set clipboard+=unnamedplus
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
