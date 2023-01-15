local M = {
	"goolord/alpha-nvim",
	dependencies = { "BlakeJC94/alpha-nvim-fortune" },
}

function M.config()
	local alpha = require("alpha")
	local dashboard = require("alpha.themes.dashboard")

	-- Set header
	dashboard.section.header.val = {
		"                                                     ",
		"  ███╗   ██╗███████╗ ██████╗ ██╗   ██╗██╗███╗   ███╗ ",
		"  ████╗  ██║██╔════╝██╔═══██╗██║   ██║██║████╗ ████║ ",
		"  ██╔██╗ ██║█████╗  ██║   ██║██║   ██║██║██╔████╔██║ ",
		"  ██║╚██╗██║██╔══╝  ██║   ██║╚██╗ ██╔╝██║██║╚██╔╝██║ ",
		"  ██║ ╚████║███████╗╚██████╔╝ ╚████╔╝ ██║██║ ╚═╝ ██║ ",
		"  ╚═╝  ╚═══╝╚══════╝ ╚═════╝   ╚═══╝  ╚═╝╚═╝     ╚═╝ ",
		"                                                     ",
	}

	-- Set menu
	dashboard.section.buttons.val = {
		dashboard.button("f", "  > Find file", "<Cmd>lua require('telescope.builtin').find_files()<CR>"),
		dashboard.button("s", "  > Settings", "<Cmd>cd ~/.config/nvim | e init.lua<CR>"),
		dashboard.button("q", "  > Quit", "<Cmd>qa<CR>"),
	}

	-- Set footer
	local fortune = require("alpha.fortune")
	dashboard.section.footer.val = fortune()

	-- Send config to alpha
	alpha.setup(dashboard.opts)
end

return M
