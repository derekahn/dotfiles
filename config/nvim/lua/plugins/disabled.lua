return {
  { "akinsho/bufferline.nvim", enabled = false },
  {
    "nvim-neo-tree/neo-tree.nvim",
    enabled = false,
  },
  {
    "gbprod/yanky.nvim",
    keys = {
      { "gp", false, mode = { "n", "x" } },
      -- Disable mapping for visual mode. Prefer pasting in visual mode to go to black hole register
      { "p", false, mode = { "x" } },
    },
  },
}
