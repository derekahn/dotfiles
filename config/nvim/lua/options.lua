local v = require('utils')

-- Files & Buffers
v.autocmd({'focusgained', 'bufenter'}, '*', v.cmd.checktime)
v.opt.autowrite = true
v.opt.hidden = true
v.opt.modeline = true
v.opt.swapfile = false
v.opt.writebackup = false

-- Clipboard
v.opt.clipboard = 'unnamedplus'

-- Cursor
v.opt.cursorline = true
v.opt.ruler = true
vim.cmd('hi CursorLine cterm=none ctermbg=8 ctermfg=none')
vim.cmd('hi VertSplit cterm=none ctermbg=none ctermfg=23')

-- Windows & Tabs
v.opt.splitbelow = true
v.opt.splitright = true

-- Movement
v.opt.scrolloff = 10

-- Display
v.opt.cmdheight = 2
v.opt.encoding = 'utf-8'
v.opt.laststatus = 0
v.opt.lazyredraw = true
v.opt.number = true
v.opt.numberwidth = 5
v.opt.pumheight = 10
v.opt.relativenumber = true
v.opt.showmatch = true
v.opt.showmode = false
v.opt.signcolumn = 'yes'
v.opt.termguicolors = true
v.opt.title = true
v.opt.wrap = false

-- Search
v.opt.ignorecase = true
v.opt.smartcase = true

-- Tab
v.opt.expandtab = true
v.opt.shiftround = true
v.opt.showtabline = 0
v.opt.smarttab = true
v.opt.softtabstop = 2
v.opt.tabstop = 2

-- Indentation
v.opt.autoindent = true
v.opt.copyindent = true
v.opt.shiftwidth = 2
v.opt.smartindent = true

-- Filetype
v.cmd.filetype('on')
v.cmd.filetype('plugin', 'on')
v.cmd.filetype('indent', 'on')

-- Misc
vim.cmd('autocmd! bufenter * if &ft ==# "help" | wincmd L | endif')
v.opt.updatetime = 300
v.opt.history = 100
v.opt.timeoutlen = 300
v.opt.whichwrap = {'b', 's', 'h', 'l'}
v.opt.completeopt = {'menu', 'menuone', 'preview', 'noselect', 'noinsert'}

-- Return to last edit position when opening files (You want this!)
vim.cmd([[
autocmd BufReadPost *
  \ if line("'\"") > 0 && line("'\"") <= line("$") |
  \   exe "normal! g`\"" |
  \ endif
]])
