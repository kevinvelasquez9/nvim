local status, treesitter = pcall(require, "nvim-treesitter.configs")
if not status then
	return
end

treesitter.setup({
	ensure_installed = {
		"css",
		"html",
		"python",
		"javascript",
		"lua",
		"ocaml",
		"tsx",
		"typescript",
	},
	auto_install = true,
	highlight = {
		enable = true,
	},
})
