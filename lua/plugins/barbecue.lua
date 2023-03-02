-- Simple winbar/statusline
return {
	"utilyre/barbecue.nvim",
	dependencies = {
		"neovim/nvim-lspconfig",
		"SmiteshP/nvim-navic",
		"nvim-tree/nvim-web-devicons",
	},
	event = "BufReadPost",
	config = {
		show_navic = false,
		show_modified = true,
		exclude_filetypes = { "Trouble" },
	},
}
