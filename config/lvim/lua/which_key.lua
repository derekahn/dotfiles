local which_key = lvim.builtin.which_key

which_key.mappings["a"] = { "<cmd>ccl<cr>", "Close Quickfix" }
which_key.mappings[";"] = { "<cmd>copen<cr>", "Open Quickfix" }
which_key.mappings["f"] = { "<cmd>Telescope live_grep theme=ivy<cr>", "Find text" }
which_key.mappings["k"] = { "<cmd>hide<cr>", "Kill Pane" }
which_key.mappings["S"] = { "<cmd>setlocal spell!<cr>", "Spell Check" }
which_key.mappings["w"] = { "<cmd>w!<cr>", "Save" }
which_key.mappings["sB"] = { "<cmd>Telescope bookmarks<cr>", "Browser bookmarks" }
which_key.mappings["ss"] = { "<cmd>SymbolsOutline<cr>", "Symbols" }
which_key.mappings["u"] = { "<cmd>lua require('undotree').toggle()<cr>", "Undo" }

-- disable so we can use telescope
which_key.setup.plugins.spelling.enabled = false

-- rust mappings
which_key.mappings["r"] = {
	name = "Rust",
	i = { "<cmd>lua require('rust-tools').inlay_hints.set()<cr>", "Inlay Hints" },
	r = { "<cmd>RustRun<cr>", "Run Buffer" },
	a = { "<cmd>RustEmitAsm<cr>", "Show Assembly" },
	R = { "<cmd>lua require('rust-tools').runnables.runnables()<cr>", "Runnables" },
	e = { "<cmd>lua require('rust-tools').expand_macro.expand_macro()<cr>", "Expand Macros" },
	o = { "<cmd>lua require('rust-tools').open_cargo_toml.open_cargo_toml()<cr>", "Open cargo.toml" },
	p = { "<cmd>lua require('rust-tools').parent_module.parent_module()<cr>", "Open Parent Module" },
	S = { "<cmd>RustStartStandaloneServerForBuffer<cr>", "Standalone Server" },
}

-- https://github.com/nvim-telescope/telescope.nvim/issues/1923#issuecomment-1122642431
local function getVisualSelection()
	vim.cmd('noau normal! "vy"')
	local text = vim.fn.getreg("v")
	vim.fn.setreg("v", {})

	text = string.gsub(text, "\n", "")
	if #text > 0 then
		return text
	else
		return ""
	end
end

function GrepSelectionInBuffer()
	local input = getVisualSelection()
	require("telescope.builtin").current_buffer_fuzzy_find({ default_text = input })
end

function GrepSelection()
	local input = getVisualSelection()
	require("telescope.builtin").live_grep({ default_text = input })
end

function SpectreSelection()
	local input = getVisualSelection()
	require("spectre").open({ search_text = input })
end

which_key.vmappings["s"] = {
	name = "Find and Replace",
	s = {
		"<cmd>lua GrepSelectionInBuffer()<cr>",
		"Search Selection in Buffer",
	},
	S = {
		"<cmd>lua GrepSelection()<cr>",
		"Search Selection",
	},
	p = {
		"<cmd>lua require('spectre').open_file_search()<cr>",
		"Search & Replace in current buffer",
	},
	r = {
		"<cmd>lua SpectreSelection()<cr>",
		"Search & Replace",
	},
}
