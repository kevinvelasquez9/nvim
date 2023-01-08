-- `<Leader>ff` to search for files
-- `<Leader>ft` to search for text
-- `<Leader>fk` to search for configured keymaps
local M = {
	"nvim-telescope/telescope.nvim",
	tag = "0.1.0",
	dependencies = { "nvim-lua/plenary.nvim" },
	keys = {
		{ "<Leader>ff", "<Cmd>Telescope find_files<CR>", desc = "Find files" },
		{ "<Leader>ft", "<Cmd>Telescope live_grep<CR>", desc = "Find text" },
		{ "<Leader>fk", "<Cmd>Telescope keymaps<CR>", desc = "Find keymaps" },
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
