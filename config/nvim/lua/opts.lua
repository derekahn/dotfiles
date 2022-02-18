local v = require('utils')
local set = v.opt
local cmd = vim.cmd

-- Files & Buffers
v.autocmd({'focusgained', 'bufenter'}, '*', v.cmd.checktime)
set.autowrite = true
set.hidden = true
set.modeline = true
set.swapfile = false
set.writebackup = false

-- Clipboard
set.clipboard = 'unnamedplus'

-- Cursor
set.cursorline = true
set.ruler = true
cmd('hi CursorLine cterm=none ctermbg=8 ctermfg=none')
cmd('hi VertSplit cterm=none ctermbg=none ctermfg=23')

-- Windows & Tabs
set.splitbelow = true
set.splitright = true

-- Movement
set.scrolloff = 10

-- Display
set.cmdheight = 2
set.encoding = 'utf-8'
set.laststatus = 0
set.lazyredraw = true
set.number = true
set.numberwidth = 5
set.pumheight = 10
set.relativenumber = true
set.showmatch = true
set.showmode = false
set.signcolumn = 'yes'
set.termguicolors = true
set.title = true
set.wrap = false

-- Show indents
set.list = true
--vim.opt.listchars:append("space:.")
vim.opt.listchars:append("eol:↴")

-- Search
set.ignorecase = true
set.smartcase = true

-- Tab
set.expandtab = true
set.shiftround = true
set.showtabline = 0
set.smarttab = true
set.softtabstop = 2
set.tabstop = 2

-- Indentation
set.autoindent = true
set.copyindent = true
set.shiftwidth = 2
set.smartindent = true

-- Filetype
v.cmd.filetype('on')
v.cmd.filetype('plugin', 'on')
v.cmd.filetype('indent', 'on')

-- Misc
cmd('autocmd! bufenter * if &ft ==# "help" | wincmd L | endif')
set.updatetime = 300
set.history = 100
set.timeoutlen = 300
set.whichwrap = {'b', 's', 'h', 'l'}
set.completeopt = {'menu', 'menuone', 'preview', 'noselect', 'noinsert'}

-- Return to last edit position when opening files (You want this!)
cmd([[
autocmd BufReadPost *
  \ if line("'\"") > 0 && line("'\"") <= line("$") |
  \   exe "normal! g`\"" |
  \ endif
]])
