if not vim.g.colorscheme or os.getenv('TERM') == 'linux' then
	vim.cmd('colorscheme default')
	vim.opt.background='dark'
	return
end
if vim.fn.exists('*ColorschemeFunc') ~= 0 then
	vim.cmd('silent! exec ColorschemeFunc()')
end
