local status, lsp_installer = pcall(require, 'nvim-lsp-installer')
if not status then return end
local status, lspconfig = pcall(require, 'lspconfig')
if not status then return end
local status, cmp_nvim_lsp = pcall(require, 'cmp_nvim_lsp')
if not status then return end

local signs = {
	{ name = 'DiagnosticSignError', text = '' },
	{ name = 'DiagnosticSignWarn',  text = '' },
	{ name = 'DiagnosticSignHint',  text = '' },
	{ name = 'DiagnosticSignInfo',  text = '' },
}
for _, sign in ipairs(signs) do
	vim.fn.sign_define(sign.name, { texthl = sign.name, text = sign.text, numhl = '' })
end

vim.diagnostic.config({
	virtual_text = false,
	update_in_insert = false,
	underline = true,
	severity_sort = true,
	signs = { active = signs },
	float = {
		border = 'rounded',
		focusable = false,
		header = '',
	},
})

local opts = { noremap = true, silent = true }
local keymap = vim.keymap.set
vim.opt.signcolumn = 'yes'
vim.api.nvim_create_autocmd('CursorHold', { callback = vim.diagnostic.open_float })
keymap('n', ']d', vim.diagnostic.goto_next, opts)
keymap('n', '[d', vim.diagnostic.goto_prev, opts)

local on_attach = function(client, bufnr)
	local bufopts = { noremap = true, silent = true, buffer = bufnr }
	local lspf = vim.lsp.buf
	vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')
	keymap('n', 'gD',         lspf.declaration,     bufopts)
	keymap('n', 'gd',         lspf.definition,      bufopts)
	keymap('n', 'K',          lspf.hover,           bufopts)
	keymap('n', 'gi',         lspf.implementation,  bufopts)
	keymap('n', '<leader>D',  lspf.type_definition, bufopts)
	keymap('n', '<leader>rn', lspf.rename,          bufopts)
	keymap('n', '<leader>ca', lspf.code_action,     bufopts)
	keymap('n', '<leader>gr', lspf.references,      bufopts)
end

lsp_installer.setup{}
for _, s in ipairs(lsp_installer.get_installed_servers()) do
	local capabilities = vim.lsp.protocol.make_client_capabilities()
	lspconfig[s.name].setup({
		on_attach = on_attach,
		capabilities = cmp_nvim_lsp.update_capabilities(capabilities)
	})
end
