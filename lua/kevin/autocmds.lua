-- Highlight on yank
vim.api.nvim_create_autocmd("TextYankPost", {
	callback = function()
		vim.highlight.on_yank()
	end,
})

-- Close some filetypes with <q>
vim.api.nvim_create_autocmd("FileType", {
	pattern = {
		"qf",
		"help",
		"man",
		"notify",
		"lspinfo",
		"spectre_panel",
		"startuptime",
		"tsplayground",
		"PlenaryTestPopup",
	},
	callback = function(event)
		vim.bo[event.buf].buflisted = false
		vim.keymap.set("n", "q", "<Cmd>close<CR>", { buffer = event.buf, silent = true })
	end,
})

-- Enable line wrap and spell check for certain files
vim.api.nvim_create_autocmd("FileType", {
	pattern = { "gitcommit", "markdown" },
	callback = function()
		vim.opt_local.wrap = true
		vim.opt_local.spell = true
	end,
})

-- Change terminal background to match Neovim
vim.api.nvim_create_autocmd("ColorScheme", {
	callback = function()
		print("hi")
		local bg = vim.api.nvim_get_hl_by_name("Normal", true)["background"]
		if not bg then
			return
		end
		if os.getenv("TMUX") then
			bg = string.format('printf "\\ePtmux;\\e\\033]11;#%06x\\007\\e\\\\"', bg)
		else
			bg = string.format('printf "\\033]11;#%06x\\007"', bg)
		end
		os.execute(bg)
		return true
	end,
})
