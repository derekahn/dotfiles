return { -- An all in one plugin for converting text case
  "johmsalas/text-case.nvim",
  config = function()
    local ok, textcase = pcall(require, "textcase")
    if ok then
      textcase.setup()
      require("telescope").load_extension("textcase")

      vim.api.nvim_set_keymap("n", "ga.", "<cmd>TextCaseOpenTelescope<CR>", { desc = "Telescope" })
      vim.api.nvim_set_keymap("v", "ga.", "<cmd>TextCaseOpenTelescope<CR>", { desc = "Telescope" })
    end
  end,
  -- add/change/delete surrounding delimiter pairs with ease
  "kylechui/nvim-surround",
  version = "*",
  config = function()
    local ok, surround = pcall(require, "nvim-surround")
    if ok then
      surround.setup()
    end
  end,
}
