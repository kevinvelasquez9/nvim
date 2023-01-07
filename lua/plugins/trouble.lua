local M = {
	"folke/trouble.nvim",
}

function M.config()
	vim.keymap.set("n", "<Leader>xx", "<Cmd>TroubleToggle<CR>")
end

return M
