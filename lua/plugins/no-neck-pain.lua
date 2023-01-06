local M = {
	"shortcuts/no-neck-pain.nvim",
}

function M.config()
	require("no-neck-pain").setup({
		enableOnVimEnter = true,
	})
end

return M
