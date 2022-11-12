local telescope = lvim.builtin.telescope

telescope.defaults.file_ignore_patterns = { ".git" }

telescope.on_config_done = function()
	-- Change Telescope navigation to use j and k for navigation and n and p for history in both input and normal mode.
	local ok, actions = pcall(require, "telescope.actions")
	if ok then
		local mappings = telescope.defaults.mappings

		-- for input mode
		mappings.i["<C-j>"] = actions.move_selection_next
		mappings.i["<C-k>"] = actions.move_selection_previous
		mappings.i["<C-n>"] = actions.cycle_history_next
		mappings.i["<C-p>"] = actions.cycle_history_prev

		-- for normal mode
		mappings.n["<C-j>"] = actions.move_selection_next
		mappings.n["<C-k>"] = actions.move_selection_previous
	end
end

-- enable file preview for file_finder and git_files
-- lvim.builtin.telescope.pickers.find_files.previewer = nil

local normal_mode = lvim.keys.normal_mode

normal_mode["<C-p>"] = "<cmd>Telescope find_files<cr>"
normal_mode["<C-b>"] = "<cmd>Telescope buffers<cr>"
normal_mode["z="] = "<cmd>Telescope spell_suggest<cr>"

-- telescope-bookmarks.nvim
local ok, telescope = pcall(require, "telescope")
if ok then
	telescope.setup({
		extensions = {
			fzf = {
				fuzzy = true, -- false will only do exact matching
				override_generic_sorter = true, -- override the generic sorter
				override_file_sorter = true, -- override the file sorter
				case_mode = "smart_case", -- "ignore_case" or "respect_case"
			},
			bookmarks = {
				debug = false,
				firefox_profile_name = "dev-edition-default",
				selected_browser = "firefox",
				url_open_command = "open",
			},
		},
	})

	telescope.load_extension("bookmarks")
end
