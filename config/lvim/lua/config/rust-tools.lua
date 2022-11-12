local ok, rt = pcall(require, "rust-tools")
if ok then
	rt.setup({
		tools = {
			autoSetHints = true,
			runnables = {
				use_telescope = true,
			},
		},
		server = {
			on_attach = require("lvim.lsp").common_on_attach,
			on_init = require("lvim.lsp").common_on_init,
			standalone = false,

			["rust-analyzer"] = {
				checkOnSave = {
					command = "clippy",
				},
			},
		},
	})
end
