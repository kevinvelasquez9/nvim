local M = {
	"bluz71/vim-nightfly-colors",
	lazy = false,
	priority = 1000,
}

function M.config()
	vim.cmd([[colorscheme nightfly]])
end

return M
