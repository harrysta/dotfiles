syntax on " enable syntax highlighting
filetype plugin indent on " enable detection, plugins and indents
set nocompatible " this config is not for vi
set showcmd " my terminal is not slow
set splitright " split to the right
set splitbelow " split below
set tabstop=2 " tab equals to 2 spaces
set softtabstop=2 " tabstop but for editing?
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
set listchars=nbsp:+,tab:>\ ,trail:- " non-breaking spaces, tabs, and spaces
autocmd Filetype * set formatoptions-=cro " disable auto-commenting new lines under commented ones
autocmd Filetype,BufNewFile,BufRead *.c,*.h,*.cpp :call SetCOpts()
autocmd FileType,BufNewFile,BufRead markdown setlocal nocindent
runtime macros/matchit.vim " jump between matching tags
cabbrev wq w " the q is always pressed by accident
cabbrev w' w " prevent accidentally writing to a file called '
cabbrev q <Nop> " simply disable :q completely, :quit still works
nnoremap <silent> <up>   :resize +2<cr>
nnoremap <silent> <down> :resize -2<cr>
nnoremap <silent> <left>  :vertical resize +2<cr>
nnoremap <silent> <right> :vertical resize -2<cr>
nnoremap <silent> <expr> <c-j> &buftype ==# 'quickfix' ? ':cnext<cr><c-w><c-p>' : '<Nop>'
nnoremap <silent> <expr> <c-k> &buftype ==# 'quickfix' ? ':cprevious<cr><c-w><c-p>' : '<Nop'
nmap <silent> cp :let @+=substitute(expand("%:p"), "\\", "/", "g")<cr>
nmap <leader>v :e $MYVIMRC<cr>
nmap Y y$
imap <c-r><c-r> <c-r>"
imap <c-r><space> <c-r>+
map <space> "+

function SetCOpts()
	setlocal tabstop=8
	setlocal colorcolumn=80
	setlocal softtabstop=8
	setlocal shiftwidth=8
	setlocal noexpandtab
	setlocal wrap
endfunction
