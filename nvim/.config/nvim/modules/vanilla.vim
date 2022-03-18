syntax on " enable syntax highlighting
set mouse=a " all mode mouse support
set splitright " split to the right
set splitbelow " split below
set tabstop=2 " tab equals 2 spaces
set shiftwidth=2 " indentation
set number " show absolute line numbers
set ruler " show line and column number
set ignorecase " search case insensitive
set smartcase " search via smartcase
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
set path+=src/**,include/** " enable navigating through files in c projects
set completeopt=menu,menuone,noselect " better autocomplete options
autocmd Filetype * set formatoptions-=cro " disable auto-commenting new lines under commented ones
set foldopen-=block " disable opening folds using block navigation
autocmd BufWinLeave *.* mkview " save folding in view file
autocmd BufWinEnter *.* silent! loadview " loading folding from view file (ignore non-existing)
autocmd Filetype c nnoremap <c-p> oprintf("\n", );<ESC>6hi
filetype plugin indent on " enable detection, plugins and indents
runtime macros/matchit.vim " jump between matching tags
" disable accidentally typing :q or :wq command
cabbrev q <c-r>=(getcmdtype()==':' && getcmdpos()==1 ? 'echo' : 'q')<CR>
cabbrev wq <c-r>=(getcmdtype()==':' && getcmdpos()==1 ? 'echo' : 'wq')<CR>
nnoremap <leader>v :e $MYVIMRC<CR>
nmap Y y$
if has('win32')
	let notes_dir = '$HOMEDRIVE$HOMEPATH/Documents'
	let hosts_dir = '$SYSTEMROOT/System32/drivers'
else
	let notes_dir = '$HOME/doc/local'
	let hosts_dir = ''
endif
execute 'nnoremap <leader>n :e ' . notes_dir . '/notes<CR>'
execute 'nnoremap <leader>h :e ' . hosts_dir . '/etc/hosts<CR>'
command -nargs=1 F vimgrep <args> | cope " grep and show results window
