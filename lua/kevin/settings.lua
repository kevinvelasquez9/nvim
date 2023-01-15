local o = vim.opt
vim.g.mapleader = " "

-- Faster way to exit insert mode
vim.keymap.set("i", "jk", "<Esc>")

-- Treat visual lines as normal lines
vim.keymap.set("n", "j", "gj")
vim.keymap.set("n", "k", "gk")

-- Use block cursor
o.guicursor = ""

-- Line numbers
o.number = true
o.relativenumber = true

-- Tabs & indentation
o.tabstop = 2
o.softtabstop = 2
o.shiftwidth = 2
o.expandtab = true
o.smartindent = true

-- Line wrapping
o.wrap = true

-- Search
o.ignorecase = true
o.smartcase = true
o.hlsearch = false

-- Appearance
o.termguicolors = true
o.signcolumn = "yes"
o.cursorline = true
o.laststatus = 3
o.showmode = false

-- Use system clipboard
o.clipboard:append("unnamedplus")

-- Split windows
o.splitright = true
o.splitbelow = true

-- Backup
o.swapfile = false
o.backup = false
o.undodir = os.getenv("HOME") .. "/.vim/undodir"
o.undofile = true
