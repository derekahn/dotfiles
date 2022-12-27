local ok, lspkind = pcall(require, "lspkind")
if ok then
	lvim.builtin.cmp.formatting = {
		fields = { "abbr", "kind", "menu" },
		-- max_width = 0,
		max_width = 40,
		source_names = {
			nvim_lsp = "(LSP)",
			emoji = "(Emoji)",
			path = "(Path)",
			calc = "(Calc)",
			vsnip = "(Snippet)",
			luasnip = "(Snippet)",
			buffer = "(Buffer)",
			tmux = "(TMUX)",
			treesitter = "(TreeSitter)",
		},

		duplicates = {
			buffer = 1,
			path = 1,
			nvim_lsp = 0,
			luasnip = 1,
		},
		duplicates_default = 0,

		format = lspkind.cmp_format({
			mode = "symbol_text",
			before = function(entry, vim_item)
				local max_width = lvim.builtin.cmp.formatting.max_width
				if max_width ~= 0 and #vim_item.abbr > max_width then
					vim_item.abbr = string.sub(vim_item.abbr, 1, max_width - 1) .. lvim.icons.ui.Ellipsis
				end

				vim_item.menu = lvim.builtin.cmp.formatting.source_names[entry.source.name]
				vim_item.dup = lvim.builtin.cmp.formatting.duplicates[entry.source.name]
					or lvim.builtin.cmp.formatting.duplicates_default
				return vim_item
			end,
		}),
	}
end
