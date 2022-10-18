local fn = vim.fn
local install_path = fn.stdpath('data') .. '/site/pack/packer/start/packer.nvim'
if fn.empty(fn.glob(install_path)) > 0 then
	local packer_repos = 'https://github.com/wbthomason/packer.nvim'
	str = fn.system({ 'git', 'clone', '--depth', '1', packer_repos, install_path })
	print(str)
	vim.cmd([[packadd packer.nvim]])
end
local status, packer = pcall(require, 'packer')
if not status then return end
return packer.startup(function()
	if vim.g.colorscheme then use(vim.g.colorscheme) end
	-- core
	use 'wbthomason/packer.nvim'
	use 'nvim-lua/plenary.nvim'
	use 'nvim-lua/popup.nvim'
	use 'kyazdani42/nvim-web-devicons'
	use 'nvim-treesitter/nvim-treesitter'
	use 'lukas-reineke/indent-blankline.nvim'
	use 'lewis6991/impatient.nvim'
	use 'dstein64/vim-startuptime'
	-- utilities
	use 'inkarkat/vim-ReplaceWithRegister'
	use 'tpope/vim-surround'
	use 'tpope/vim-repeat'
	use 'tpope/vim-eunuch'
	use 'qpkorr/vim-bufkill'
	use 'numToStr/Comment.nvim'
	use 'JoosepAlviste/nvim-ts-context-commentstring'
	use 'windwp/nvim-ts-autotag'
	use 'nvim-telescope/telescope.nvim'
	use 'lewis6991/gitsigns.nvim'
	use 'harrysta/vim-sysout'
	-- completion engine
	use 'hrsh7th/nvim-cmp'
	use 'hrsh7th/cmp-buffer'
	use 'hrsh7th/cmp-path'
	use 'hrsh7th/cmp-cmdline'
	use 'hrsh7th/cmp-nvim-lsp'
	use 'saadparwaiz1/cmp_luasnip'
	-- snippet engine
	use 'L3MON4D3/LuaSnip'
	use 'rafamadriz/friendly-snippets'
	-- lsp
	use 'neovim/nvim-lspconfig'
	use 'williamboman/nvim-lsp-installer'
	if str then
		require('packer').sync()
	end
end)
