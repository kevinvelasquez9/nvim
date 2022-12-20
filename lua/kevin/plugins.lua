local install_path = vim.fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
local is_bootstrap = false
if vim.fn.empty(vim.fn.glob(install_path)) > 0 then
	is_bootstrap = true
	vim.fn.execute("!git clone https://github.com/wbthomason/packer.nvim " .. install_path)
	vim.cmd([[packadd packer.nvim]])
end

require("packer").startup(function(use)
	use("wbthomason/packer.nvim")

	use("folke/tokyonight.nvim") -- colorscheme
	use("lewis6991/gitsigns.nvim") -- git signs
	use("christoomey/vim-tmux-navigator") -- split manager
	use("tpope/vim-vinegar") -- netrw extension
	use({ "kylechui/nvim-surround", tag = "*" }) -- text manipulation

	use({
		"nvim-telescope/telescope.nvim", -- fuzzy finder
		tag = "0.1.0",
		requires = { { "nvim-lua/plenary.nvim" } },
	})

	use({
		"nvim-treesitter/nvim-treesitter", -- syntax highlighting
		run = function()
			require("nvim-treesitter.install").update({ with_sync = true })
		end,
	})

	use({
		"VonHeikemen/lsp-zero.nvim", -- lsp
		requires = {
			-- lsp support
			{ "neovim/nvim-lspconfig" },
			{ "williamboman/mason.nvim" },
			{ "williamboman/mason-lspconfig.nvim" },
			-- autocompletion
			{ "hrsh7th/nvim-cmp" },
			{ "hrsh7th/cmp-buffer" },
			{ "hrsh7th/cmp-path" },
			{ "saadparwaiz1/cmp_luasnip" },
			{ "hrsh7th/cmp-nvim-lsp" },
			{ "hrsh7th/cmp-nvim-lua" },
			-- snippets
			{ "L3MON4D3/LuaSnip" },
			{ "rafamadriz/friendly-snippets" },
			-- formatting
			{ "jose-elias-alvarez/null-ls.nvim" },
		},
	})

	if is_bootstrap then
		require("packer").sync()
	end
end)

if is_bootstrap then
	print("==================================")
	print("    Plugins are being installed   ")
	print("    Wait until Packer completes,  ")
	print("       then restart nvim          ")
	print("==================================")
	return
end

-- automatically source and re-compile packer when you save this file
vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
  augroup end
]])

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
