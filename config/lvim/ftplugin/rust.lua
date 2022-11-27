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
		b = {
			"<cmd>lua require('lvim.core.terminal')._exec_toggle({ cmd = 'cargo build;read'})<CR>",
			"Cargo build",
		},
		B = { "<cmd>RustRun<CR>", "Run Buffer" },
		c = {
			"<cmd>lua require('lvim.core.terminal')._exec_toggle({ cmd = 'cargo check;read'})<CR>",
			"Cargo check",
		},
		C = { "<cmd>RustOpenCargo<CR>", "Open Cargo" },
		d = { "<cmd>RustDebuggables<CR>", "Debuggables" },
		D = { "<cmd>RustOpenExternalDocs<CR>", "Open Docs" },
		e = { "<cmd>RustOpenExternalDocs<CR>", "Open External Docs" },
		m = { "<cmd>RustExpandMacro<CR>", "Expand Macro" },
		p = { "<cmd>RustParentModule<CR>", "Parent Module" },
		r = {
			"<cmd>lua require('lvim.core.terminal')._exec_toggle({ cmd = 'cargo run;read'})<CR>",
			"Cargo run",
		},
		R = { "<cmd>RustRunnables<CR>", "Runnables" },
		S = {
			"<cmd>RustStartStandaloneServerForBuffer<CR>",
			"Standalone Server",
		},
		t = {
			"<cmd>lua require('lvim.core.terminal')._exec_toggle({ cmd = 'cargo test -- --nocapture;read'})<CR>",
			"Cargo test",
		},
		v = { "<cmd>RustViewCrateGraph<CR>", "View Crate Graph" },
		w = {
			"<cmd>lua require('rust-tools/workspace_refresh')._reload_workspace_from_cargo_toml()<CR>",
			"Reload Workspace",
		},
	},
}

which_key.register(mappings, opts)
