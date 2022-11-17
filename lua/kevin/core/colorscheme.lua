local colorscheme = "rose-pine"

local colorscheme_status, _ = pcall(vim.cmd, "colorscheme " .. colorscheme)
if not colorscheme_status then
	print("Colorscheme not found: " .. colorscheme)
	return
end
