-- Show all keymaps while typing
local M = {
	"folke/which-key.nvim",
	event = "BufReadPre",
	enabled = false,
}

function M.config()
	vim.o.timeoutlen = 500
	local wk = require("which-key")
	wk.setup({
		key_labels = { ["<Leader>"] = "SPC" },
	})
	wk.register({
		mode = { "n", "v" },
		["<Leader>f"] = { name = "+find" },
		["<Leader>g"] = { name = "+git" },
	})
end

return M
