local install_path = vim.fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
local is_bootstrap = false
if vim.fn.empty(vim.fn.glob(install_path)) > 0 then
	is_bootstrap = true
	vim.fn.execute("!git clone https://github.com/wbthomason/packer.nvim " .. install_path)
	vim.cmd([[packadd packer.nvim]])
end

require("packer").startup(function(use)
	use("wbthomason/packer.nvim")

	-- colorscheme
	use("pineapplegiant/spaceduck")
	use("Shatur/neovim-ayu")

	-- git
	use("lewis6991/gitsigns.nvim")

	-- undo tree
	use("mbbill/undotree")

	-- window manager
	use("christoomey/vim-tmux-navigator")

	-- fuzzy finder
	use({
		"nvim-telescope/telescope.nvim",
		tag = "0.1.0",
		requires = { { "nvim-lua/plenary.nvim" } },
	})

	-- syntax highlighting
	use({
		"nvim-treesitter/nvim-treesitter",
		run = function()
			require("nvim-treesitter.install").update({ with_sync = true })
		end,
	})

	use({
		"VonHeikemen/lsp-zero.nvim",
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
