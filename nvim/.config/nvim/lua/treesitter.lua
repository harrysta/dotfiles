local status, treesitter = pcall(require, 'nvim-treesitter.configs')
if not status then return end
local status, autotag = pcall(require, 'nvim-ts-autotag')
if not status then return end
treesitter.setup({
	sync_install = false,
	auto_install = false,
	highlight = {
		enable = true,
		additional_vim_regex_highlighting = false,
	},
	indent = {
		enable = true,
		disable = { 'cpp' },
	},
	autopairs = { enable = true },
	autotag = { enable = true },
})
