local install_path = vim.fn.stdpath('data') .. '/site/pack/packer/start/packer.nvim'
if vim.fn.empty(vim.fn.glob(install_path)) > 0 then
	local packer_repos = 'https://github.com/wbthomason/packer.nvim'
	str = vim.fn.system({ 'git', 'clone', '--depth', '1', packer_repos, install_path })
	print(str)
	vim.cmd([[packadd packer.nvim]])
end
local status, packer = pcall(require, 'packer')
if not status then return end
return packer.startup(function()
	if vim.g.colorscheme then use(vim.g.colorscheme) end
	-- package manager
	use 'wbthomason/packer.nvim'
	-- libs
	use 'nvim-lua/plenary.nvim'
	use 'nvim-lua/popup.nvim'
	-- treesitter
	use 'nvim-treesitter/nvim-treesitter'
	use 'nvim-treesitter/nvim-treesitter-context'
	use 'JoosepAlviste/nvim-ts-context-commentstring'
	-- utilities
	use 'tpope/vim-repeat'
	use 'tpope/vim-eunuch'
	use 'tpope/vim-fugitive'
	use 'qpkorr/vim-bufkill'
	use 'numToStr/Comment.nvim'
	-- use 'lewis6991/gitsigns.nvim'
	use 'inkarkat/vim-ReplaceWithRegister'
	use 'nvim-telescope/telescope.nvim'
	use 'norcalli/nvim-colorizer.lua'
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
