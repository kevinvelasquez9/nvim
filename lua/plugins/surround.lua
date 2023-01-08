-- `ys{motion}{char}` to surround a {motion}
-- `ds{char}` to delete the surrounding {char}
-- `cs{target}{replacement}` to replace the surrounding {target}
local M = {
	"kylechui/nvim-surround",
	config = true,
	keys = {
		{ "ys", mode = "n" },
		{ "ds", mode = "n" },
		{ "cs", mode = "n" },
		{ "S", mode = "x" },
	},
}

return M
