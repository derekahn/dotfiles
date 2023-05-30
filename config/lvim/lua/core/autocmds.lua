-- Autocommands (https://neovim.io/doc/user/autocmd.html)
local augroup = vim.api.nvim_create_augroup
local autocmd = vim.api.nvim_create_autocmd

autocmd("TextYankPost", {
	group = augroup("HighlightYank", {}),
	pattern = "*",
	callback = function()
		vim.highlight.on_yank({
			higroup = "IncSearch",
			timeout = 40,
		})
	end,
})

autocmd("BufEnter", {
	pattern = { "*.json", "*.jsonc" },
	-- enable wrap mode for json files only
	command = "setlocal wrap",
})

autocmd("BufEnter", {
	pattern = { "*.md" },
	command = "setlocal spell",
})

-- Set the tabstop and shiftwidth options for Rust files
autocmd("TextYankPost", {
	group = augroup("HighlightYank", {}),
	pattern = { "*.rs" },
	callback = function() end,
})
