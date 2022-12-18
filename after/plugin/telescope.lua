local telescope_setup, telescope = pcall(require, "telescope")
if not telescope_setup then
	return
end

local actions_setup, actions = pcall(require, "telescope.actions")
if not actions_setup then
	return
end

telescope.setup({
	defaults = {
		mappings = {
			i = {
				["<C-k>"] = actions.move_selection_previous,
				["<C-j>"] = actions.move_selection_next,
			},
		},
	},
})

vim.keymap.set("n", "<Leader>f", "<Cmd>Telescope find_files<CR>")
vim.keymap.set("n", "<Leader>F", "<Cmd>Telescope live_grep<CR>")
