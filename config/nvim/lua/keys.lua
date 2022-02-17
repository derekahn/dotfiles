local v = require('utils')

-- Remap leader key
v.var.mapleader = ' '
v.nnoremap({'<SPACE>'}, '<Nop>')

-- Remap escape
v.inoremap({'jj'}, '<Esc>')

-- Disable pattern hightlight with return
v.nnoremap({'<silent>', '<CR>'}, v.cmd.nohlsearch)

-- Map movement to home row
v.map({'H'}, '^')
v.map({'L'}, '$')

-- Spelling
-- Toggle and un-toggle spell checking
-- next ]s
-- prev [s
-- add to dictionary zg
-- find correct word z=
v.map({'<silent>', '<leader>', 'sc'}, v.cmd['setlocal spell!'])

-- Better split navigation
v.nnoremap('<C-J>', '<C-W><C-J>')
v.nnoremap('<C-K>', '<C-W><C-K>')
v.nnoremap('<C-L>', '<C-W><C-L>')
v.nnoremap('<C-H>', '<C-W><C-H>')

-- Move a line of text using ALT+j/k
v.nmap({'∆'}, 'mz:m+<cr>`z')
v.nmap({'˚'}, 'mz:m-2<cr>`z')
v.vmap({'∆'}, ':m\'>+<cr>`<my`>mzgv`yo`z')
v.vmap({'˚'}, ':m\'<-2<cr>`>my`<mzgv`yo`z')

-- Split creation
v.nnoremap({'<silent>', '<M-l>'}, v.cmd.vsplit)
v.nnoremap({'<silent>', '<M-j>'}, v.cmd.split)

-- Split creates new file
v.nnoremap({'<silent>', '<M-h>'}, v.cmd.vnew)
v.nnoremap({'<silent>', '<M-k>'}, v.cmd.new)

-- Split resize
v.nnoremap('-', '<C-W><')
v.nnoremap('+', '<C-W>>')
v.nnoremap('=', '<C-W>=')

-- Resizing Panes
v.map({'<silent>', '¬'}, v.cmd['vertical resize -2<CR>'])
v.map({'<silent>', '˙'}, v.cmd['vertical resize +2<CR>'])

-- Fast saving and quitting
v.map({'<leader>', 'w'}, v.cmd['w!'])
v.map({'<leader>', 'w', 'q'}, v.cmd['wqa!'])
v.map({'<leader>', 'q'}, v.cmd['q'])
v.map({'<leader>', 'q', 'a'}, v.cmd.qa)

-- Quick file reload
v.map({'<leader>', 'r'}, v.cmd['e<cr>'])

-- Fast file creation
v.map({'<leader>', 'e'}, v.cmd.enew)

-- Paste in visual mode without updating default register
v.nnoremap('p', '_c<Esc>p')

-- Quick macro invocation with q register
v.nnoremap('Q', '@q')

-- Buffer Management
v.nnoremap({'<leader>', 'bc'}, v.cmd['%bd']) -- Close all buffers
v.nnoremap({'<leader>', '<leader>'}, '<C-^>') -- Switch between the last two files

-- Better popup navigation
v.inoremap({'<expr>', '<Tab>'}, 'pumvisible() ? "<C-n>" : "<Tab>"')
v.inoremap({'<expr>', '<S-Tab>'}, 'pumvisible() ? "<C-p>" : "<S-Tab>"')

-- Planetary
v.nmap({'<silent>', '<leader>', 'b'}, ':Telescope buffers<CR>')
v.nmap({'<silent>', '<leader>', 'c'}, ':Telescope commands<CR>')
v.nmap({'<silent>', '<leader>', 'd'}, ':Telescope help_tags<CR>')
v.nmap({'<silent>', '<leader>', 'f'}, ':Telescope live_grep<CR>')
v.nmap({'<silent>', '<leader>', 'h'}, ':Telescope oldfiles<CR>')
v.nmap({'<silent>', '<leader>', 'l'}, ':Telescope current_buffer_fuzzy_find<CR>')
v.nmap({'<silent>', '<leader>', 'p'}, ':Telescope find_files<CR>')

-- validate k8s yaml
v.var.asyncrun_open = 8
vim.cmd([[
augroup kubernetes
  au!
  au FileType yaml nmap <leader>k8 :!kubeval '%'<cr>
augroup END
]])


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
