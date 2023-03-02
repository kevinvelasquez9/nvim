-- `<Leader>e` to toggle the file explorer tree
local M = {
	"nvim-tree/nvim-tree.lua",
	dependencies = {
		"nvim-tree/nvim-web-devicons",
	},
	keys = {
		{ "<Leader>e", "<Cmd>NvimTreeFindFileToggle<CR>", desc = "Toggle file explorer" },
	},
}

function M.config()
	vim.g.loaded_netrw = 1
	vim.g.loaded_netrwPlugin = 1

	local icons = require("kevin.icons")

	require("nvim-tree").setup({
		renderer = {
			highlight_git = true,
			indent_markers = {
				enable = true,
			},
			icons = {
				show = {
					folder_arrow = false,
					git = false,
				},
			},
		},
		diagnostics = {
			enable = true,
			show_on_dirs = true,
			icons = {
				hint = icons.Hint,
				info = icons.Info,
				warning = icons.Warn,
				error = icons.Error,
			},
		},
		-- filters = {
		-- 	custom = { "^.git$", "^node_modules$" },
		-- },
	})
end

return M
