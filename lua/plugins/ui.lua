return {
	{ "nvim-tree/nvim-web-devicons", lazy = true },
	{ "projekt0n/circles.nvim", lazy = true },
	{ "stevearc/dressing.nvim", lazy = true },
	{ "MunifTanjim/nui.nvim", lazy = true },
	{ "nvim-lua/plenary.nvim", lazy = true },
	{ "brenoprata10/nvim-highlight-colors", config = true },
	{
		"akinsho/bufferline.nvim",
		event = "VeryLazy",
		keys = {
			{ "H", "<Cmd>BufferLineCyclePrev<CR>", desc = "Previous buffer" },
			{ "L", "<Cmd>BufferLineCycleNext<CR>", desc = "Next buffer" },
			{ "<Leader>bp", "<Cmd>BufferLineTogglePin<CR>", desc = "Toggle pin" },
		},
		opts = {
			options = {
				diagnostics = "nvim_lsp",
				diagnostics_indicator = function(count, _)
					local circle = require("circles").get_config().icons.filled .. " "
					return " " .. circle .. count
				end,
				offsets = {
					{
						filetype = "neo-tree",
						text = "Neo-tree",
						highlight = "Directory",
						text_align = "left",
					},
				},
			},
		},
	},
	{
		"nvim-lualine/lualine.nvim",
		event = "VeryLazy",
		opts = function()
			-- local circle = require("circles").get_config().icons.filled .. " "
			local circle = "● "
			return {
				options = { component_separators = "", section_separators = "" },
				sections = {
					lualine_a = { "mode" },
					lualine_b = {},
					lualine_c = {
						{ "branch", icon = "" },
						{
							"diagnostics",
							sections = { "error", "warn" },
							symbols = { error = circle, warn = circle },
							always_visible = true,
						},
					},
					lualine_x = {
						function()
							local row, col = unpack(vim.api.nvim_win_get_cursor(0))
							return ("Ln %s, Col %s"):format(row, col + 1)
						end,
						function()
							local style = vim.opt_local.expandtab:get() and "Spaces" or "Tab Size"
							local width = vim.opt_local.shiftwidth:get()
							return ("%s: %s"):format(style, width)
						end,
						{ "filetype", icons_enabled = true },
					},
					lualine_y = {},
					lualine_z = {},
				},
			}
		end,
	},
	{
		"echasnovski/mini.indentscope",
		version = false, -- wait till new 0.7.0 release to put it back on semver
		event = { "BufReadPre", "BufNewFile" },
		opts = {
			symbol = "│",
			options = { try_as_border = true },
		},
		config = function(_, opts)
			vim.api.nvim_create_autocmd("FileType", {
				pattern = { "help", "alpha", "dashboard", "neo-tree", "Trouble", "lazy", "mason" },
				callback = function()
					vim.b.miniindentscope_disable = true
				end,
			})
			require("mini.indentscope").setup(opts)
		end,
	},
}
