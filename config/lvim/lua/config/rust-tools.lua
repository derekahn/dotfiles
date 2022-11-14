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
		server = {
			-- standalone = true,
			on_init = require("lvim.lsp").common_on_init,
			on_attach = require("lvim.lsp").common_on_attach,
			["rust-analyzer"] = {
				checkOnSave = {
					command = "clippy",
				},
			},
		},
		dap = {
			adapter = {
				type = "executable",
				command = "lldb-vscode",
				name = "rt_lldb",
			},
		},
	})
end
