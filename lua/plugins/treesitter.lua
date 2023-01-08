-- Better syntax highlighting and more text objects
local M = {
	"nvim-treesitter/nvim-treesitter",
	build = function()
		require("nvim-treesitter.install").update({ with_sync = true })
	end,
	dependencies = {
		"windwp/nvim-ts-autotag", -- automatically close opening tags
	},
}

function M.config()
	require("nvim-treesitter.configs").setup({
		ensure_installed = {
			"css",
			"html",
			"python",
			"javascript",
			"lua",
			"tsx",
			"typescript",
		},
		auto_install = true,
		highlight = {
			enable = true,
		},
		autotag = {
			enable = true,
		},
	})
end

return M
