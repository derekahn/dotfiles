return {
  -- Import LazyVim's debugger setup
  { import = "lazyvim.plugins.extras.dap.core" },

  -- Add language-specific debuggers
  { import = "lazyvim.plugins.extras.dap.nlua" },

  -- For Python specifically
  {
    "mfussenegger/nvim-dap-python",
    dependencies = {
      "mfussenegger/nvim-dap",
    },
    ft = "python",
    config = function()
      require("dap-python").setup(vim.fn.exepath("python3"))
    end,
  },

  -- For Go specifically
  {
    "leoluz/nvim-dap-go",
    dependencies = {
      "mfussenegger/nvim-dap",
    },
    ft = "go",
    config = function()
      require("dap-go").setup()
    end,
  },
}
