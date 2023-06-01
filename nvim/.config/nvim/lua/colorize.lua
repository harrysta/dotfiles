local status_ok, colorizer = pcall(require, 'colorizer')
if not status_ok then return end

local opts = { noremap = true, silent = true }
local keymap = vim.keymap.set

vim.opt.termguicolors = true
colorizer.setup()
keymap('n', '<c-l>', '<c-l>:ColorizerReloadAllBuffers<cr>', opts)
