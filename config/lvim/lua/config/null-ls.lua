local formatters = require("lvim.lsp.null-ls.formatters")

formatters.setup({
  {
    command = "prettier",
    filetypes = { "typescript", "typescriptreact", "json", "markdown" },
  },
  { command = "goimports", filetypes = { "go" } },
  { command = "stylua", filetypes = { "lua" } },
})
