local status_ok, which_key = pcall(require, "which-key")
if not status_ok then
	return
end

local opts = {
	mode = "n", -- NORMAL mode
	prefix = "<leader>",
	buffer = nil, -- Global mappings. Specify a buffer number for buffer local mappings
	silent = true, -- use `silent` when creating keymaps
	noremap = true, -- use `noremap` when creating keymaps
	nowait = true, -- use `nowait` when creating keymaps
}

local mappings = {
	C = {
		name = "Rust",

		a = { "<cmd>RustEmitAsm<CR>", "Show Assembly" },
		c = {
			"<cmd>lua require('lvim.core.terminal')._exec_toggle({ cmd = 'cargo check;read'})<CR>",
			"Cargo check",
		},
		C = { "<cmd>RustOpenCargo<Cr>", "Open Cargo" },
		d = { "<cmd>RustDebuggables<Cr>", "Debuggables" },
		D = { "<cmd>RustOpenExternalDocs<Cr>", "Open Docs" },
		m = { "<cmd>RustExpandMacro<Cr>", "Expand Macro" },
		p = { "<cmd>RustParentModule<Cr>", "Parent Module" },
		r = { "<cmd>RustRunnables<Cr>", "Runnables" },
		t = { "<cmd>lua _CARGO_TEST()<cr>", "Cargo Test" },
		v = { "<cmd>RustViewCrateGraph<Cr>", "View Crate Graph" },
		R = {
			"<cmd>lua require('rust-tools/workspace_refresh')._reload_workspace_from_cargo_toml()<Cr>",
			"Reload Workspace",
		},
	},
}

which_key.register(mappings, opts)
