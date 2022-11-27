local which_key = lvim.builtin.which_key

which_key.mappings["a"] = { "<cmd>ccl<cr>", "Close Quickfix" }
which_key.mappings[";"] = { "<cmd>copen<cr>", "Open Quickfix" }
which_key.mappings["f"] = { "<cmd>Telescope live_grep theme=ivy<cr>", "Find text" }
which_key.mappings["k"] = { "<cmd>hide<cr>", "Kill Pane" }
which_key.mappings["w"] = { "<cmd>w!<cr>", "Save" }
which_key.mappings["su"] = { "<cmd>lua require('undotree').toggle()<cr>", "Undo" }
which_key.mappings["sB"] = { "<cmd>Telescope bookmarks<cr>", "Browser bookmarks" }
which_key.mappings["lo"] = { "<cmd>SymbolsOutline<cr>", "Symbols" }
which_key.mappings["lp"] = { "<cmd>setlocal spell!<cr>", "Spell Check" }

-- disable so we can use telescope
which_key.setup.plugins.spelling.enabled = false

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
