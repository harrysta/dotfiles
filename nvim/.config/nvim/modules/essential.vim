let g:NERDCreateDefaultMappings = 0
let g:NERDSpaceDelims = 1
let g:NERDCustomDelimiters={
\ 'javascript': { 'left': '//', 'right': '', 'leftAlt': '{/*', 'rightAlt': '*/}' },
\ 'typescript': { 'left': '//', 'right': '', 'leftAlt': '{/*', 'rightAlt': '*/}' },
\}
nmap <c-_>      <plug>NERDCommenterToggle
vmap <c-_>      <plug>NERDCommenterToggle
nmap <leader>cc <plug>NERDCommenterAltDelims
nnoremap <C-f>     <cmd>Telescope find_files<CR>
nnoremap <C-b>     <cmd>Telescope buffers<CR>
nnoremap <leader>f <cmd>lua require("telescope").extensions.live_grep_raw.live_grep_raw()<CR>
colorscheme tokyonight
