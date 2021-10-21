" function! s:show_documentation()
  " if (index(['vim','help'], &filetype) >= 0)
    " execute 'h '.expand('<cword>')
  " else
    " call CocAction('doHover')
  " endif
" endfunction

" function! s:check_back_space() abort
  " let col = col('.') - 1
  " return !col || getline('.')[col - 1]  =~# '\s'
" endfunction

call plug#begin(stdpath('data') . '/plugged')

Plug 'tomasiser/vim-code-dark'
Plug 'scrooloose/nerdtree'
Plug 'scrooloose/nerdcommenter'
Plug 'styled-components/vim-styled-components', { 'branch': 'main' }
" Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'pangloss/vim-javascript'
Plug 'peitalin/vim-jsx-typescript'
Plug 'leafgarland/typescript-vim'

Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

call plug#end()

let g:NERDCreateDefaultMappings = 0
let g:NERDSpaceDelims = 1
let g:NERDCustomDelimiters = { 'tsx': { 'left': '{/*','right': '*/}' } }
" let g:coc_global_extensions = [
	" \ 'coc-snippets',
	" \ 'coc-tsserver',
	" \ 'coc-eslint',
	" \ 'coc-json',
	" \ ]

" general
colorscheme codedark
set tabstop=2
set shiftwidth=2
set softtabstop=2
"set encoding=utf-8
" set termguicolors
set expandtab
set ai
set number
set ruler
set hlsearch
set ignorecase
autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o

" set path+=**
" set wildmenu
" map <c-f> :find *
map <c-f> :FZF<CR>

nnoremap <f1> :call <SID>show_documentation()<CR>
nmap <silent> <f12> <plug>(coc-definition)
nmap <silent> <c-f12> <plug>(coc-implementation)
nmap <silent> <f2> <Plug>(coc-rename)
" inoremap <silent><expr> <TAB>
      " \ pumvisible() ? "\<C-n>" :
			" \ <SID>check_back_space() ? "\<TAB>" :
			" \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

" vim-styled-components
" autocmd BufEnter *.{js,jsx,ts,tsx} :syntax sync fromstart
" autocmd BufLeave *.{js,jsx,ts,tsx} :syntax sync clear

nmap <c-b> :NERDTreeToggle<CR>
vmap <c-_> <plug>NERDCommenterToggle
nmap <c-_> <plug>NERDCommenterToggle
"inoremap <silent><expr> <tab> pumvisible() ? "<c-n><cr>" : "<tab>"

command Hosts :e /Windows/System32/drivers/etc/hosts
