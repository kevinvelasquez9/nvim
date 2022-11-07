local o = vim.opt

-- line numbers
o.relativenumber = true
o.number = true

-- tabs & indentation
o.tabstop = 2
o.shiftwidth = 2
o.expandtab = true
o.autoindent = true

-- line wrapping
o.wrap = false

-- search
o.ignorecase = true
o.smartcase = true

-- cursor line
o.cursorline = true
o.colorcolumn = "80"

-- appearance
o.termguicolors = true
o.background = "dark"
o.signcolumn = "yes"

-- backspace
o.backspace = "indent,eol,start"

-- clipboard
o.clipboard:append("unnamedplus")

-- split windows
o.splitright = true
o.splitbelow = true

-- misc
o.iskeyword:append("-")
o.timeoutlen = 200
