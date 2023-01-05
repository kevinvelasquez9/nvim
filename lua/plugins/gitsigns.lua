-- Git decorations and preview hunks
local M = {
	"lewis6991/gitsigns.nvim",
}

function M.config()
	require("gitsigns").setup()
	vim.keymap.set("n", "<Leader>gp", "<Cmd>Gitsigns preview_hunk<CR>", { desc = "Preview hunk" })
end

return M
