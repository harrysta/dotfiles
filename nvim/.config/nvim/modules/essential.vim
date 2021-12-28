let g:NERDCreateDefaultMappings = 0
let g:NERDSpaceDelims = 1
let g:NERDCustomDelimiters={
\ 'javascript': { 'left': '//', 'right': '', 'leftAlt': '{/*', 'rightAlt': '*/}' },
\ 'typescript': { 'left': '//', 'right': '', 'leftAlt': '{/*', 'rightAlt': '*/}' },
\}
nmap <c-_>      <plug>NERDCommenterToggle
vmap <c-_>      <plug>NERDCommenterToggle
nmap <leader>ca <plug>NERDCommenterAltDelims
nnoremap <C-f>     <cmd>Telescope find_files<CR>
nnoremap <C-b>     <cmd>Telescope buffers<CR>
nnoremap <leader>f <cmd>Telescope live_grep<CR>
