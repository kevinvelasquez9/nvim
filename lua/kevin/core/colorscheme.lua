local tokyonight_status, tokyonight = pcall(require, "tokyonight")
if not tokyonight_status then
	return
end

tokyonight.setup({
	style = "night",
})

local colorscheme = "tokyonight-night"
local colorscheme_status, _ = pcall(vim.cmd, "colorscheme " .. colorscheme)
if not colorscheme_status then
	print("Colorscheme not found: " .. colorscheme)
	return
end
