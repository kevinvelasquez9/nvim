-- `<Leader>e` to toggle the file explorer tree
local M = {
	"nvim-tree/nvim-tree.lua",
	dependencies = {
		"nvim-tree/nvim-web-devicons",
	},
	keys = {
		{ "<Leader>e", "<Cmd>NvimTreeToggle<CR>", desc = "Toggle file explorer" },
	},
}

function M.config()
	vim.g.loaded_netrw = 1
	vim.g.loaded_netrwPlugin = 1
	require("nvim-tree").setup()
end

return M
