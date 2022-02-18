local fn = vim.fn

-- Automatically install packer
local install_path = fn.stdpath 'data' .. '/site/pack/packer/start/packer.nvim'
if fn.empty(fn.glob(install_path)) > 0 then
  PACKER_BOOTSTRAP = fn.system {
    'git',
    'clone',
    '--depth',
    '1',
    'https://github.com/wbthomason/packer.nvim',
    install_path,
  }
  print 'Installing packer close and reopen Neovim...'
  vim.cmd [[packadd packer.nvim]]
end

-- Autocommand that reloads neovim whenever you save the plugins.lua file
vim.cmd [[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
  augroup end
]]

-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, 'packer')
if not status_ok then
  return
end

-- Have packer use a popup window
packer.init {
  display = {
    open_fn = function()
      return require('packer.util').float { border = 'rounded' }
    end,
  },
}

return packer.startup(function(use)
  use 'wbthomason/packer.nvim' -- have packer manage itself

  use 'nvim-lua/plenary.nvim' -- useful lua functions used ny lots of plugins
  use 'lewis6991/impatient.nvim' -- improve startup time for neovim
  use 'nvim-lua/popup.nvim' -- an implementation of the popup api from vim in neovim

  -- aesthetics
  use {'navarasu/onedark.nvim', -- atom's one dark and light theme
    style = 'darker',
    config = 'vim.cmd[[colorscheme onedark]]'
  }
  use 'goolord/alpha-nvim' -- greeter like vim-startify
  use 'kyazdani42/nvim-web-devicons' -- dev icons
  use 'kyazdani42/nvim-tree.lua' -- a file explorer tree
  use 'ahmedkhalf/project.nvim' -- fuzzy finder for projects
  use 'akinsho/bufferline.nvim' -- a snazzy bufferline
  use 'nvim-lualine/lualine.nvim' -- statusline

  -- cmp plugins
  use 'hrsh7th/nvim-cmp' -- completion plugin
  use 'hrsh7th/cmp-buffer' -- buffer completions
  use 'hrsh7th/cmp-path' -- path completions
  use 'hrsh7th/cmp-cmdline' -- cmdline completions
  use 'saadparwaiz1/cmp_luasnip' -- snippet completions
  use 'hrsh7th/cmp-nvim-lsp'

  -- snippets
  use 'L3MON4D3/LuaSnip' -- snippet engine
  use 'rafamadriz/friendly-snippets' -- a bunch of snippets to use

  -- lsp
  use 'antoinemadec/FixCursorHold.nvim' -- this is needed to fix lsp doc highlight
  use 'neovim/nvim-lspconfig' -- enable lsp
  use 'williamboman/nvim-lsp-installer' -- simple to use language server installer
  use 'tamago324/nlsp-settings.nvim' -- language server settings defined in json for
  use 'jose-elias-alvarez/null-ls.nvim' -- for formatters and linters

  -- HUD
  use 'lukas-reineke/indent-blankline.nvim' -- indent guides
  use 'folke/which-key.nvim' -- keybindings and help modal
  use 'lewis6991/gitsigns.nvim' -- like gitgutter
  use 'JoosepAlviste/nvim-ts-context-commentstring' -- empowers treesitter
  use {'nvim-telescope/telescope.nvim', -- fuzzy finder with preview
    requires = {
      {'nvim-lua/plenary.nvim'},
      {'nvim-telescope/telescope-fzf-native.nvim', run = 'make' }
    },
  }
  use {
    'nvim-treesitter/nvim-treesitter',
    run = ':TSUpdate',
  }

  -- editing
  use 'numToStr/Comment.nvim' -- toggle comment
  use 'tpope/vim-abolish' -- case coercion
  use 'tpope/vim-surround' -- quoting/parenthesizing made simple
  use 'windwp/nvim-autopairs' -- autopairs, integrates with both cmp and treesitter

  -- utils
  use 'christoomey/vim-tmux-navigator' -- seamless navigation between tmux panes and vim splits
  use 'troydm/zoomwintab.vim' -- zoom in/out of windows

  -- Automatically set up your configuration after cloning packer.nvim
  -- Put this at the end after all plugins
  if PACKER_BOOTSTRAP then
    require('packer').sync()
  end
end)
