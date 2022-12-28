local M = {
	"tpope/vim-vinegar",
	keys = {
		{ "<Leader>e", "<Cmd>Ex<CR>" },
	},
}

function M.config()
	vim.g.netrw_banner = 1
end

return M
