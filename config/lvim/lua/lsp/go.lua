vim.list_extend(lvim.lsp.automatic_configuration.skipped_servers, { "gopls" })

local ok, lsp_manager = pcall(require, "lvim.lsp.manager")
if ok then
	lsp_manager.setup("golangci_lint_ls", {
		on_init = require("lvim.lsp").common_on_init,
		capabilities = require("lvim.lsp").common_capabilities(),
	})
end

lsp_manager.setup("gopls", {
	on_attach = function(client, bufnr)
		require("lvim.lsp").common_on_attach(client, bufnr)
		local _, _ = pcall(vim.lsp.codelens.refresh)
	end,
	on_init = require("lvim.lsp").common_on_init,
	capabilities = require("lvim.lsp").common_capabilities(),
	settings = {
		gopls = {
			usePlaceholders = true,
			gofumpt = true,
			codelenses = {
				generate = true,
				gc_details = true,
				test = true,
				tidy = true,
			},
		},
	},
})

local ok_gopher, gopher = pcall(require, "gopher")
if ok_gopher then
	gopher.setup({
		commands = {
			go = "go",
			gomodifytags = "gomodifytags",
			gotests = "gotests",
			impl = "impl",
			iferr = "iferr",
		},
	})
end

------------------------
-- Dap
------------------------
local dap_ok, dapgo = pcall(require, "dap-go")
if dap_ok then
	dapgo.setup()
end
