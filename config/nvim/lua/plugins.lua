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

  -- Aesthetics 
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
          -- ['q'] = function() sidebar.close() end
        },
        open = true,
        side = 'left',
        initial_width = 25,
        hide_statusline = true,
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

  -- LSP
  use {'neovim/nvim-lspconfig'}
  use {'nvim-lua/completion-nvim'}

  -- HUD
  use {'nvim-treesitter/nvim-treesitter', -- Git integration for buffers
    run = ':TSUpdate',
    config = function()
      require('nvim-treesitter.configs').setup {
        autotag = {
          enable = true
        },
        ensure_installed = {
          'bash',
          'dockerfile',
          'go',
          'json',
          'lua',
          'markdown',
          'rust',
          'toml',
          'javascript',
          'typescript',
          'yaml',
        },
        highlight = {
          enable = true,
        },
        incremental_selection = {
          enable = true,
          keymaps = {
            init_selection = "gnn",
            node_incremental = "grn",
            scope_incremental = "grc",
            node_decremental = "grm",
          },
        },
        textobjects = {
          select = {
            enable = true,

            -- Automatically jump forward to textobj, similar to targets.vim
            lookahead = true,

            keymaps = {
              -- You can use the capture groups defined in textobjects.scm
              ["af"] = "@function.outer",
              ["if"] = "@function.inner",
              ["ac"] = "@class.outer",
              ["ic"] = "@class.inner",
              ["ab"] = "@block.outer",
              ["ib"] = "@block.inner",
            },
          },
          move = {
            enable = true,
            set_jumps = true, -- whether to set jumps in the jumplist
            goto_next_start = { ["]m"] = "@function.outer", ["]]"] = "@class.outer" },
            goto_next_end = { ["]M"] = "@function.outer", ["]["] = "@class.outer" },
            goto_previous_start = { ["[m"] = "@function.outer", ["[["] = "@class.outer" },
            goto_previous_end = { ["[M"] = "@function.outer", ["[]"] = "@class.outer" },
          },
        },
      }
    end
  }
  use {'lewis6991/gitsigns.nvim',
    requires = {
      'nvim-lua/plenary.nvim'
    },
    config = function()
      require('gitsigns').setup {
        on_attach = function(bufnr)
          local function map(mode, lhs, rhs, opts)
              opts = vim.tbl_extend('force', {noremap = true, silent = true}, opts or {})
              vim.api.nvim_buf_set_keymap(bufnr, mode, lhs, rhs, opts)
          end

          -- Navigation
          map('n', ']c', "&diff ? ']c' : '<cmd>Gitsigns next_hunk<CR>'", {expr=true})
          map('n', '[c', "&diff ? '[c' : '<cmd>Gitsigns prev_hunk<CR>'", {expr=true})

          -- Actions
          map('n', '<leader>tb', '<cmd>Gitsigns toggle_current_line_blame<CR>')
          map('n', '<leader>td', '<cmd>Gitsigns toggle_deleted<CR>')
          map('n', '<leader>dt', '<cmd>Gitsigns diffthis<CR>')
          map('n', '<leader>DT', '<cmd>lua require"gitsigns".diffthis("~")<CR>')
        end,

        current_line_blame = false,
        current_line_blame_opts = {
          virt_text = true,
          virt_text_pos = 'eol',
          delay = 1000,

        }
      }
    end,
  }

  -- Editing
  use {'tpope/vim-surround'} -- Quoting/parenthesizing made simple
  use {'tpope/vim-commentary'} -- Toggle comment
  use {'jiangmiao/auto-pairs'} -- Auto close brackets, parenthesis etc
  use {'tpope/vim-abolish'} -- Case coercion

  -- Utils
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


-- LSP
local lsp = require 'lspconfig'
local completion = require 'completion'

lsp.tsserver.setup{on_attach=completion.on_attach}
lsp.rust_analyzer.setup{on_attach=completion.on_attach}

-- Fern
v.v.g['fern#renderer'] = 'nerdfont'
