local status, treesitter = pcall(require, "nvim-treesitter.configs")
if not status then
	return
end

treesitter.setup({
	highlight = {
		enable = true,
	},
	indent = { enable = true },
	-- enable autotagging (w/ nvim-ts-autotag plugin)
	autotag = { enable = true },
	ensure_installed = {
		"bash",
		"css",
		"dockerfile",
		"gitignore",
		"graphql",
		"html",
		"javascript",
		"json",
		"lua",
		"markdown",
		"ocaml",
		"svelte",
		"tsx",
		"typescript",
		"vim",
		"yaml",
	},
	auto_install = true,
})
