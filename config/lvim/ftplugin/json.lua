-- Set a formatter.
local formatters = require("lvim.lsp.null-ls.formatters")
formatters.setup({
	{
		command = "prettier",
		filetypes = {
			"json",
		},
	},
})

local json_opts = {
	settings = {
		json = {
			schemas = vim.list_extend({
				{
					description = "pyright config",
					fileMatch = { "pyrightconfig.json" },
					name = "pyrightconfig.json",
					url = "https://raw.githubusercontent.com/microsoft/pyright/main/packages/vscode-pyright/schemas/pyrightconfig.schema.json",
				},
			}, require("schemastore").json.schemas({})),
		},
	},
}

require("lvim.lsp.manager").setup("jsonls", json_opts)
