-- Use your favorite color scheme
local colorscheme = "sweetie"

local M = {
	{ "catppuccin/nvim", name = "catppucin" },
	{ "bluz71/vim-moonfly-colors", name = "moonfly" },
	{ "bluz71/vim-nightfly-colors", name = "nightfly" },
	{ "wuelnerdotexe/vim-enfocado", name = "enfocado" },
	{ "ellisonleao/gruvbox.nvim", name = "gruvbox" },
	{ "rebelot/kanagawa.nvim", name = "kanagawa" },
	{ "arturgoms/moonbow.nvim", name = "moonbow" },
	{ "folke/tokyonight.nvim", name = "tokyonight" },
	{ "askfiy/visual_studio_code", name = "visual_studio_code_dark" },
	{ "NTBBloodbath/sweetie.nvim", name = "sweetie" },
}

for _, v in pairs(M) do
	if v.name == colorscheme then
		v.config = function()
			vim.cmd.colorscheme(colorscheme)
		end
	end
end

return M
