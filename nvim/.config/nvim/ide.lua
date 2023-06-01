pcall(require,  'impatient')
require 'plugins'
require 'treesitter'
require 'indenting'
require 'colorscheme'
require 'completion'
require 'commenting'
require 'search'
require 'lsp'
require 'gitlens'
require 'colorize'

local keymap = vim.api.nvim_set_keymap
local opts = { noremap = true, silent = true }

vim.g.codeium_disable_bindings = 1
vim.g.codeium_manual = true

vim.keymap.set('i', '<m-cr>', function () return vim.fn['codeium#Complete']() end, { expr = true })
vim.keymap.set('i', '<m-y>', function () return vim.fn['codeium#Accept']() end, { expr = true })
vim.keymap.set('i', '<m-n>', function() return vim.fn['codeium#CycleCompletions'](1) end, { expr = true })
vim.keymap.set('i', '<m-p>', function() return vim.fn['codeium#CycleCompletions'](-1) end, { expr = true })
vim.keymap.set('i', '<m-e>', function() return vim.fn['codeium#Clear']() end, { expr = true })

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
