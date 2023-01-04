local M = {
	"tpope/vim-vinegar",
}

function M.config()
	vim.g.netrw_banner = 1
	vim.keymap.set("n", "<Leader>e", "<Cmd>Ex<CR>", { desc = "Open file explorer" })
end

return M
