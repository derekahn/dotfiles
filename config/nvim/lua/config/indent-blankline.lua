local status_ok, indent_blankline = pcall(require, "indent_blankline")
if not status_ok then
	return
end

-- HACK: work-around for https://github.com/lukas-reineke/indent-blankline.nvim/issues/59
-- vim.wo.colorcolumn = '99999'

indent_blankline.setup({
	use_treesitter = true,
	show_first_indent_level = true,
	show_current_context = true,
	show_current_context_start = true,
	buftype_exclude = {
		"nofile",
		"terminal",
	},
	context_patterns = {
		"class",
		"return",
		"function",
		"method",
		"^if",
		"^while",
		"jsx_element",
		"^for",
		"^object",
		"^table",
		"block",
		"arguments",
		"if_statement",
		"else_clause",
		"jsx_element",
		"jsx_self_closing_element",
		"try_statement",
		"catch_clause",
		"import_statement",
		"operation_type",
	},
	filetype_exclude = {
		"alpha",
		"help",
		"NvimTree",
		"packer",
		"Telescope",
		"Trouble",
	},
})
