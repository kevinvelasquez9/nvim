local setup, nvimtree = pcall(require, "nvim-tree")
if not setup then
	return
end

vim.g.loaded = 1
vim.g.loaded_netrwPlugin = 1

nvimtree.setup({
	-- disable folder arrow icons
	renderer = {
		icons = {
			show = {
				folder_arrow = false,
			},
		},
	},
	-- disable window_picker
	actions = {
		open_file = {
			window_picker = {
				enable = false,
			},
		},
	},
})
