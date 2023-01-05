-- Use your favorite color scheme
local M = {
	"bluz71/vim-moonfly-colors",
	-- "bluz71/vim-nightfly-colors",
	-- "wuelnerdotexe/vim-enfocado",
}

function M.config()
	vim.cmd([[colorscheme moonfly]])
end

return M
