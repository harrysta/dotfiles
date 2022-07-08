local tree_status_ok, nvimtree = pcall(require, 'nvim-tree')
if not tree_status_ok then return end
local config_status_ok, nvimtree_config = pcall(require, 'nvim-tree.config')
if not config_status_ok then return end
local callback = nvimtree_config.nvim_tree_callback
nvimtree.setup({
	disable_netrw = true,
	hijack_netrw = true,
	open_on_setup = false,
	open_on_tab = false,
	hijack_cursor = true,
	update_focused_file = {
		enable = true,
		ignore_list = {},
	},
	view = {
		width = 30,
		adaptive_size = true,
		hide_root_folder = true,
		side = 'left',
		mappings = { 
			list = {
				{ key = '<C-s>', action = 'split' },
			},
		},
	},
	git = {
		enable = true,
		ignore = false,
	}
})
