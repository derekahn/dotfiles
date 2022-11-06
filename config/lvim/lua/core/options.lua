local opt = vim.opt

-----------------------------------------------------------
-- Neovim UI
-----------------------------------------------------------
opt.relativenumber = true -- show relative distance between rows
opt.showtabline = 0 -- never display page tab labels (default 2)
opt.syntax = "enable" -- enable syntax highlighting
opt.colorcolumn = "99999" -- fixes indentline for now

-----------------------------------------------------------
-- Memory, CPU
-----------------------------------------------------------
opt.hidden = true -- enable background buffers
opt.history = 100 -- remember n lines in history
opt.lazyredraw = true -- faster scrolling
opt.synmaxcol = 240 -- max column for syntax highlight
opt.timeoutlen = 200 -- determine the behavior when part of a key code sequence has been received by the (default 1000);
opt.updatetime = 50 -- shorten delay; (default is 4000 ms = 4 s) leads to noticeable (default 100)

-----------------------------------------------------------
-- Tabs, indent
-----------------------------------------------------------
opt.smartindent = true -- autoindent new lines
opt.autoindent = true -- copy indent from current line
