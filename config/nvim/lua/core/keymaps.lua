local opts = { noremap = true, silent = true }

-- Shorten function name
local keymap = vim.api.nvim_set_keymap

-- Remap space as leader key
keymap("", "<Space>", "<Nop>", opts)
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Normal --
-- Telescope 🔭
keymap("n", "<C-p>", ":Telescope find_files<CR>", opts)

-- NvimTree 🌲
keymap("n", "<C-e>", ":NvimTreeToggle<CR>", opts)

-- Keep it centered
keymap("n", "n", "nzzzv", opts)
keymap("n", "N", "Nzzzv", opts)
keymap("n", "J", "mzJ`z", opts)

-- Disable pattern highlight with return
keymap("n", "<CR>", ":nohlsearch<CR>", opts)

-- Quick macro invocation without updating default register
keymap("n", "Q", "@q", opts)

-- Better window navigation
keymap("n", "<C-h>", "<C-w>h", opts)
keymap("n", "<C-j>", "<C-w>j", opts)
keymap("n", "<C-k>", "<C-w>k", opts)
keymap("n", "<C-l>", "<C-w>l", opts)

-- Resize panes with option key + h/l
keymap("n", "¬", ":vertical resize -2<CR>", opts)
keymap("n", "˙", ":vertical resize +2<CR>", opts)
keymap("n", "<C-Left>", ":resize -2<CR>", opts)
keymap("n", "<C-Right>", ":resize +2<CR>", opts)

-- Move a line of text using mac option-key+j/k
keymap("n", "∆", "mz:m+<cr>`z", opts)
keymap("n", "˚", "mz:m-2<cr>`z", opts)

-- Navigate buffers
keymap("n", "H", ":bprevious<CR>", opts)
keymap("n", "L", ":bnext<CR>", opts)

-- Insert --
keymap("i", "jj", "<Esc>", opts)

-- Visual --

-- Stay in indent mode
keymap("v", "<", "<gv", opts)
keymap("v", ">", ">gv", opts)

-- Move a line of text using mac option-key+j/k
keymap("v", "∆", ":m'>+<cr>`<my`>mzgv`yo`z", opts)
keymap("v", "˚", ":m'<-2<cr>`>my`<mzgv`yo`z", opts)

-- Smarter yank
keymap("v", "Y", "y$", opts)
