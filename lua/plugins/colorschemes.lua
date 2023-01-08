-- enable your favorite color scheme
local M = {
	{
		"catppuccin/nvim",
		enabled = false,
		config = function()
			vim.cmd([[colorscheme catppuccin]])
		end,
	},
	{
		"bluz71/vim-moonfly-colors",
		enabled = false,
		config = function()
			vim.cmd([[colorscheme moonfly]])
		end,
	},
	{
		"bluz71/vim-nightfly-colors",
		enabled = true,
		config = function()
			vim.cmd([[colorscheme nightfly]])
		end,
	},
	{
		"wuelnerdotexe/vim-enfocado",
		enabled = false,
		config = function()
			vim.cmd([[colorscheme enfocado]])
		end,
	},
	{
		"ellisonleao/gruvbox.nvim",
		enabled = false,
		config = function()
			vim.cmd([[colorscheme gruvbox]])
		end,
	},
}

return M
