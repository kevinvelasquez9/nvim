-- Automtically center the current line vertically
return {
	"arnamak/stay-centered.nvim",
	event = "BufReadPre",
	config = function()
		require("stay-centered")
	end,
}
