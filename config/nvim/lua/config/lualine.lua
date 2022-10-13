local status_ok, lualine = pcall(require, "lualine")
if not status_ok then
	return
end

local status = require("core.status")

local colors = {
	blue = "#51afef",
	cyan = "#008080",
	darkblue = "#081633",
	green = "#98be65",
	grey = "#2c323c",
	magenta = "#c678dd",
	orange = "#FF8800",
	red = "#ec5f67",
	violet = "#a9a1e1",
	white = "#bbc2cf",
	yellow = "#ecbe7b",
	yellow_1 = "#ff9640",
}

local conditions = {
	buffer_not_empty = function()
		return vim.fn.empty(vim.fn.expand("%:t")) ~= 1
	end,
	hide_in_width = function()
		return vim.fn.winwidth(0) > 80
	end,
	check_git_workspace = function()
		local filepath = vim.fn.expand("%:p:h")
		local gitdir = vim.fn.finddir(".git", filepath .. ";")
		return gitdir and #gitdir > 0 and #gitdir < #filepath
	end,
}

lualine.setup({
	options = {
		disabled_filetypes = { "NvimTree", "neo-tree", "dashboard", "Outline" },
		component_separators = "",
		section_separators = "",
	},
	sections = {
		lualine_a = {},
		lualine_b = {},
		lualine_c = {
			{
				function()
					return "▊"
				end,
				color = { fg = colors.blue },
				padding = { left = 0, right = 0 },
			},
			{
				"branch",
				icon = "",
				color = { fg = colors.violet, gui = "bold" },
				padding = { left = 2, right = 1 },
			},
			{
				"filetype",
				cond = conditions.buffer_not_empty,
				color = { fg = colors.magenta, gui = "bold" },
				padding = { left = 2, right = 1 },
			},
			{
				"diff",
				symbols = { added = " ", modified = "柳", removed = " " },
				diff_color = {
					added = { fg = colors.green },
					modified = { fg = colors.yellow_1 },
					removed = { fg = colors.red },
				},
				cond = conditions.hide_in_width,
				padding = { left = 2, right = 1 },
			},
			{
				"diagnostics",
				sources = { "nvim_diagnostic" },
				symbols = { error = " ", warn = " ", info = " ", hint = " " },
				diagnostics_color = {
					color_error = { fg = colors.red },
					color_warn = { fg = colors.yellow },
					color_info = { fg = colors.cyan },
				},
				padding = { left = 2, right = 1 },
			},
			{
				function()
					return "%="
				end,
			},
		},
		lualine_x = {
			{
				status.lsp_progress,
				color = { gui = "none" },
				padding = { left = 0, right = 1 },
				cond = conditions.hide_in_width,
			},
			{
				status.lsp_name,
				icon = " ",
				color = { gui = "none" },
				padding = { left = 0, right = 1 },
				cond = conditions.hide_in_width,
			},
			{
				status.treesitter_status,
				color = { fg = colors.green },
				padding = { left = 1, right = 0 },
				cond = conditions.hide_in_width,
			},
			{
				"location",
				padding = { left = 1, right = 1 },
			},
			{
				"progress",
				color = { gui = "none" },
				padding = { left = 0, right = 0 },
			},
			{
				status.progress_bar,
				padding = { left = 1, right = 1 },
				color = { fg = colors.yellow },
				cond = nil,
			},
			{
				function()
					return "▊"
				end,
				color = { fg = colors.blue },
				padding = { left = 1, right = 0 },
			},
		},
		lualine_y = {},
		lualine_z = {},
	},
	inactive_sections = {
		lualine_a = {},
		lualine_b = {},
		lualine_y = {},
		lualine_z = {},
		lualine_c = {},
		lualine_x = {},
	},
})
