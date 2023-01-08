-- `<C-[h,j,k,l]>` to navigate between splits and windows
local M = {
	"christoomey/vim-tmux-navigator",
	keys = {
		{ "<C-h>", "<Cmd>TmuxNavigateLeft<CR>", desc = "Navigate to left split" },
		{ "<C-j>", "<Cmd>TmuxNavigateDown<CR>", desc = "Navigate to below split" },
		{ "<C-k>", "<Cmd>TmuxNavigateUp<CR>", desc = "Navigate to above split" },
		{ "<C-l>", "<Cmd>TmuxNavigateRight<CR>", desc = "Navigate to right split" },
	},
}

return M
