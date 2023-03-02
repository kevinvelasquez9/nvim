local M = {
	"folke/trouble.nvim",
	cmd = { "TroubleToggle", "Trouble" },
	keys = {
		{ "<Leader>x", "<Cmd>TroubleToggle<CR>", desc = "Toggle trouble list" },
	},
}

function M.config()
	local icons = require("kevin.icons")

	require("trouble").setup({
		signs = {
			error = icons.Error,
			warning = icons.Warn,
			hint = icons.Hint,
			information = icons.Info,
			other = icons.Other,
		},
	})
end

return M
