-- `<Leader>zz` to remove distractions and center your editor
local M = {
	"folke/zen-mode.nvim",
	config = true,
	keys = {
		{ "<Leader>zz", "<Cmd>ZenMode<CR>", desc = "Toggle zen mode" },
	},
}

return M
