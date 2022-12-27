local ok, formatters = pcall(require, "lvim.lsp.null-ls.formatters")

if ok then
	formatters.setup({
		{ command = "black", filetypes = { "python" } },
		{ command = "gofumpt", filetypes = { "go" } },
		{ command = "goimports", filetypes = { "go" } },
		{
			command = "prettier",
			filetypes = {
				"javascript",
				"javascriptreact",
				"json",
				"markdown",
				"typescript",
				"typescriptreact",
			},
		},
		{ command = "rustfmt", filetypes = { "rs", "rust" } },
		{ command = "shfmt", filetypes = { "sh", "zsh", "bash" } },
		{ command = "stylua", filetypes = { "lua" } },
	})
end

-- local has, linters = pcall(require, "lvim.lsp.null-ls.linters")
-- if has then
-- 	linters.setup({
-- 		{ command = "flake8", filetypes = { "python" } },
-- 		{ command = "eslint", filetypes = { "javascript", "typescript" } },
-- 	})
-- end
