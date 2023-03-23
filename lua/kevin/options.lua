vim.g.mapleader = " "
vim.g.maplocalleader = " "

local o = vim.opt

o.backup = false -- Don't backup files
o.clipboard = "unnamedplus" -- Sync with system clipboard
o.cursorline = true -- Highlight current line
o.expandtab = true -- Use spaces instead of tabs
o.guicursor = "" -- Use block cursor
o.ignorecase = true -- Ignore case
o.laststatus = 3 -- Global status line
o.number = true -- Show line numbers
o.relativenumber = true -- Show relative line numbers
o.scrolloff = 4 -- Lines of context
o.shiftwidth = 2 -- Size of an indent
o.showmode = false -- Don't show mode
o.signcolumn = "yes" -- Always show signcolumn
o.smartcase = true -- Don't ignore case with capitals
o.smartindent = true -- Insert indents automatically
o.softtabstop = 2 -- Backspace will delete a tab
o.splitbelow = true -- Put new windows below current
o.splitright = true -- Put new windows right of current
o.swapfile = false -- Don't create swapfiles
o.tabstop = 2 -- Number of spaces tabs count for
o.termguicolors = true -- True color support
o.undofile = true -- Save undo history to an undo file
o.wrap = false -- Disable line wrap
