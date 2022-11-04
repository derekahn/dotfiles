local components = require("lvim.core.lualine.components")

lvim.builtin.lualine.sections = {
	lualine_a = {
		components.mode,
	},
	lualine_b = {
		components.branch,
		{ "filename", path = 1 },
	},
	lualine_c = {
		components.diff,
	},
}
