local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"--single-branch",
		"https://github.com/folke/lazy.nvim.git",
		lazypath,
	})
end
vim.opt.runtimepath:prepend(lazypath)

require("lazy").setup({
	"wbthomason/packer.nvim",

	"folke/tokyonight.nvim", -- colorscheme
	"lewis6991/gitsigns.nvim", -- git signs
	"christoomey/vim-tmux-navigator", -- split manager
	"tpope/vim-vinegar", -- netrw extension
	{ "kylechui/nvim-surround", tag = "*" }, -- text manipulation

	{
		"nvim-telescope/telescope.nvim", -- fuzzy finder
		tag = "0.1.0",
		dependencies = { "nvim-lua/plenary.nvim" },
	},

	{
		"nvim-treesitter/nvim-treesitter", -- syntax highlighting
		build = function()
			require("nvim-treesitter.install").update({ with_sync = true })
		end,
	},

	{
		"VonHeikemen/lsp-zero.nvim", -- lsp
		dependencies = {
			-- lsp support
			"neovim/nvim-lspconfig",
			"williamboman/mason.nvim",
			"williamboman/mason-lspconfig.nvim",
			-- autocompletion
			"hrsh7th/nvim-cmp",
			"hrsh7th/cmp-buffer",
			"hrsh7th/cmp-path",
			"saadparwaiz1/cmp_luasnip",
			"hrsh7th/cmp-nvim-lsp",
			"hrsh7th/cmp-nvim-lua",
			-- snippets
			"L3MON4D3/LuaSnip",
			"rafamadriz/friendly-snippets",
			-- formatting
			"jose-elias-alvarez/null-ls.nvim",
		},
	},
})

-- netrw
vim.g.netrw_banner = 1
vim.keymap.set("n", "<Leader>e", vim.cmd.Ex)

-- colorscheme
vim.cmd([[colorscheme tokyonight-night]])

-- gitsigns
require("gitsigns").setup()

-- surround
require("nvim-surround").setup()

-- telescope
require("telescope").setup({
	defaults = {
		mappings = {
			i = {
				["<C-k>"] = require("telescope.actions").move_selection_previous,
				["<C-j>"] = require("telescope.actions").move_selection_next,
			},
		},
	},
})
vim.keymap.set("n", "<Leader>f", "<Cmd>Telescope find_files<CR>")
vim.keymap.set("n", "<Leader>F", "<Cmd>Telescope live_grep<CR>")

-- treesitter
require("nvim-treesitter.configs").setup({
	ensure_installed = {
		"css",
		"html",
		"python",
		"javascript",
		"lua",
		"tsx",
		"typescript",
	},
	auto_install = true,
	highlight = {
		enable = true,
	},
})
