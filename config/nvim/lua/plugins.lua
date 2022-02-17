-- Bootstrap packer
local execute = vim.api.nvim_command
local fn = vim.fn

local install_path = fn.stdpath('data') .. '/site/pack/packer/start/packer.nvim'

if fn.empty(fn.glob(install_path)) > 0 then
  execute('!mkdir -p ' .. install_path)
  execute('!git clone https://github.com/wbthomason/packer.nvim ' .. install_path)
end

local packer = require('packer')
local v = require('utils')

-- Install Plugins
packer.startup(function()
  use {'wbthomason/packer.nvim'}
  use {'nvim-lua/plenary.nvim'}

  -- aesthetics
  use {'kyazdani42/nvim-web-devicons'} -- Web devicons for neovim
  use {'Yggdroot/indentLine'} -- Indention levels with thin vertical lines
  use {
    'navarasu/onedark.nvim', -- Atom's One Dark and Light theme
    style = 'darker',
    config = 'vim.cmd[[colorscheme onedark]]'
  }
  use {
    'nvim-lualine/lualine.nvim', -- Statusline
    requires = {
      'kyazdani42/nvim-web-devicons',
      opt = true
    },
    config = function()
      require('lualine').setup({
        options = {
          theme = 'onedark'
        }
      })
    end,
  }
  use {
    'nvim-telescope/telescope.nvim', -- Fuzzy finder
    requires = { {'nvim-lua/plenary.nvim'} },
    config = function()
      local telescope = require('telescope')
      local actions = require('telescope.actions')

      telescope.setup {
        extensions = {
          fzf = {
            fuzzy = true,                    -- false will only do exact matching
            override_generic_sorter = true,  -- override the generic sorter
            override_file_sorter = true,     -- override the file sorter
            case_mode = "smart_case",        -- or "ignore_case" or "respect_case"
                                            -- the default case_mode is "smart_case"
          }
        },
        defaults = {
          file_ignore_patterns = {
            '.png', '.import', '.tres', '.wav', '.otf', '.ttf',
            'node_modules', 'vendor'
          },
          mappings = {
            i = {
              ['<esc>'] = actions.close
            }
          }
        },
      }
    end,
  }

  -- editing
  use {'tpope/vim-surround'} -- Quoting/parenthesizing made simple
  use {'tpope/vim-commentary'} -- Toggle comment
  use {'jiangmiao/auto-pairs'} -- Auto close brackets, parenthesis etc
  use {'tpope/vim-abolish'} -- Case coercion

  -- utils
  use {'christoomey/vim-tmux-navigator'} -- Seamless navigation between tmux panes and vim splits
  use {'troydm/zoomwintab.vim'} -- Zoom in/out of windows
end)
