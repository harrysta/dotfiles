pcall(require,  'impatient')
require 'plugins'
require 'treesitter'
require 'indenting'
require 'colorscheme'
require 'terminal'
require 'completion'
require 'commenting'
require 'search'
require 'lsp'

local keymap = vim.api.nvim_set_keymap
local opts = { noremap = true, silent = true }

-- show cursorline only on focused window + buffer
if os.getenv('TERM') ~= 'linux' then
	vim.cmd([[
		augroup CursorLine
			au!
			au VimEnter * setlocal cursorline
			au WinEnter * setlocal cursorline
			au BufWinEnter * setlocal cursorline
			au WinLeave * setlocal nocursorline
		augroup END
	]])
end
-- replace substitute with surround
keymap('n', 's', 'ys', {})
keymap('n', 'S', 'yS', {})
keymap('v', 's', 'S' , {})
-- recapture visual when indenting
keymap('v', '<', '<gv', opts)
keymap('v', '>', '>gv', opts)
