local formatters = require("lvim.lsp.null-ls.formatters")
formatters.setup({
	{ command = "shfmt", filetypes = { "sh", "zsh", "bash" } },
})

vim.filetype.add({
	extension = {
		zsh = "zsh",
	},
})

local has, linters = pcall(require, "lvim.lsp.null-ls.linters")
if has then
	linters.setup({
		{ command = "shellcheck", extra_args = { "--severity", "warning" } },
	})
end

vim.list_extend(lvim.lsp.automatic_configuration.skipped_servers, { "bashls" })

local lsp_manager = require("lvim.lsp.manager")
lsp_manager.setup("bashls", {
	filetypes = { "sh", "zsh" },
	on_init = require("lvim.lsp").common_on_init,
	capabilities = require("lvim.lsp").common_capabilities(),
})

lsp_manager.setup("lua_ls", {
	filetypes = { "lua" },
	on_init = require("lvim.lsp").common_on_init,
	capabilities = require("lvim.lsp").common_capabilities(),
})
