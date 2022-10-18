local status, telescope = pcall(require, 'telescope')
if not status then return end
local actions = require('telescope.actions')
telescope.setup {
	defaults = {
		path_display = { 'smart' },
		file_ignore_patterns = { '*.dll' },
		mappings = {
			i = {
				['<esc>'] = actions.close,
			},
		},
	},
}
local keymap = vim.api.nvim_set_keymap
local opts = { noremap = true, silent = true }
keymap('n', '<c-p>', '<cmd>Telescope find_files<cr>', opts)
keymap('n', '<c-f>', '<cmd>Telescope live_grep<cr>', opts)
keymap('n', '<c-b>', '<cmd>Telescope buffers<cr>', opts)
keymap('n', '<c-t>', '<cmd>Telescope<cr>', opts)
