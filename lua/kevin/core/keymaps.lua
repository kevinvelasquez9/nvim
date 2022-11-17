local map = vim.keymap.set

vim.g.mapleader = " "

-- general

map("i", "jk", "<Esc>")

map("n", "<Leader>q", "<Cmd>wq<CR>", { desc = "Save and quit" })
map("n", "<Leader>w", "<Cmd>w<CR>", { desc = "Save" })

map("n", "<Leader>nh", "<Cmd>nohl<CR>", { desc = "No highlight" })

map("n", "<Leader>sv", "<C-w>v", { desc = "Split vertically" })
map("n", "<Leader>sh", "<C-w>s", { desc = "Split horizontally" })
map("n", "<Leader>se", "<C-w>=", { desc = "Split equally" })
map("n", "<Leader>sx", "<Cmd>close<CR>", { desc = "Close window" })

-- plugin keymaps

-- bufferline
map("n", "H", "<Cmd>BufferPrevious<CR>")
map("n", "L", "<Cmd>BufferNext<CR>")
map("n", "<Leader>bx", "<Cmd>BufferClose<CR>", { desc = "Close buffer" })
map("n", "<Leader>bo", "<Cmd>BufferCloseAllButCurrent<CR>", { desc = "Close all but current buffer" })

-- nvim-tree
map("n", "<Leader>e", "<Cmd>NvimTreeToggle<CR>", { desc = "File explorer" })

-- telescope
map("n", "<Leader>ff", "<Cmd>Telescope find_files<CR>", { desc = "Find file" })
map("n", "<Leader>fs", "<Cmd>Telescope live_grep<CR>", { desc = "Find string" })
map("n", "<Leader>fc", "<Cmd>Telescope grep_string<CR>", { desc = "Find current word" })
map("n", "<Leader>fb", "<Cmd>Telescope buffers<CR>", { desc = "Find buffer" })

-- vim-maximizer
map("n", "<Leader>sm", "<Cmd>MaximizerToggle<CR>", { desc = "Maximize window" })
