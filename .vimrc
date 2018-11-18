set rtp+=~/.fzf
   
call plug#begin()

" completion
Plug 'roxma/nvim-yarp'
Plug 'ncm2/ncm2'

Plug 'ncm2/ncm2-bufword'
Plug 'ncm2/ncm2-tmux'
Plug 'ncm2/ncm2-path'
Plug 'ncm2/ncm2-jedi'

Plug 'ncm2/ncm2-ultisnips'
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'

Plug 'autozimu/LanguageClient-neovim', {'branch': 'next',  'do': 'bash install.sh' }

" pope
Plug 'tpope/vim-unimpaired'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-dispatch'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-vinegar'
Plug 'tpope/vim-sleuth'

" june
Plug 'junegunn/rainbow_parentheses.vim'
Plug 'junegunn/fzf', {'dir': '~/.fzf', 'do': 'yes \| ./install'}

" colors
Plug 'cirqueit/chrome'

" LISP
Plug 'guns/vim-sexp'
Plug 'tpope/vim-sexp-mappings-for-regular-people'

" navigation
Plug 'dhruvasagar/vim-zoom'
Plug 'christoomey/vim-tmux-navigator'
Plug 'melonmanchan/vim-tmux-resizer'
Plug 'metakirby5/codi.vim'

call plug#end()
set synmaxcol=128
set re=1


let g:codi#rightalign = 0

" completion
let g:LanguageClient_autoStart = 1

autocmd BufEnter * call ncm2#enable_for_buffer()
set completeopt=noinsert,menuone,noselect
set shortmess+=c

inoremap <C-c> <ESC>
inoremap <expr> <CR> pumvisible() ? "\<C-y>\<CR>" : "\<CR>"
inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"

inoremap <silent> <expr> <CR> ncm2_ultisnips#expand_or("\<CR>", 'n')
let g:UltiSnipsExpandTrigger = "<Plug>(ultisnips_expand)"
let g:UltiSnipsJumpForwardTrigger	= "<c-j>"
let g:UltiSnipsJumpBackwardTrigger	= "<c-k>"
let g:UltiSnipsRemoveSelectModeMappings = 0

" leader bindings
let mapleader = " "
let localmapleader = " "

autocmd Filetype python let b:dispatch='python %'

let g:LanguageClient_serverCommands = {
    \ 'python': ['pyls'],
    \ 'cpp': ['~/cquery/build/cquery', 
    \ '--log-file=/tmp/cq.log', 
    \ '--init={"cacheDirectory":"/tmp/cquery/", "completion": {"filterAndSort": false}}'],
    \ 'c': ['~/cquery/build/cquery', 
    \ '--log-file=/tmp/cq.log', 
    \ '--init={"cacheDirectory":"/tmp/cquery/", "completion": {"filterAndSort": false}}'],
\ }

nnoremap <silent><leader>k :call LanguageClient_textDocument_hover()<CR>
nnoremap <silent><leader>d :call LanguageClient_textDocument_definition()<CR>
nnoremap <silent><leader>t :call LanguageClient_textDocument_references()<CR>
nnoremap <silent><leader>s :call LanguageClient_textDocument_documentSymbol()<CR>

nnoremap <silent><leader>r :call LanguageClient_textDocument_rename()<CR>
nnoremap <silent><leader>f :call LanguageClient_textDocument_formatting()<CR>
nnoremap <silent><leader>a :call LanguageClient_textDocument_codeAction()<CR>

nnoremap <silent> <BS> :TmuxNavigateLeft<cr>
nnoremap <silent><leader><leader> :Dispatch<CR>
nnoremap <leader>F :Focus 
nnoremap <silent><leader>c :Codi!!<CR>

" colorscheme w/ rainbow parenthesis
set termguicolors
set background=dark
colorscheme chrome

let g:rainbow#pairs = [['(', ')'], ['[', ']'], ['{', '}']]
let g:rainbow#colors = {
\   'dark': [
\     ['85',  '#5fffaf'],
\     ['81',  '#5fd7ff'],
\     ['33',  '#0087ff'],
\     ['99',  '#875fff'],
\     ['204', '#ff5f87'],
\     ['231', '#ffffff'],
\   ]}

autocmd FileType * RainbowParentheses

" misc settings
set noshowmode
set signcolumn=yes
set hidden
set relativenumber
set number
set clipboard+=unnamedplus,unnamed
set wildmode=longest,list
set fillchars=vert: 
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
set pastetoggle=<F2>
cmap w!! w !sudo tee > /dev/null %
