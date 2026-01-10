-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua

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

-- Rust files use 4-space indentation
autocmd("BufEnter", {
	pattern = { "*.rs" },
	callback = function()
		vim.opt_local.shiftwidth = 4
		vim.opt_local.tabstop = 4
	end,
})

autocmd("BufRead", {
  desc = "Disable diagnostics in node_modules",
  pattern = "*/node_modules/*",
  command = "lua vim.diagnostic.disable(0)",
})

autocmd("BufRead", {
  desc = "Disable diagnostic for .env files",
  pattern = "*.env",
  command = "lua vim.diagnostic.disable(0)",
})

autocmd("BufWritePost", {
  desc = "Auto reload tmux config",
  pattern = { "*tmux.conf", "*tmux.conf.symlink" },
  callback = function()
    if vim.fn.executable("tmux") == 1 then
      vim.fn.system("tmux source ~/.tmux.conf 2>/dev/null")
    end
  end,
})

autocmd("BufWritePost", {
  desc = "Auto reload aerospace config",
  pattern = { "aerospace.toml" },
  command = "!aerospace reload-config",
})
