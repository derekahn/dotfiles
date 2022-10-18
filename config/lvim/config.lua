-- general
lvim.log.level = "warn"
lvim.format_on_save = true
lvim.colorscheme = "onedark"

-- keymappings [view all the defaults by pressing <leader>Lk]
lvim.leader = "space"

-- cycle through buffers
lvim.keys.normal_mode["<S-l>"] = ":BufferLineCycleNext<CR>"
lvim.keys.normal_mode["<S-h>"] = ":BufferLineCyclePrev<CR>"

-- move lines up and down (mac)
lvim.keys.normal_mode["∆"] = "mz:m+<cr>`z"
lvim.keys.normal_mode["˚"] = "mz:m-2<cr>`z"

-- quick macro invocation without updating default register
lvim.keys.normal_mode["Q"] = "@q"

-- resize panes with option key + h/l
lvim.keys.normal_mode["¬"] = ":vertical resize -2<CR>"
lvim.keys.normal_mode["˙"] = ":vertical resize +2<CR>"
lvim.keys.normal_mode["<C-Left>"] = ":resize -2<CR>"
lvim.keys.normal_mode["<C-Right>"] = ":resize +2<CR>"

-- telescope shortcuts (faster than which-key)
lvim.keys.normal_mode["<C-p>"] = "<cmd>lua require('telescope.builtin').git_files()<cr>"
lvim.keys.normal_mode["<C-g>"] = "<cmd>Telescope live_grep theme=ivy<cr>"
lvim.keys.normal_mode["<C-b>"] = "<cmd>lua require('telescope.builtin').buffers(require('telescope.themes').get_dropdown{previewer = false})<cr>"

-- move a line of text using mac option-key+j/k (mac)
lvim.keys.visual_mode["∆"] = ":m'>+<cr>`<my`>mzgv`yo`z"
lvim.keys.visual_mode["˚"] = ":m'<-2<cr>`>my`<mzgv`yo`z"

-- Smarter yank
lvim.keys.visual_mode["Y"] = "y$"

local opts = { noremap = true, silent = true }
local keymap = vim.api.nvim_set_keymap
keymap("i", "jj", "<Esc>", opts) -- remap escape
keymap("i", "<C-b>", "<Esc>^i", opts) -- beginning of line
keymap("i", "<C-e>", "<End>", opts) -- end of line
-- Options
vim.opt.cmdheight = 1 -- more space in the neovim command line for displaying messages
vim.opt.relativenumber = true -- set relative numbered lines
vim.opt.hlsearch = true -- highlight all matches on previous search pattern
vim.opt.termguicolors = true -- set term gui colors (most terminals support this)
vim.opt.list = true

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

-- Additional Plugins
lvim.plugins = {
  { "christoomey/vim-tmux-navigator" }, -- seamless navigation between tmux panes and vim splits
  { "tpope/vim-surround" }, -- quoting/parenthesizing made simple (!lua)
  { "tpope/vim-abolish" }, -- case coercion (!lua)
  { "romgrk/nvim-treesitter-context" }, -- show code context
  { 'kevinhwang91/nvim-bqf', ft = 'qf' }, -- better quickfix window in Neovim, polish old quickfix window

  { -- highlight arguments' definitions and usages, using treesitter
    "m-demare/hlargs.nvim",
    config = function()
      require("hlargs").setup({
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
    end,
  },

  { -- indent guides for neovim
    "lukas-reineke/indent-blankline.nvim",
    setup = function()
      vim.g.indentLine_color_term = "#bc73d2"
    end,
    config = function()
      require("indent_blankline").setup({
        use_treesitter = true,
        show_first_indent_level = true,
        show_current_context = true,
        show_current_context_start = true,
      })
    end,
  },

  { -- atom's one dark and light theme
    "navarasu/onedark.nvim",
    config = "vim.cmd[[colorscheme onedark]]",
  },

  { -- highlight, list and search todo comments in your projects
    "folke/todo-comments.nvim",
    requires = "nvim-lua/plenary.nvim",
    config = function()
      require("todo-comments").setup()
    end,
  },

  { -- highlight, list and search todo comments in your projects
    "simrat39/rust-tools.nvim",
    config = function()
      local rt = require("rust-tools")
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
    end,
  },
}

-- Autocommands (https://neovim.io/doc/user/autocmd.html)
vim.api.nvim_create_autocmd("BufEnter", {
  pattern = { "*.json", "*.jsonc" },
  -- enable wrap mode for json files only
  command = "setlocal wrap",
})

vim.api.nvim_create_autocmd("BufWritePre", {
  pattern = { "*.go" },
  -- enable wrap mode for json files only
  command = "silent! lua require('go.format').goimport()",
})

vim.api.nvim_create_autocmd("BufEnter", {
  pattern = { "*.md" },
  -- enable wrap mode for json files only
  command = "silent! lua require('go.format').goimport()",
})

-- lvim.autocommands = {
--   {
--     "BufWinEnter",
--     {
--       pattern = { "*.rs" },
--       callback = function()
--         vim.cmd([[setlocal tabstop=2 shiftwidth=2]])
--       end,
--     },
--   }
-- }
