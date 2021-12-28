set signcolumn=yes " add a column for signs (e.g. LSP, ...)
set laststatus=2 " always show last window status
nnoremap <leader>h :e /Windows/System32/drivers/etc/hosts<CR>
let g:prettier#quickfix_enabled = 0

let g:lightline = {
\ 'active': {
\   'left': [ [ 'mode', 'paste' ],
\             [ 'gitbranch', 'readonly', 'modified', 'filename' ] ]
\ },
\ 'component_function': {
\   'gitbranch': 'gitbranch#name'
\ },
\ }

let g:closetag_filenames =       '*.html,*.xhtml,*.jsx,*.js,*.tsx'
let g:closetag_xhtml_filenames = '*.html,*.xhtml,*.jsx,*.js,*.tsx'
let g:closetag_filetypes =       'html,xhtml,jsx,js,tsx'
let g:closetag_xhtml_filetypes = 'html,xhtml,jsx,js,tsx'
let g:closetag_emptyTags_caseSensitive = 1

" Disables auto-close if not in a "valid" region (based on filetype)
let g:closetag_regions = {
\ 'typescript.tsx':  'jsxRegion,tsxRegion',
\ 'javascript.jsx':  'jsxRegion',
\ 'typescriptreact': 'jsxRegion,tsxRegion',
\ 'javascriptreact': 'jsxRegion',
\ }
let g:closetag_shortcut = '>'
let g:closetag_close_shortcut = '<leader>>'

lua << EOF
-- Telescope ignore node modules
require('telescope').setup{ defaults = { file_ignore_patterns = {"node_modules"} } }
-- Setup nvim-cmp.
local cmp = require'cmp'
cmp.setup({
  snippet = {
    -- REQUIRED - you must specify a snippet engine
    expand = function(args)
      vim.fn["vsnip#anonymous"](args.body) -- For `vsnip` users.
    end,
  },
  sources = cmp.config.sources({
    { name = 'nvim_lsp' },
  }, {
    { name = 'buffer' },
  })
})
-- Use buffer source for `/` (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline('/', {
  sources = {
    { name = 'buffer' }
  }
})
-- Setup lspconfig.
local capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())
require('lspconfig').tsserver.setup {
  capabilities = capabilities
}
vim.cmd [[highlight IndentBlanklineIndent1 guifg=#262626 gui=nocombine]]
vim.opt.list = true
require("indent_blankline").setup { char_highlight_list = { "IndentBlanklineIndent1", }, }
EOF

nnoremap <silent> gd    <cmd>lua vim.lsp.buf.definition()<CR>
nnoremap <silent> gD    <cmd>lua vim.lsp.buf.implementation()<CR>
nnoremap <silent> K     <cmd>lua vim.lsp.buf.hover()<CR>
nnoremap <silent> gH    <cmd>lua vim.lsp.buf.code_action()<CR>
nnoremap <silent> <c-k> <cmd>lua vim.lsp.buf.signature_help()<CR>
nnoremap <silent> gr    <cmd>lua vim.lsp.buf.references()<CR>
nnoremap <silent> <f2>  <cmd>lua vim.lsp.buf.rename()<CR>

let g:syntastic_sass_checkers=["sasslint"]
let g:syntastic_scss_checkers=["sasslint"]
