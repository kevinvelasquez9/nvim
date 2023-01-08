-- Automtically center the current line vertically
local M = {
	"arnamak/stay-centered.nvim",
	event = "BufReadPre",
}

function M.config()
	require("stay-centered")
end

return M
