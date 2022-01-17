set completeopt=menu,menuone,noselect " better autocomplete options
set mouse=a " all mode mouse support
set splitright " splits to the right
set splitbelow " splits below
set expandtab " space characters instead of tab
set tabstop=2 " tab equals 2 spaces
set shiftwidth=2 " indentation
set number " show absolute line numbers
set ruler " automatically added by lightline
set ignorecase " search case insensitive
set smartcase " search via smartcase
set incsearch " search incremental
set hlsearch " highlight matches
set hidden " allow hidden buffers
set nobackup " don't create backup files
set nowritebackup " don't write backup files
set cmdheight=1 " only one line for commands
set shortmess+=c " don't need to press enter so often for completion
set updatetime=750 " time until update
set undofile " persists undo tree
set matchpairs+=<:> " navigate around tag edges with %
set noswapfile
autocmd FileType * setlocal formatoptions-=cro " disable auto-commenting new lines under commented ones
filetype plugin indent on " enable detection, plugins and indents
let g:netrw_banner=0 " disable banner in netrw
let g:netrw_liststyle=3 " tree view in netrw
let g:netrw_winsize=35 " cover only a percentage of the screen
" folds
nnoremap <silent> <Space> @=(foldlevel('.')?'za':"\<Space>")<CR>
vnoremap <Space> zf
" disable accidentally typing :q command
cabbrev q <c-r>=(getcmdtype()==':' && getcmdpos()==1 ? 'echo' : 'q')<CR>
" replace :w with :w! to bypass read-only prompt
cabbrev w <c-r>='w!'<CR>
" don't select line after paragraph in visual mode
vnoremap } }k
" jump between matching tags
runtime macros/matchit.vim
nnoremap <leader>v :e $MYVIMRC<CR>
