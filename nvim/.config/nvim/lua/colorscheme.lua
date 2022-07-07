if not vim.g.colorscheme then
	vim.cmd('colorscheme default')
	vim.opt.background='dark'
	return
end
if vim.fn.exists('*ColorschemeFunc') ~= 0 then
	vim.fn['ColorschemeFunc']()
end
