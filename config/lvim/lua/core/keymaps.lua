-- keymappings [view all the defaults by pressing <leader>Lk]
lvim.leader = "space"

local normal_mode = lvim.keys.normal_mode

-- maintain cursor center screen
normal_mode["<C-d>"] = "<C-d>zz"
normal_mode["<C-u>"] = "<C-u>zz"
normal_mode["n"] = "nzzzv"
normal_mode["N"] = "Nzzzv"
normal_mode["J"] = "mzJ`z"

-- cycle through buffers
normal_mode["<S-l>"] = "<cmd>BufferLineCycleNext<cr>"
normal_mode["<S-h>"] = "<cmd>BufferLineCyclePrev<cr>"

-- move lines up and down (mac)
normal_mode["∆"] = "mz:m+<cr>`z"
normal_mode["˚"] = "mz:m-2<cr>`z"

-- quick macro invocation without updating default register
normal_mode["Q"] = "@q"

-- toggle vim.opt.colorcolumn = "80"
normal_mode["<S-t>"] = "<cmd>execute 'set colorcolumn=' . (&colorcolumn == '' ? '80' : '')<cr>"

-- LSP Saga
normal_mode["ga"] = "<cmd>Lspsaga code_action<cr>"
normal_mode["gf"] = "<cmd>Lspsaga lsp_finder<cr>"
normal_mode["gj"] = "<cmd>Lspsaga diagnostic_jump_prev<cr>"
normal_mode["gk"] = "<cmd>Lspsaga diagnostic_jump_next<cr>"
normal_mode["gp"] = "<cmd>Lspsaga peek_definition<cr>"
normal_mode["gR"] = "<cmd>Lspsaga rename<cr>"
normal_mode["gt"] = "<cmd>Lspsaga peek_type_definition<cr>"

local visual_mode = lvim.keys.visual_mode

-- move a line of text using mac option-key+j/k (mac)
visual_mode["˚"] = ":m'<-2<cr>`>my`<mzgv`yo`z"
visual_mode["∆"] = ":m'>+<cr>`<my`>mzgv`yo`z"

-- Smarter yank
visual_mode["Y"] = "y$"

-- Don't yank on visual paste
-- visual_mode["p"] = '"_dP'

local opts = { noremap = true, silent = true }
local insert_mode = vim.api.nvim_set_keymap

insert_mode("i", "jj", "<Esc>", opts) -- remap escape
insert_mode("i", "<C-l>", "<Right>", opts) -- right one char
