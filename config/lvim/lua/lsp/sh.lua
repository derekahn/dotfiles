vim.filetype.add({
	extension = {
		zsh = "zsh",
	},
})

vim.list_extend(lvim.lsp.automatic_configuration.skipped_servers, { "bashls" })

local ok, lsp_manager = pcall(require, "lvim.lsp.manager")
if ok then
	lsp_manager.setup("bashls", {
		filetypes = { "sh", "zsh" },
		on_init = require("lvim.lsp").common_on_init,
		capabilities = require("lvim.lsp").common_capabilities(),
	})
end
