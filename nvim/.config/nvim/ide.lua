local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
  -- libs
  "nvim-lua/plenary.nvim",
  "nvim-lua/popup.nvim",

  -- utils
  "qpkorr/vim-bufkill",
  "inkarkat/vim-ReplaceWithRegister",

  -- tpope
  "tpope/vim-repeat",
  "tpope/vim-eunuch",
  "tpope/vim-fugitive",

  -- surround
  {
    "tpope/vim-surround",
    config = function()
      -- replace substitute with surround
      vim.api.nvim_set_keymap('n', 's', 'ys', {})
      vim.api.nvim_set_keymap('n', 'S', 'yS', {})
      vim.api.nvim_set_keymap('v', 's', 'S' , {})
    end,
  },
  
  -- comment
  {
    "numToStr/Comment.nvim",
    config = function()
      require('Comment').setup({
        pre_hook = function(ctx)
          local U = require 'Comment.utils'
          local location = nil
          if ctx.ctype == U.ctype.block then
            location = require('ts_context_commentstring.utils').get_cursor_location()
          elseif ctx.cmotion == U.cmotion.v or ctx.cmotion == U.cmotion.V then
            location = require('ts_context_commentstring.utils').get_visual_start_location()
          end
          return require('ts_context_commentstring.internal').calculate_commentstring {
            key = ctx.ctype == U.ctype.line and '__default' or '__multiline',
            location = location,
          }
        end
      })
    end,
  },

  -- colorizer
  {
    "norcalli/nvim-colorizer.lua",
    config = function()
      vim.opt.termguicolors = true
      vim.api.nvim_set_keymap('n', '<c-l>', '<c-l>:ColorizerReloadAllBuffers<cr>', {noremap = true, silent = true})
      require("colorizer").setup()
    end
  },

  -- telescope
  {
    "nvim-telescope/telescope.nvim",
    keys = {
      { "<c-p>", "<cmd>Telescope find_files<cr>" },
      { "<c-f>", "<cmd>Telescope live_grep<cr>" },
      { "<c-b>", "<cmd>Telescope buffers<cr>" },
      { "<c-t>", "<cmd>Telescope<cr>" },
    },
    config = function()
      local actions = require('telescope.actions')
      require("telescope").setup({
        defaults = {
          path_display = { 'smart' },
          file_ignore_patterns = { '*.dll' },
          mappings = {
            i = {
              ["<esc>"] = actions.close,
              ["<c-s>"] = actions.select_horizontal,
            }
          }
        }
      })
    end,
  },

  -- treesitter
  {
    "nvim-treesitter/nvim-treesitter",
    opts = {
      indent = { enable = true, },
      autopairs = { enable = true },
      autotag = { enable = true },
    },
  },
  "nvim-treesitter/nvim-treesitter-context",
  "JoosepAlviste/nvim-ts-context-commentstring",

  -- lsp
  {
    "neovim/nvim-lspconfig",
    dependencies = {
      "williamboman/mason.nvim",
      "williamboman/mason-lspconfig.nvim",
    },
    config = function()
      require("mason").setup()
      require("mason-lspconfig").setup({
        handlers = {
          function (server_name)
            require('lspconfig')[server_name].setup({
              on_attach = attach,
            })
          end,
        }
      })

      local opts = { noremap = true, silent = true }

      vim.opt.signcolumn = 'no'
      vim.keymap.set('n', '<c-j>', vim.diagnostic.goto_next, opts)
      vim.keymap.set('n', '<c-k>', vim.diagnostic.goto_prev, opts)

      vim.api.nvim_create_autocmd("LspAttach", {
        group = vim.api.nvim_create_augroup("LspConfig", {}),
        callback = function(ev)
          vim.bo[ev.buf].omnifunc = 'v:lua.vim.lsp.omnifunc'
          local opts = { buffer = ev.buf }

          vim.keymap.set('n', 'gD',         vim.lsp.buf.declaration,     opts)
          vim.keymap.set('n', 'gd',         vim.lsp.buf.definition,      opts)
          vim.keymap.set('n', 'K',          vim.lsp.buf.hover,           opts)
          vim.keymap.set('n', 'gi',         vim.lsp.buf.implementation,  opts)
          vim.keymap.set('n', '<leader>D',  vim.lsp.buf.type_definition, opts)
          vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename,          opts)
          vim.keymap.set('n', '<leader>ca', vim.lsp.buf.code_action,     opts)
          vim.keymap.set('n', '<leader>gr', vim.lsp.buf.references,      opts)
        end,
      })
    end,
  },

  -- completion
  {
    "hrsh7th/nvim-cmp",
    dependencies = {
      "hrsh7th/cmp-nvim-lsp",
      "hrsh7th/cmp-buffer",
      "L3MON4D3/LuaSnip",
      "saadparwaiz1/cmp_luasnip",
    },
  }
})
