return {
  {
    -- An all in one plugin for converting text case
    "johmsalas/text-case.nvim",
    dependencies = { "ibhagwan/fzf-lua" },
    keys = {
      { "ga.", "<cmd>TextCaseOpenWhichKey<CR>", mode = { "n", "v" }, desc = "Text Case" },
    },
    opts = {},
  },
  {
    -- add/change/delete surrounding delimiter pairs with ease
    "kylechui/nvim-surround",
    version = "*",
    event = "VeryLazy",
    opts = {},
  },
}
