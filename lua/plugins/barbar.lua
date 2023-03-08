return {
	"romgrk/barbar.nvim",
	dependencies = "nvim-tree/nvim-web-devicons",
	event = "VeryLazy",
	keys = {
		{ "H", "<Cmd>BufferPrevious<CR>", desc = "Previous buffer" },
		{ "L", "<Cmd>BufferNext<CR>", desc = "Next buffer" },
		{ "<Leader>bx", "<Cmd>BufferClose<CR>", desc = "Close buffer" },
		{ "<Leader>bo", "<Cmd>BufferCloseAllButCurrentOrPinned<CR>", desc = "Only buffer" },
		{ "<Leader>bp", "<Cmd>BufferPin<CR>", desc = "Pin buffer" },
		{ "<Leader>b<Left>", "<Cmd>BufferMovePrevious<CR>", desc = "Move buffer left" },
		{ "<Leader>b<Right>", "<Cmd>BufferMoveNext<CR>", desc = "Move buffer right" },
	},
	config = function()
		local nvim_tree_events = require("nvim-tree.events")
		local bufferline_api = require("bufferline.api")

		local function get_tree_size()
			return require("nvim-tree.view").View.width
		end

		nvim_tree_events.subscribe("TreeOpen", function()
			bufferline_api.set_offset(get_tree_size(), "")
		end)

		nvim_tree_events.subscribe("Resize", function()
			bufferline_api.set_offset(get_tree_size(), "")
		end)

		nvim_tree_events.subscribe("TreeClose", function()
			bufferline_api.set_offset(0)
		end)

		require("bufferline").setup({ icon_pinned = "" })
	end,
}
