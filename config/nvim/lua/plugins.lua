local lazypath = vim.fn.stdpath('data') .. '/lazy/lazy.nvim'

if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    'git',
    'clone',
    '--filter=blob:none',
    'https://github.com/folke/lazy.nvim.git',
    '--branch=stable', -- latest stable release
    lazypath,
  })
end

vim.opt.rtp:prepend(lazypath)

local status_ok, lazy = pcall(require, 'lazy')
if not status_ok then
  print('Lazy does not load!')
end

local plugins = {
  -- common stuff
  { 'nvim-lua/popup.nvim' },
  { 'kyazdani42/nvim-web-devicons' },

  -- Colorschemes
  { 'ellisonleao/gruvbox.nvim' },

  -- Color highlighter
  { 'NvChad/nvim-colorizer.lua' },

  -- Bufferline
  { 'akinsho/bufferline.nvim' },

  -- Lualine
  { 'nvim-lualine/lualine.nvim' },

  -- File explorer
  { 'kyazdani42/nvim-tree.lua' },

  -- GIT handler
  { 'lewis6991/gitsigns.nvim' },

  -- Buffer closer
  { 'moll/vim-bbye' },

  -- Navigation
  { 'phaazon/hop.nvim' },

  -- Notifications
  { 'rcarriga/nvim-notify' },

  -- Project management
  { 'ahmedkhalf/project.nvim' },

  --Telescope (requires BurntSushi/ripgrep for live_grep to work)
  { 'nvim-telescope/telescope.nvim',
    dependencies = { 'nvim-lua/plenary.nvim' }
  },

  -- Comment toggle
  { 'numToStr/Comment.nvim' },

  -- Treesitter
  { 'nvim-treesitter/nvim-treesitter',
    build = {
        function()
            local ts_update = require('nvim-treesitter.install').update({ with_sync = true })
            ts_update()
        end,
    },
    dependencies = { 'lewis6991/nvim-treesitter-context' },
  },
  { 'nvim-treesitter/nvim-treesitter-textobjects',
    dependencies = {
            { 'nvim-treesitter/nvim-treesitter' },
            { 'nvim-treesitter' },
        }
  },

  -- LSP
  { 'neovim/nvim-lspconfig' },
  { 'tami5/lspsaga.nvim' },

  -- Autocomplete with LSP and luasnip
  { 'hrsh7th/nvim-cmp',
    dependencies = {
      { 'hrsh7th/cmp-nvim-lsp' },
      { 'hrsh7th/cmp-nvim-lsp-signature-help' },
      { 'hrsh7th/cmp-path' },
      { 'saadparwaiz1/cmp_luasnip' },
      { 'L3MON4D3/LuaSnip' },
    }
  },
  { 'simrat39/symbols-outline.nvim' },

  -- Autopairs (To automatically open and close brackets)
  { 'windwp/nvim-autopairs' },

}

return lazy.setup(plugins)
