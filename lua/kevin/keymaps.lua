local map = vim.keymap.set

-- Faster way to exit insert mode
map("i", "jk", "<Esc>")

-- Faster way to save
map("n", "<Leader>w", "<Cmd>w<CR>", { desc = "Save" })

-- Treat visual lines as normal lines
map("n", "j", "gj")
map("n", "k", "gk")

-- Resize window using <Ctrl> arrow keys
map("n", "<C-Up>", "<Cmd>resize +2<CR>", { desc = "Increase window height" })
map("n", "<C-Down>", "<Cmd>resize -2<CR>", { desc = "Decrease window height" })
map("n", "<C-Left>", "<Cmd>vertical resize -2<CR>", { desc = "Decrease window width" })
map("n", "<C-Right>", "<Cmd>vertical resize +2<CR>", { desc = "Increase window width" })

-- Clear search with <Esc>
map({ "i", "n" }, "<Esc>", "<Cmd>noh<CR><Esc>", { desc = "Escape and clear hlsearch" })

-- Better indenting
map("v", "<", "<gv")
map("v", ">", ">gv")

-- Lazy
map("n", "<Leader>l", "<Cmd>Lazy<CR>", { desc = "Open Lazy" })
