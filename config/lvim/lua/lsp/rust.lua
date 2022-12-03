vim.list_extend(lvim.lsp.automatic_configuration.skipped_servers, { "rust_analyzer" })

local mason_path = vim.fn.glob(vim.fn.stdpath("data") .. "/mason/")
local codelldb_adapter = {
	type = "server",
	port = "${port}",
	executable = {
		command = mason_path .. "bin/codelldb",
		args = { "--port", "${port}" },
	},
}

local ok, rt = pcall(require, "rust-tools")
if ok then
	rt.setup({
		tools = {
			executor = require("rust-tools.executors").quickfix,
			autoSetHints = true,
			hover_actions = {
				border = {
					{ "╭", "FloatBorder" },
					{ "─", "FloatBorder" },
					{ "╮", "FloatBorder" },
					{ "│", "FloatBorder" },
					{ "╯", "FloatBorder" },
					{ "─", "FloatBorder" },
					{ "╰", "FloatBorder" },
					{ "│", "FloatBorder" },
				},
				auto_focus = true,
			},
			runnables = {
				use_telescope = true,
			},
		},
		on_initialized = function()
			vim.api.nvim_create_autocmd({ "BufWritePost", "BufEnter", "CursorHold", "InsertLeave" }, {
				pattern = { "*.rs" },
				callback = function()
					local _, _ = pcall(vim.lsp.codelens.refresh)
				end,
			})
		end,
		server = {
			on_init = require("lvim.lsp").common_on_init,
			on_attach = require("lvim.lsp").common_on_attach,
			capabilities = require("lvim.lsp").common_capabilities(),
			["rust-analyzer"] = {
				checkOnSave = {
					command = "clippy",
				},
			},
		},
		dap = {
			adapter = codelldb_adapter,
		},
	})
end

lvim.builtin.dap.on_config_done = function(dap)
	dap.adapters.codelldb = codelldb_adapter
	dap.configurations.rust = {
		{
			name = "Launch file",
			type = "codelldb",
			request = "launch",
			program = function()
				return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/", "file")
			end,
			cwd = "${workspaceFolder}",
			stopOnEntry = false,
		},
	}
end
