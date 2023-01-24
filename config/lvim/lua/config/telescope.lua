local telescope = lvim.builtin.telescope

telescope.defaults.file_ignore_patterns = {
	".git/",
	"target/",
	"docs/",
	"vendor/*",
	"%.lock",
	"__pycache__/*",
	"%.sqlite3",
	"%.ipynb",
	"node_modules/*",
	-- "%.jpg",
	-- "%.jpeg",
	-- "%.png",
	"%.svg",
	"%.otf",
	"%.ttf",
	"%.webp",
	".dart_tool/",
	".github/",
	".gradle/",
	".idea/",
	".settings/",
	".vscode/",
	"__pycache__/",
	"build/",
	"env/",
	"gradle/",
	"node_modules/",
	"%.pdb",
	"%.dll",
	"%.class",
	"%.exe",
	"%.cache",
	"%.ico",
	"%.pdf",
	"%.dylib",
	"%.jar",
	"%.docx",
	"%.met",
	"smalljre_*/*",
	".vale/",
	"%.burp",
	"%.mp4",
	"%.mkv",
	"%.rar",
	"%.zip",
	"%.7z",
	"%.tar",
	"%.bz2",
	"%.epub",
	"%.flac",
	"%.tar.gz",
}

telescope.on_config_done = function()
	-- Change Telescope navigation to use j and k for navigation and n and p for history in both input and normal mode.
	local ok, actions = pcall(require, "telescope.actions")
	if ok then
		telescope.defaults.mappings = {
			-- for input mode
			i = {
				["<C-j>"] = actions.move_selection_next,
				["<C-k>"] = actions.move_selection_previous,

				["<C-n>"] = actions.cycle_history_next,
				["<C-p>"] = actions.cycle_history_prev,

				["<C-b>"] = actions.results_scrolling_up,
				["<C-f>"] = actions.results_scrolling_down,

				["<Down>"] = actions.move_selection_next,
				["<Up>"] = actions.move_selection_previous,

				["<C-c>"] = actions.close,
				["<C-d>"] = actions.delete_buffer,

				["<CR>"] = actions.select_default,
			},
			-- for normal mode
			n = {
				["<esc>"] = actions.close,
				["q"] = actions.close,
				["<CR>"] = actions.select_default,

				["<C-x>"] = actions.select_horizontal,
				["<C-v>"] = actions.select_vertical,
				["<C-t>"] = actions.select_tab,
				["<C-b>"] = actions.results_scrolling_up,
				["<C-f>"] = actions.results_scrolling_down,

				["j"] = actions.move_selection_next,
				["k"] = actions.move_selection_previous,
				["H"] = actions.move_to_top,
				["M"] = actions.move_to_middle,
				["L"] = actions.move_to_bottom,

				["dd"] = actions.delete_buffer,

				["s"] = actions.select_horizontal,
				["v"] = actions.select_vertical,
				["t"] = actions.select_tab,

				["<C-u>"] = actions.preview_scrolling_up,
				["<C-d>"] = actions.preview_scrolling_down,

				-- ["<C-q>"] = actions.send_to_qflist + actions.open_qflist,
				-- ["<M-q>"] = actions.send_selected_to_qflist + actions.open_qflist,
			},
		}
	end
end

local normal_mode = lvim.keys.normal_mode

normal_mode["<C-p>"] = "<cmd>Telescope find_files<cr>"
normal_mode["<C-b>"] = "<cmd>Telescope buffers<cr>"
normal_mode["z="] = "<cmd>Telescope spell_suggest<cr>"
