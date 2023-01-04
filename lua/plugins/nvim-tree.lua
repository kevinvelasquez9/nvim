local M = {
	"nvim-tree/nvim-tree.lua",
	dependencies = {
		"nvim-tree/nvim-web-devicons",
	},
}

function M.config()
	vim.g.loaded_netrw = 1
	vim.g.loaded_netrwPlugin = 1
	require("nvim-tree").setup()
	vim.keymap.set("n", "<Leader>e", "<Cmd>NvimTreeToggle<CR>", { desc = "Toggle file explorer" })
end

return M
