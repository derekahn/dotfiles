-- general
lvim.log.level = "warn"
lvim.format_on_save = true
lvim.colorscheme = "onedark"

-- keymappings [view all the defaults by pressing <leader>Lk]
lvim.leader = "space"

-- telescope shortcuts
lvim.keys.normal_mode["<C-p>"] = "<cmd>Telescope find_files<cr>"
lvim.keys.normal_mode["<C-g>"] = "<cmd>Telescope live_grep theme=ivy<cr>"
lvim.keys.normal_mode["<C-b>"] = "<cmd>Telescope buffers theme=dropdown previewer=false<cr>"
lvim.keys.normal_mode["z="] = "<cmd>Telescope spell_suggest<cr>"

-- cycle through buffers
lvim.keys.normal_mode["<S-l>"] = ":BufferLineCycleNext<CR>"
lvim.keys.normal_mode["<S-h>"] = ":BufferLineCyclePrev<CR>"

-- move lines up and down (mac)
lvim.keys.normal_mode["∆"] = "mz:m+<cr>`z"
lvim.keys.normal_mode["˚"] = "mz:m-2<cr>`z"

-- quick macro invocation without updating default register
lvim.keys.normal_mode["Q"] = "@q"

-- toggle vim.opt.colorcolumn = "80"
lvim.keys.normal_mode["<S-t>"] = "<cmd>execute 'set colorcolumn=' . (&colorcolumn == '' ? '80' : '')<cr>"

-- resize panes with option key + h/l
lvim.keys.normal_mode["¬"] = ":vertical resize -2<CR>"
lvim.keys.normal_mode["˙"] = ":vertical resize +2<CR>"
lvim.keys.normal_mode["<C-Left>"] = ":resize -2<CR>"
lvim.keys.normal_mode["<C-Right>"] = ":resize +2<CR>"

-- move a line of text using mac option-key+j/k (mac)
lvim.keys.visual_mode["∆"] = ":m'>+<cr>`<my`>mzgv`yo`z"
lvim.keys.visual_mode["˚"] = ":m'<-2<cr>`>my`<mzgv`yo`z"

-- Smarter yank
lvim.keys.visual_mode["Y"] = "y$"

-- Insert keymaps
local opts = { noremap = true, silent = true }
local keymap = vim.api.nvim_set_keymap

keymap("i", "jj", "<Esc>", opts) -- remap escape
keymap("i", "<C-b>", "<Esc>^i", opts) -- beginning of line
keymap("i", "<C-e>", "<End>", opts) -- end of line

-- navigate within insert mode
keymap("i", "<C-h>", "<Left>", opts) -- end of line
keymap("i", "<C-l>", "<Right>", opts) -- end of line
keymap("i", "<C-j>", "<Down>", opts) -- end of line
keymap("i", "<C-k>", "<Up>", opts) -- end of line

-- Options
vim.opt.cmdheight = 1 -- more space in the neovim command line for displaying messages
vim.opt.hlsearch = true -- highlight all matches on previous search pattern
vim.opt.relativenumber = true -- set relative numbered lines
vim.opt.scrolloff = 8 -- attempts to center cursor
vim.opt.showtabline = 0 -- never display page tab labels
vim.opt.termguicolors = true -- set term gui colors (most terminals support this)
vim.opt.timeoutlen = 200 -- determine the behavior when part of a key code sequence has been received by the
vim.opt.updatetime = 50 -- shorten delay; (default is 4000 ms = 4 s) leads to noticeable

-- Which-key bindings
lvim.builtin.which_key.mappings["k"] = { "<cmd>hide<cr>", "Kill Pane" }
lvim.builtin.which_key.mappings["S"] = { "<cmd>setlocal spell!<cr>", "Spell Check" }
lvim.builtin.which_key.mappings["w"] = { "<cmd>w!<CR>", "Save" }

-- After changing plugin config exit and reopen LunarVim, Run :PackerInstall :PackerCompile
lvim.builtin.alpha.active = true
lvim.builtin.alpha.mode = "dashboard"
lvim.builtin.notify.active = true
lvim.builtin.terminal.active = true
lvim.builtin.nvimtree.setup.view.side = "left"
lvim.builtin.nvimtree.setup.renderer.icons.show.git = false

-- if you don't want all the parsers change this to a table of the ones you want
-- Treesitter
lvim.builtin.treesitter.ensure_installed = {
  "bash",
  "css",
  "go",
  "javascript",
  "json",
  "lua",
  "python",
  "rust",
  "tsx",
  "typescript",
  "yaml",
}

lvim.builtin.treesitter.ignore_install = {
  "haskell",
  "java",
}

lvim.builtin.treesitter.highlight.enabled = true


-- lualine
local components = require "lvim.core.lualine.components"

lvim.builtin.lualine.sections = {
  lualine_a = {
    components.mode,
  },
  lualine_b = {
    components.branch,
    { "filename", path = 1 },
  },
  lualine_c = {
    components.diff,
  },
}

-- Additional Plugins
lvim.plugins = {
  { "christoomey/vim-tmux-navigator" }, -- seamless navigation between tmux panes and vim splits
  { "tpope/vim-surround" }, -- quoting/parenthesizing made simple (!lua)
  { "tpope/vim-abolish" }, -- case coercion (!lua)
  { "romgrk/nvim-treesitter-context" }, -- show code context
  { 'kevinhwang91/nvim-bqf', ft = 'qf' }, -- better quickfix window in Neovim, polish old quickfix window

  { -- atom's one dark and light theme
    "navarasu/onedark.nvim", config = function()
      local ok, onedark = pcall(require, "onedark")
      if ok then
        onedark.setup {
          style = 'darker'
        }
        onedark.load()
      end
    end
  },

  { -- highlight arguments' definitions and usages, using treesitter
    "m-demare/hlargs.nvim",
    config = function()
      local ok, hlargs = pcall(require, "hlargs")
      if ok then
        hlargs.setup({
          color = "#dd636e",
          highlight = {},
          excluded_filetypes = {},
          paint_arg_declarations = true,
          paint_arg_usages = true,
          paint_catch_blocks = {
            declarations = false,
            usages = false,
          },
          extras = {
            named_parameters = false,
          },
          hl_priority = 10000,
        })
      end
    end,
  },

  { -- highlight, list and search todo comments in your projects
    "folke/todo-comments.nvim",
    requires = "nvim-lua/plenary.nvim",
    config = function()
      local ok, todo = pcall(require, "todo-comments")
      if ok then
        todo.setup()
      end
    end,
  },

  { -- highlight, list and search todo comments in your projects
    "simrat39/rust-tools.nvim",
    config = function()
      local ok, rt = pcall(require, "rust-tools")
      if ok then
        rt.setup({
          server = {
            standalone = true,
            on_attach = function(_, bufnr)
              vim.keymap.set("n", "<Leader>a", rt.code_action_group.code_action_group, { buffer = bufnr })
            end,
            ["rust-analyzer"] = {
              checkOnSave = {
                command = "clippy",
              },
            },
          },
        })
      end
    end,
  },
}

-- Autocommands (https://neovim.io/doc/user/autocmd.html)
local augroup = vim.api.nvim_create_augroup
local autocmd = vim.api.nvim_create_autocmd

autocmd('TextYankPost', {
  group = augroup('HighlightYank', {}),
  pattern = '*',
  callback = function()
    vim.highlight.on_yank({
      higroup = 'IncSearch',
      timeout = 40,
    })
  end,
})

autocmd("BufEnter", {
  pattern = { "*.json", "*.jsonc" },
  -- enable wrap mode for json files only
  command = "setlocal wrap",
})

autocmd("BufWritePre", {
  pattern = { "*.go" },
  -- enable wrap mode for json files only
  command = "silent! lua require('go.format').goimport()",
})
