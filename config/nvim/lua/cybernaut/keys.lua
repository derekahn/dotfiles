local v = require('cybernaut/utils')

local opts = { noremap = true, silent = true }
local term_opts = { silent = true }

-- Shorten function name
local keymap = vim.api.nvim_set_keymap

-- Remap space as leader key
keymap('', '<Space>', '<Nop>', opts)
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

-- Disable pattern highlight with return
v.nnoremap({'<silent>', '<CR>'}, v.cmd.nohlsearch)

-- Spelling
-- Toggle and un-toggle spell checking
-- next ]s
-- prev [s
-- add to dictionary zg
-- find correct word z=
v.map({'<silent>', '<leader>', 'sc'}, v.cmd['setlocal spell!'])

-- Normal --
-- Better window navigation
keymap('n', '<C-h>', '<C-w>h', opts)
keymap('n', '<C-j>', '<C-w>j', opts)
keymap('n', '<C-k>', '<C-w>k', opts)
keymap('n', '<C-l>', '<C-w>l', opts)

-- Split creation
keymap('n', '<C-s>', ':vsplit <CR>', opts)
keymap('n', '<C-x>', ':split <CR>', opts)

-- Resize with arrows
keymap('n', '<C-Left>', ':resize -2<CR>', opts)
keymap('n', '<C-Right>', ':resize +2<CR>', opts)
keymap('n', '¬', ':vertical resize -2<CR>', opts)
keymap('n', '˙', ':vertical resize +2<CR>', opts)

-- Navigate buffers
keymap('n', '<S-l>', ':bnext<CR>', opts)
keymap('n', '<S-h>', ':bprevious<CR>', opts)
keymap('n', '<S-h>', ':bprevious<CR>', opts)
v.nnoremap({'<leader>', 'bc'}, v.cmd['%bd'])
v.nnoremap({'<leader>', '<leader>'}, '<C-^>')

-- Move a line of text using ALT+j/k
v.nmap({'∆'}, 'mz:m+<cr>`z')
v.nmap({'˚'}, 'mz:m-2<cr>`z')
v.vmap({'∆'}, ':m\'>+<cr>`<my`>mzgv`yo`z')
v.vmap({'˚'}, ':m\'<-2<cr>`>my`<mzgv`yo`z')

-- Insert --
keymap("i", "jk", "<ESC>", opts)

-- Better popup navigation
v.inoremap({'<expr>', '<Tab>'}, 'pumvisible() ? "<C-n>" : "<Tab>"')
v.inoremap({'<expr>', '<S-Tab>'}, 'pumvisible() ? "<C-p>" : "<S-Tab>"')

-- Visual --
-- Stay in indent mode
keymap('v', '<', '<gv', opts)
keymap('v', '>', '>gv', opts)

-- Plugins --
-- Zoom in/out of windows with 'troydm/zoomwintab.vim'
v.nnoremap({'<silent>', '<leader>', 'z'}, v.cmd[':ZoomWinTabToggle<cr>'])

-- Telescope 🔭
v.nmap({'<silent>', '<leader>', 'b'}, ':Telescope buffers<CR>')
v.nmap({'<silent>', '<leader>', 'c'}, ':Telescope commands<CR>')
v.nmap({'<silent>', '<leader>', 'd'}, ':Telescope help_tags<CR>')
v.nmap({'<silent>', '<leader>', 'f'}, ':Telescope live_grep<CR>')
v.nmap({'<silent>', '<leader>', 'h'}, ':Telescope oldfiles<CR>')
v.nmap({'<silent>', '<leader>', 'l'}, ':Telescope current_buffer_fuzzy_find<CR>')
v.nmap({'<silent>', '<C-p>'}, ':Telescope find_files<CR>')
