local status, toggleterm = pcall(require, 'toggleterm')
if not status then return end
toggleterm.setup({
	open_mapping = [[<c-_>]],
	hide_numbers = true,
	start_in_insert = true,
	insert_mappings = true,
	persist_size = true,
	direction = 'horizontal',
	size = function() return vim.fn.winwidth(0) * 0.4 end,
	close_on_exit = true,
	shell = vim.o.shell,
})
function _G.set_terminal_keymaps()
  local opts = { noremap = true }
  vim.api.nvim_buf_set_keymap(0, 't', '<esc>', [[<C-\><C-n>]], opts)
end
vim.cmd('autocmd! TermOpen term://* lua set_terminal_keymaps()')
