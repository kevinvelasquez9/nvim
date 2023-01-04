local M = {
	"folke/zen-mode.nvim",
}

function M.config()
	require("zen-mode").setup({
		plugins = {
			kitty = {
				enabled = true,
				font = "+16",
			},
		},
	})
	vim.keymap.set("n", "<Leader>zz", "<Cmd>ZenMode<CR>", { desc = "Toggle zen mode" })
end

return M
