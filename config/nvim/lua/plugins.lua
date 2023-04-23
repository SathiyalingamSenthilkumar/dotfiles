local fn = vim.fn

local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
if fn.empty(fn.glob(install_path)) > 0 then
  PACKER_BOOTSTRAP=fn.system({'git','clone','--depth','1','https://github.com/wbthomason/packer.nvim',install_path})
  vim.cmd('packadd packer.nvim')
end

local status_ok, packer = pcall(require, 'packer')
if not status_ok then
  return
end

-- Install here
return require('packer').startup(function(use)
  -- Let packer manage itself, have it depend on some common stuff
  use { 'wbthomason/packer.nvim',
    requires = {
      { 'nvim-lua/popup.nvim' },
      { 'nvim-lua/plenary.nvim' },
      { 'kyazdani42/nvim-web-devicons' }
    }
  }

  -- Colorschemes
  use { 'ellisonleao/gruvbox.nvim' }

  -- Bufferline
  use { 'akinsho/bufferline.nvim', }

  -- Lualine
  use { 'nvim-lualine/lualine.nvim' }

  -- File explorer
  use { 'kyazdani42/nvim-tree.lua' }

  -- Color highlighter
  use { 'norcalli/nvim-colorizer.lua' }

  -- GIT handler
  use { 'lewis6991/gitsigns.nvim' }

  -- Buffer closer
  use { 'moll/vim-bbye' }

  -- Navigation
  use { 'phaazon/hop.nvim' }

  -- Notifications
  use { 'rcarriga/nvim-notify' }

  -- Project management
  use { 'ahmedkhalf/project.nvim' }

  --Telescope (requires BurntSushi/ripgrep for live_grep to work)
  use { 'nvim-telescope/telescope.nvim' }

  -- Comment toggle
  use { 'numToStr/Comment.nvim' }

  -- Treesitter
  use { 'nvim-treesitter/nvim-treesitter',
    run = {
        function()
            local ts_update = require('nvim-treesitter.install').update({ with_sync = true })
            ts_update()
        end,
    },
    requires = { 'lewis6991/nvim-treesitter-context' },
  }
  use { 'nvim-treesitter/nvim-treesitter-textobjects',
      after = { 'nvim-treesitter' },
      requires = { 'nvim-treesitter/nvim-treesitter' },
  }

  -- LSP
  use { 'neovim/nvim-lspconfig' }
  use { 'tami5/lspsaga.nvim' }

  -- Autocomplete with LSP and luasnip
  use { 'hrsh7th/nvim-cmp',
    requires = {
      { 'hrsh7th/cmp-nvim-lsp' },
      { 'hrsh7th/cmp-nvim-lsp-signature-help' },
      { 'hrsh7th/cmp-path' },
      { 'saadparwaiz1/cmp_luasnip' },
      { 'L3MON4D3/LuaSnip' },
    }
  }
  use { 'jose-elias-alvarez/null-ls.nvim' } -- Null LS for extras
  use { 'simrat39/symbols-outline.nvim' }

  -- Autopairs (To automatically open and close brackets)
  use { 'windwp/nvim-autopairs' }

  -- Filetype detection
  use { 'nathom/filetype.nvim' }

  if PACKER_BOOTSTRAP then
    packer.sync()
  end
end)
