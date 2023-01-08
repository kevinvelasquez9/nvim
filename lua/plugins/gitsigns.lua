-- Git decorations and preview hunks
local M = {
	"lewis6991/gitsigns.nvim",
	config = true,
	event = "BufReadPost",
	keys = {
		{ "<Leader>gp", "<Cmd>Gitsigns preview_hunk<CR>", desc = "Preview hunk" },
	},
}

return M
