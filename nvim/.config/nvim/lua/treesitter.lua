local status, treesitter = pcall(require, 'nvim-treesitter.configs')
if not status then return end
local status, autotag = pcall(require, 'nvim-ts-autotag')
if not status then return end
treesitter.setup({
	ensure_installed = { 'c', 'javascript', 'typescript', 'tsx', 'scss', 'json' },
	sync_install = false,
	auto_install = true,
	highlight = {
		enable = true,
		additional_vim_regex_highlighting = false,
	},
	indent = {
		enable = true,
		disable = { 'cpp' },
	},
	autopairs = { enable = true },
	context_commentstring = {
		enable = true,
		enable_autocmd = false,
	},
	autotag = { enable = true },
})
