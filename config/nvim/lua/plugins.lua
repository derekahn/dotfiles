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

  -- aesthetics 
  -- use {'edkolev/tmuxline.vim'} -- Tmux Status line
  use {'kyazdani42/nvim-web-devicons'} -- Web devicons for neovim
  use {'Yggdroot/indentLine'} -- Indention levels with thin vertical lines
  use {'navarasu/onedark.nvim', -- Atom's One Dark and Light theme
    style = 'darker',
    config = 'vim.cmd[[colorscheme onedark]]'
  }
  use {'nvim-lualine/lualine.nvim', -- Statusline
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
  use {'sidebar-nvim/sidebar.nvim',
    config = function()
      require('sidebar-nvim').setup({
        disable_default_keybindings = 1,
        bindings = {
          ['q'] = function() sidebar.close() end
        },
        open = true,
        side = 'left',
        initial_width = 25,
        hide_statusline = false,
        update_interval = 1000,
        sections = {'files', 'symbols', 'buffers', 'diagnostics', 'todos'},
        section_separator = {"", "-----", ""},
        files = {
          show_hidden = true,
          ignored_paths = {'%.git$'}
        },
        symbols = {
          icon = 'ƒ',
        },
        todos = {
          icon = '',
          ignored_paths = {'~'},
          initially_closed = false,
          ignored_paths = { '~' }
        },
        buffers = {
          icon = '',
          ignored_buffers = {} -- ignore buffers by regex
        },
        disable_closing_prompt = true
      })
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
  use {'nvim-telescope/telescope.nvim', -- Fuzzy finder
    requires = {
      {'nvim-lua/plenary.nvim'},
      {'nvim-telescope/telescope-fzf-native.nvim', run = 'make' }
    },
    config = function()
      local actions = require('telescope.actions')

      require('telescope').setup {
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
      require('telescope').load_extension('fzf')
    end,
  }
end)
