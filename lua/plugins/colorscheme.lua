return {
	{ "catppuccin/nvim", name = "catppuccin" },
	{ "bluz71/vim-nightfly-colors", name = "nightfly" },
	{ "rebelot/kanagawa.nvim", name = "kanagawa" },
	{ "folke/tokyonight.nvim", name = "tokyonight" },
	{ "projekt0n/github-nvim-theme", name = "github_dark" },
	{
		"navarasu/onedark.nvim",
		name = "onedark",
		config = function()
			require("onedark").setup({ style = "deep" })
			require("onedark").load()
		end,
	},
}
