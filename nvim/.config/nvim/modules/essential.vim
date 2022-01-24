let g:NERDCreateDefaultMappings = 0
let g:NERDSpaceDelims = 1
nmap <c-_>      <plug>NERDCommenterToggle
vmap <c-_>      <plug>NERDCommenterToggle
nmap <leader>cc <plug>NERDCommenterAltDelims
nnoremap <C-f>     <cmd>Telescope find_files<CR>
nnoremap <C-b>     <cmd>Telescope buffers<CR>
nnoremap <leader>f <cmd>lua require("telescope").extensions.live_grep_raw.live_grep_raw()<CR>

if !exists("g:llcolorscheme")
  let g:llcolorscheme = 'powerline'
endif
let g:lightline = {
\ 'colorscheme' : g:llcolorscheme,
\ 'active': {
\   'left': [ [ 'mode', 'paste' ],
\             [ 'gitbranch', 'readonly', 'modified', 'filename' ] ]
\ },
\ 'component_function': {
\   'gitbranch': 'gitbranch#name'
\ },
\ }
