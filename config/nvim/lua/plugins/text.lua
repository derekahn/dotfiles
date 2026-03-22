return {
  {
    -- An all in one plugin for converting text case
    "johmsalas/text-case.nvim",
    dependencies = { "nvim-telescope/telescope.nvim" },
    cmd = "TextCaseOpenTelescope",
    keys = {
      { "ga.", "<cmd>TextCaseOpenTelescope<CR>", mode = { "n", "v" }, desc = "Text Case" },
    },
    config = function()
      require("textcase").setup()
      require("telescope").load_extension("textcase")
    end,
  },
  {
    -- add/change/delete surrounding delimiter pairs with ease
    "kylechui/nvim-surround",
    version = "*",
    event = "VeryLazy",
    opts = {},
  },
  {
    "numToStr/Comment.nvim",
    opts = {},
    keys = {
      { "gcc", false },
      {
        "<leader>/",
        function()
          require("Comment.api").toggle.linewise.current()
        end,
        desc = "Toggle comment",
      },
    },
  },
}
