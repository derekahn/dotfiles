vim.list_extend(lvim.lsp.automatic_configuration.skipped_servers, { "tsserver" })

local capabilities = require("lvim.lsp").common_capabilities()

local ok, typescript = pcall(require, "typescript")
if ok then
	typescript.setup({
		-- disable_commands = false, -- prevent the plugin from creating Vim commands
		debug = false, -- enable debug logging for commands
		go_to_source_definition = {
			fallback = true, -- fall back to standard LSP definition on failure
		},
		server = { -- pass options to lspconfig's setup method
			on_attach = require("lvim.lsp").common_on_attach,
			on_init = require("lvim.lsp").common_on_init,
			capabilities = capabilities,
			settings = {
				typescript = {
					inlayHints = {
						includeInlayEnumMemberValueHints = true,
						includeInlayFunctionLikeReturnTypeHints = true,
						includeInlayFunctionParameterTypeHints = false,
						includeInlayParameterNameHints = "all", -- 'none' | 'literals' | 'all';
						includeInlayParameterNameHintsWhenArgumentMatchesName = true,
						includeInlayPropertyDeclarationTypeHints = true,
						includeInlayVariableTypeHints = true,
					},
				},
			},
		},
	})
end

local mason_path = vim.fn.glob(vim.fn.stdpath("data") .. "/mason/")
local dap_ok, dapjs = pcall(require, "dap-vscode-js")
if dap_ok then
	dapjs.setup({
		-- node_path = "node", -- Path of node executable. Defaults to $NODE_PATH, and then "node"
		debugger_path = mason_path .. "packages/js-debug-adapter", -- Path to vscode-js-debug installation.
		-- debugger_cmd = { "js-debug-adapter" }, -- Command to use to launch the debug server. Takes precedence over `node_path` and `debugger_path`.
		adapters = { "pwa-node", "pwa-chrome", "pwa-msedge", "node-terminal", "pwa-extensionHost" }, -- which adapters to register in nvim-dap
	})
end

for _, language in ipairs({ "typescript", "javascript" }) do
	require("dap").configurations[language] = {
		{
			type = "pwa-node",
			request = "launch",
			name = "Debug Jest Tests",
			-- trace = true, -- include debugger info
			runtimeExecutable = "node",
			runtimeArgs = {
				"./node_modules/jest/bin/jest.js",
				"--runInBand",
			},
			rootPath = "${workspaceFolder}",
			cwd = "${workspaceFolder}",
			console = "integratedTerminal",
			internalConsoleOptions = "neverOpen",
		},
	}
end
