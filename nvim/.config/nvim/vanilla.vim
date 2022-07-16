syntax on " enable syntax highlighting
filetype plugin indent on " enable detection, plugins and indents
set nocompatible " this config is not for vi
set termguicolors " colours are cool
set splitright " split to the right
set splitbelow " split below
set tabstop=2 " tab equals to 2 spaces
set shiftwidth=2 " indent using 2 spaces
set autoindent " enable indenting
set cindent "enable C-style indenting rules
set number " show absolute line numbers
set ruler " show line and column number
set nowrap " don't wrap lines overflowing screen
set ignorecase " search case insensitive
set smartcase " search via smartcase
set wildignorecase " :edit and :find case insensitive
set incsearch " search incremental
set hlsearch " highlight matches
set hidden " allow hidden buffers
set nobackup " don't create backup files
set nowritebackup " don't write backup files
set cmdheight=1 " only one line for commands
set shortmess+=c " don't show prompts often for completion
set updatetime=750 " time until update
set undofile " persist undo tree
set matchpairs+=<:> " navigate around tag edges with %
set noswapfile " undofiles make these pointless
set completeopt=menuone,noselect " always show menu for completion
set foldopen-=block " disable opening folds using block navigation
set list " show tabs and trailing spaces
autocmd Filetype * set formatoptions-=cro " disable auto-commenting new lines under commented ones
runtime macros/matchit.vim " jump between matching tags
cabbrev wq w " the q is always pressed by accident
cabbrev w' w " prevent accidentally writing to a file called '
cabbrev q <Nop> " simply disable :q completely, :quit still works
nnoremap <silent> <up>   :resize +2<cr>
nnoremap <silent> <down> :resize -2<cr>
nnoremap <silent> <left>  :vertical resize +2<cr>
nnoremap <silent> <right> :vertical resize -2<cr>
nnoremap <silent> <c-k> :bprevious<cr>
nnoremap <silent> <c-j> :bnext<cr>
nmap <silent> cp :let @+ = expand("%:p")<cr>
nmap <leader>v :e $MYVIMRC<CR>
nmap Y y$
imap <c-r><space> <c-r>+
map <space> "+
