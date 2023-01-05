local o = vim.opt
vim.g.mapleader = " "

-- exist insert mode
vim.keymap.set("i", "jk", "<Esc>")

-- use block cursor
o.guicursor = ""

-- line numbers
o.number = true
o.relativenumber = true

-- tabs & indentation
o.tabstop = 2
o.softtabstop = 2
o.shiftwidth = 2
o.expandtab = true
o.smartindent = true

-- line wrapping
o.wrap = false

-- search
o.ignorecase = true
o.smartcase = true
o.hlsearch = false

-- appearance
o.termguicolors = true
o.signcolumn = "yes"

-- use system clipboard
o.clipboard:append("unnamedplus")

-- split windows
o.splitright = true
o.splitbelow = true

-- backup
o.swapfile = false
o.backup = false
o.undodir = os.getenv("HOME") .. "/.vim/undodir"
o.undofile = true
