local M = { "folke/zen-mode.nvim" }

function M.config()
	require("zen-mode").setup({
		plugins = {
			gitsigns = { enabled = true },
			kitty = { enabled = true },
		},
	})
end

return M
