local telescope = lvim.builtin.telescope

telescope.defaults.file_ignore_patterns = { ".git" }

telescope.on_config_done = function(ts)
	pcall(ts.load_extension, "file_browser")
	pcall(ts.load_extension, "bookmarks")
end

-- enable file preview for file_finder and git_files
-- lvim.builtin.telescope.pickers.find_files.previewer = nil

local normal_mode = lvim.keys.normal_mode

normal_mode["<C-p>"] = "<cmd>Telescope find_files<cr>"
normal_mode["<C-b>"] = "<cmd>Telescope buffers<cr>"
normal_mode["z="] = "<cmd>Telescope spell_suggest<cr>"
