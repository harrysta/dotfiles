syntax on
filetype plugin indent on " enable detection, plugins and indents
let mapleader = " "

set number " show absolute line numbers
set ruler " show line and column number
set nowrap " don't wrap lines overflowing screen
set backspace=indent,eol,start " fix backspace in mintty
set splitright
set splitbelow
set showcmd

set tabstop=2 " tab equals to 2 spaces
set softtabstop=2 " tabstop but for editing?
set shiftwidth=2 " indent using 2 spaces
set autoindent
set smartindent
set cindent "enable C-style indenting rules
set expandtab " replace tab with spaces
set cinoptions=l1 " align case label when it has a body

set smartcase " search via smartcase
set ignorecase " search case insensitive
set wildignorecase " :edit and :find case insensitive
set incsearch " search incremental
set hlsearch " highlight matches

set hidden " allow hidden buffers
set nobackup " don't create backup files
set noswapfile " undofiles make these pointless
set nowritebackup " don't write backup files
set undofile " persist undo tree
set undodir=$XDG_STATE_HOME/vim/undo

set updatetime=750 " time until update
set matchpairs+=<:> " navigate around tag edges with %
set shortmess+=c " don't show prompts often for completion
set completeopt=menuone,noselect " always show menu for completion
set foldopen-=block " disable opening folds using block navigation
