call plug#begin(stdpath('data') . '/plugged')
Plug 'tomasiser/vim-code-dark'
Plug 'scrooloose/nerdcommenter'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
call plug#end()

let g:NERDSpaceDelims = 1
set tabstop=2
set shiftwidth=2
set softtabstop=2
set expandtab
set autoindent
set ignorecase
set number
set ruler
set hlsearch
set wildmenu
set path+=**
map <c-f> :FZF<CR>
autocmd FileType * setlocal formatoptions-=c fo-=r fo-=o
vmap <c-_> <plug>NERDCommenterToggle
nmap <c-_> <plug>NERDCommenterToggle
