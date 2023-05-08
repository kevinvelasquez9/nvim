-- TODO echasnovski/mini.ai
return {
	{
		"echasnovski/mini.bracketed",
		event = "VeryLazy",
		config = function(_, opts)
			require("mini.bracketed").setup(opts)
		end,
	},
	{
		"echasnovski/mini.comment",
		event = "VeryLazy",
		opts = {
			hooks = {
				pre = function()
					require("ts_context_commentstring.internal").update_commentstring({})
				end,
			},
		},
		config = function(_, opts)
			require("mini.comment").setup(opts)
		end,
	},
	{
		"echasnovski/mini.pairs",
		event = "InsertEnter",
		config = function(_, opts)
			require("mini.pairs").setup(opts)
		end,
	},
	{
		"echasnovski/mini.surround",
		keys = {
			{ "sa", mode = { "n", "x" } },
			{ "sd", mode = "n" },
			{ "sr", mode = "n" },
			{ "sh", mode = "n" },
			{ "sf", mode = "n" },
			{ "sF", mode = "n" },
		},
		config = function(_, opts)
			require("mini.surround").setup(opts)
		end,
	},
	{ "JoosepAlviste/nvim-ts-context-commentstring", lazy = true },
	{
		"arnamak/stay-centered.nvim",
		event = "BufReadPre",
		config = function()
			require("stay-centered")
		end,
	},
	{
		"christoomey/vim-tmux-navigator",
		keys = {
			{ "<C-h>", "<Cmd>TmuxNavigateLeft<CR>", desc = "Navigate to left split" },
			{ "<C-j>", "<Cmd>TmuxNavigateDown<CR>", desc = "Navigate to below split" },
			{ "<C-k>", "<Cmd>TmuxNavigateUp<CR>", desc = "Navigate to above split" },
			{ "<C-l>", "<Cmd>TmuxNavigateRight<CR>", desc = "Navigate to right split" },
		},
	},
}
