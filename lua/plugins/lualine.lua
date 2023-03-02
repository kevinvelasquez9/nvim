-- Fancy status line
return {
	"nvim-lualine/lualine.nvim",
	dependencies = {
		"nvim-tree/nvim-web-devicons",
	},
	event = "BufReadPre",
	config = function()
		require("lualine").setup({
			options = {
				component_separators = "",
				section_separators = "",
				theme = "auto",
			},
			sections = {
				lualine_a = {
					{
						"headers",
						fmt = function(_, _)
							return "  "
						end,
					},
				},
				lualine_b = {
					{ "branch", icon = "" },
					{
						"diagnostics",
						sections = { "error", "warn" },
						diagnostics_color = {
							error = { fg = "Normal" },
							warn = { fg = "Normal" },
						},
						always_visible = true,
					},
				},
				lualine_c = {
					{
						"mode",
						fmt = function(content, _)
							return ("-- %s --"):format(content)
						end,
					},
				},
				lualine_x = {
					{
						"location",
						fmt = function(_, _)
							local row, col = unpack(vim.api.nvim_win_get_cursor(0))
							return ("Ln %s, Col %s"):format(row, col + 1)
						end,
					},
				},
				lualine_y = {
					{
						"spaces",
						fmt = function(_, _)
							local style = vim.opt_local.expandtab:get() and "Spaces" or "Tab Size"
							local width = vim.opt_local.shiftwidth:get()
							return ("%s: %s"):format(style, width)
						end,
					},
				},
				lualine_z = {
					{ "filetype", icons_enabled = false },
					{
						"decorate",
						fmt = function(_, _)
							return "   "
						end,
					},
				},
			},
		})
	end,
}
