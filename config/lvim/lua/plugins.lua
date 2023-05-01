lvim.plugins = {
  -- { "mfussenegger/nvim-dap-python" }, -- nvim-dap extension to test and debug python
  { "jose-elias-alvarez/typescript.nvim" },           -- plugin to write TypeScript
  { "kevinhwang91/nvim-bqf",             ft = "qf" }, -- better quickfix window in Neovim, polish old quickfix windo
  { "leoluz/nvim-dap-go" },                           -- extension for nvim-dap providing configurations for launching go debugger (delve) and debugging individual tests
  { "m-demare/hlargs.nvim" },                         -- highlight arguments' definitions and usages, using treesitter
  { "mxsdev/nvim-dap-vscode-js" },                    -- nvim-dap adapter for vscode-js-debug
  { "olexsmir/gopher.nvim" },                         -- plugin for easy golang development
  { "onsails/lspkind-nvim" },                         -- vscode-like pictograms for neovim lsp completion items
  { "romgrk/nvim-treesitter-context" },               -- show code context
  { "simrat39/rust-tools.nvim" },                     -- tools for better development in rust using neovim's builtin lsp

  {
    -- easy Neovim-Tmux navigation
    "alexghergh/nvim-tmux-navigation",
    config = function()
      local ok, nvim_tmux_nav = pcall(require, "nvim-tmux-navigation")
      if ok then
        nvim_tmux_nav.setup({
          disable_when_zoomed = false,
          keybindings = {
            left = "<C-h>",
            down = "<C-j>",
            up = "<C-k>",
            right = "<C-l>",
          },
        })
      end
    end,
  },

  {
    -- add/change/delete surrounding delimiter pairs with ease
    "kylechui/nvim-surround",
    version = "*",
    config = function()
      local ok, surround = pcall(require, "nvim-surround")
      if ok then
        surround.setup()
      end
    end,
  },

  {
    -- neovim undotree with git diff
    "jiaoshijie/undotree",
    config = function()
      local ok, undotree = pcall(require, "undotree")
      if ok then
        undotree.setup()
      end
    end,
  },

  {
    -- atom's one dark theme
    "navarasu/onedark.nvim",
    lazy = false,
    commit = "76b2b1f",
    config = function()
      local ok, onedark = pcall(require, "onedark")
      if ok then
        onedark.setup({
          style = "darker",
        })
        onedark.load()
      end
    end,
  },

  {
    -- tree like view for symbols in Neovim using the Language Server Protocol
    "simrat39/symbols-outline.nvim",
    config = function()
      local ok, symbols_outline = pcall(require, "symbols-outline")
      if ok then
        symbols_outline.setup()
      end
    end,
  },

  {
    -- highlight, list and search todo comments in your projects
    "folke/todo-comments.nvim",
    config = function()
      local ok, todo = pcall(require, "todo-comments")
      if ok then
        todo.setup()
      end
    end,
  },

  {
    -- helps managing crates.io dependencies
    "saecki/crates.nvim",
    event = { "BufRead Cargo.toml" },
    dependencies = {
      "nvim-lua/plenary.nvim",
    },
    config = function()
      local ok, crates = pcall(require, "crates")
      if ok then
        crates.setup()
      end
    end,
  },

  {
    -- find and replace in visual mode
    "windwp/nvim-spectre",
    event = "BufRead",
    config = function()
      local ok, spectre = pcall(require, "spectre")
      if ok then
        spectre.setup()
      end
    end,
  },

  {
    -- markdown preview
    "iamcco/markdown-preview.nvim",
    build = function()
      vim.fn["mkdp#util#install"]()
    end,
  },

  {
    -- highly performant ui for lsp things
    "glepnir/lspsaga.nvim",
    event = "BufRead",
    config = function()
      local ok, saga = pcall(require, "lspsaga")
      if ok then
        saga.setup({
          code_action_lightbulb = {
            enable = false,
            enable_in_insert = false,
          },
        })
      end
    end,
  },

  {
    -- ultrafast copilot alternative for vim and neovim
    "Exafunction/codeium.vim",
    -- stylua: ignore
    config = function()
      vim.g.codeium_disable_bindings = 1

      vim.keymap.set('i', '<C-g>', function() return vim.fn['codeium#Accept']() end, { expr = true })
      vim.keymap.set('i', '<C-j>', function() return vim.fn['codeium#CycleCompletions'](2) end, { expr = true })
      vim.keymap.set('i', '<C-k>', function() return vim.fn['codeium#CycleCompletions'](-1) end, { expr = true })
      vim.keymap.set('i', '<C-x>', function() return vim.fn['codeium#Clear']() end, { expr = true })
    end,
  },
}
