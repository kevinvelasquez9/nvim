local colorscheme = "nightfly"

local M = {
	{ "catppuccin/nvim", name = "catppuccin" },
	{ "ellisonleao/gruvbox.nvim", name = "gruvbox" },
	{ "bluz71/vim-nightfly-colors", name = "nightfly" },
	{ "rebelot/kanagawa.nvim", name = "kanagawa" },
	{ "folke/tokyonight.nvim", name = "tokyonight" },
	{ "projekt0n/github-nvim-theme", name = "github_dark" },
}

for _, v in pairs(M) do
	if v.name == colorscheme then
		v.config = function()
			vim.cmd.colorscheme(v.name)
		end
	end
end

return M
