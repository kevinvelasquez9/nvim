return {
	"nvim-treesitter/nvim-treesitter",
	version = false,
	build = ":TSUpdate",
	event = "BufReadPost",
	dependencies = {
		"windwp/nvim-ts-autotag", -- automatically close opening tags
		"mrjones2014/nvim-ts-rainbow", -- rainbow parentheses
	},
	opts = {
		ensure_installed = "all",
		auto_install = true,
		highlight = { enable = true },
		rainbow = { enable = true, disable = { "html" } },
		autotag = { enable = true },
		context_commentstring = { enable = true, enable_autocmd = false },
	},
	config = function(_, opts)
		require("nvim-treesitter.configs").setup(opts)
	end,
}
