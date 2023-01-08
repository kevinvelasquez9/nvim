-- `gcc` to create linewise comment
-- `gbc` to create blockwise comment
local M = {
	"numToStr/Comment.nvim",
	config = true,
	keys = {
		{ "gcc", mode = "n" },
		{ "gbc", mode = "n" },
		{ "gc", mode = "x" },
		{ "gb", mode = "x" },
	},
}

return M
