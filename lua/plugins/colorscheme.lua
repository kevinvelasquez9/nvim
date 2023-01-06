-- Use your favorite color scheme
local M = {
	"catppuccin/nvim",
	-- "bluz71/vim-moonfly-colors",
	-- "bluz71/vim-nightfly-colors",
	-- "wuelnerdotexe/vim-enfocado",
}

function M.config()
	vim.cmd([[colorscheme catppuccin]])
end

return M
