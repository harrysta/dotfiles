set list " required by indent_blankline
let g:NERDCreateDefaultMappings = 0
let g:NERDSpaceDelims = 1
let g:NERDCustomDelimiters={
\ 'c': { 'left': '//', 'right': '', 'leftAlt': '/*', 'rightAlt': '*/' },
\ 'javascript': { 'left': '//', 'right': '', 'leftAlt': '{/*', 'rightAlt': '*/}' },
\ 'typescript': { 'left': '//', 'right': '', 'leftAlt': '{/*', 'rightAlt': '*/}' },
\}
nmap <c-_> <plug>NERDCommenterToggle
vmap <c-_> <plug>NERDCommenterToggle
nmap <leader>cc <plug>NERDCommenterAltDelims
highlight IndentBlanklineIndent1 guifg=#262626 gui=nocombine
let g:indent_blank_line_char_highlight_list = ["IndentBlanklineIndent1"]
let g:indent_blank_line_trailing_blankline_indent = v:true
" update indent_blankline after using fold commands
nnoremap zf zf:IndentBlanklineRefresh<CR>
nnoremap zF zF:IndentBlanklineRefresh<CR>
nnoremap zd zd:IndentBlanklineRefresh<CR>
nnoremap zD zD:IndentBlanklineRefresh<CR>
nnoremap zE zE:IndentBlanklineRefresh<CR>
nnoremap zo zo:IndentBlanklineRefresh<CR>
nnoremap zO zo:IndentBlanklineRefresh<CR>
nnoremap zc zc:IndentBlanklineRefresh<CR>
nnoremap zC zC:IndentBlanklineRefresh<CR>
nnoremap za za:IndentBlanklineRefresh<CR>
nnoremap zA zA:IndentBlanklineRefresh<CR>
nnoremap zv zv:IndentBlanklineRefresh<CR>
nnoremap zx zx:IndentBlanklineRefresh<CR>
nnoremap zX zX:IndentBlanklineRefresh<CR>
nnoremap zm zm:IndentBlanklineRefresh<CR>
nnoremap zM zM:IndentBlanklineRefresh<CR>
nnoremap zr zr:IndentBlanklineRefresh<CR>
nnoremap zR zR:IndentBlanklineRefresh<CR>
