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

autocmd("FileType", {
	pattern = { "json", "jsonc" },
	command = "setlocal wrap",
})

autocmd("FileType", {
	pattern = { "markdown" },
	command = "setlocal spell",
})

autocmd("FileType", {
	pattern = { "rust" },
	callback = function()
		vim.opt_local.shiftwidth = 4
		vim.opt_local.tabstop = 4
	end,
})

autocmd("BufRead", {
  desc = "Disable diagnostics in node_modules",
  pattern = "*/node_modules/*",
  callback = function()
    vim.diagnostic.enable(false, { bufnr = 0 })
  end,
})

autocmd("BufRead", {
  desc = "Disable diagnostic for .env files",
  pattern = "*.env",
  callback = function()
    vim.diagnostic.enable(false, { bufnr = 0 })
  end,
})

autocmd("BufWritePost", {
  desc = "Auto reload tmux config",
  pattern = { "*tmux.conf", "*tmux.conf.symlink" },
  callback = function()
    if vim.fn.executable("tmux") == 1 then
      vim.system({ "tmux", "source-file", vim.fn.expand("~/.tmux.conf") })
    end
  end,
})

autocmd("BufWritePost", {
  desc = "Auto reload aerospace config",
  pattern = { "aerospace.toml" },
  callback = function()
    if vim.fn.executable("aerospace") == 1 then
      vim.system({ "aerospace", "reload-config" })
    end
  end,
})
