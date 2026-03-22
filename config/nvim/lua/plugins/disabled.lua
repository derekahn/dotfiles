return {
  -- Override LazyVim's mini plugins to use new org name
  { "nvim-mini/mini.icons" },
  { "nvim-mini/mini.ai" },
  { "nvim-mini/mini.pairs" },
  { "nvim-mini/mini.surround", enabled = false },
  {
    "gbprod/yanky.nvim",
    keys = {
      { "gp", false, mode = { "n", "x" } },
      -- Disable mapping for visual mode. Prefer pasting in visual mode to go to black hole register
      { "p", false, mode = { "x" } },
    },
  },
}
