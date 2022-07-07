local fn = vim.fn
local install_path = fn.stdpath('data') .. '/site/pack/packer/start/packer.nvim'
if fn.empty(fn.glob(install_path)) > 0 then
	local packer_repos = 'https://github.com/wbthomason/packer.nvim'
	packer_bootstrap = fn.system({ 'git', 'clone', '--depth', '1', packer_repos, install_path })
	print(packer_bootstrap)
	vim.cmd([[packadd packer.nvim]])
end
local packer_status_ok, packer = pcall(require, 'packer')
if not packer_status_ok then return end
return packer.startup(function()
	if vim.g.colorscheme then use(vim.g.colorscheme) end
	-- core
	use 'wbthomason/packer.nvim'
	use 'nvim-lua/plenary.nvim'
	use 'nvim-lua/popup.nvim'
	-- utilities
	use 'inkarkat/vim-ReplaceWithRegister'
	use 'tpope/vim-surround'
	use 'qpkorr/vim-bufkill'
	use 'akinsho/toggleterm.nvim'
	-- completion engine
	use 'hrsh7th/nvim-cmp'
	use 'hrsh7th/cmp-nvim-lsp'
	use 'hrsh7th/cmp-buffer'
	use 'hrsh7th/cmp-path'
	use 'hrsh7th/cmp-cmdline'
	-- snippet engine
	use 'L3MON4D3/LuaSnip'
	use 'saadparwaiz1/cmp_luasnip'
	use 'rafamadriz/friendly-snippets'
	if packer_bootstrap then
		require('packer').sync()
	end
end)
