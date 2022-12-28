local M = {
	"nvim-telescope/telescope.nvim",
	tag = "0.1.0",
	dependencies = { "nvim-lua/plenary.nvim" },
	keys = {
		{ "<Leader>ff", "<Cmd>Telescope find_files<CR>" },
		{ "<Leader>fg", "<Cmd>Telescope live_grep<CR>" },
	},
}

function M.config()
	require("telescope").setup({
		defaults = {
			mappings = {
				i = {
					["<C-k>"] = require("telescope.actions").move_selection_previous,
					["<C-j>"] = require("telescope.actions").move_selection_next,
				},
			},
		},
	})
end

return M
