local indentlines = lvim.builtin.indentlines

indentlines.active = true

indentlines.options = {
	enabled = true,
	show_current_context = true,
	-- show_current_context_start = true,
	show_first_indent_level = true,
	space_char_blankline = " ",
	use_treesitter = true,
	use_treesitter_scope = true,
}
