require("kevin.options") -- lua/kevin/options.lua
require("kevin.autocmds") -- lua/kevin/autocmds.lua
require("kevin.keymaps") -- lua/kevin/keymaps.lua
require("kevin.lazy") -- lua/kevin/lazy.lua
vim.cmd([[colorscheme tokyonight]])

vim.api.nvim_create_autocmd("UIEnter", {
	group = vim.api.nvim_create_augroup("set_terminal_bg", {}),
	callback = function()
		local bg = vim.api.nvim_get_hl_by_name("Normal", true)["background"]
		if not bg then
			return
		end
		local fmt = string.format
		if os.getenv("TMUX") then
			bg = fmt('printf "\\ePtmux;\\e\\033]11;#%06x\\007\\e\\\\"', bg)
		else
			bg = fmt('printf "\\033]11;#%06x\\007"', bg)
		end
		os.execute(bg)
		return true
	end,
})
