-- Provide full diagnostics and autocompletion
local M = {
	"VonHeikemen/lsp-zero.nvim",
	dependencies = {
		-- LSP support
		"neovim/nvim-lspconfig",
		"williamboman/mason.nvim",
		"williamboman/mason-lspconfig.nvim",
		-- Autocompletion
		"hrsh7th/nvim-cmp",
		"hrsh7th/cmp-buffer",
		"hrsh7th/cmp-path",
		"saadparwaiz1/cmp_luasnip",
		"hrsh7th/cmp-nvim-lsp",
		"hrsh7th/cmp-nvim-lua",
		-- Snippets
		"L3MON4D3/LuaSnip",
		"rafamadriz/friendly-snippets",
		-- Better Neovim documentation
		"folke/neodev.nvim",
		-- Icons
		"onsails/lspkind.nvim",
	},
	event = "BufReadPre",
}

function M.config()
	require("neodev").setup()

	local icons = require("kevin.icons")
	local lsp = require("lsp-zero")

	lsp.preset("lsp-compe")
	lsp.set_preferences({
		set_lsp_keymaps = false,
		sign_icons = {
			error = icons.Error,
			warn = icons.Warn,
			hint = icons.Hint,
			info = icons.Info,
		},
	})

	lsp.configure("emmet_ls", {
		filetypes = { "html", "typescriptreact", "javascriptreact" },
	})

	lsp.on_attach(function(_, _)
		vim.keymap.set("n", "K", "<Cmd>lua vim.lsp.buf.hover()<CR>", { desc = "Show documentation" })
		vim.keymap.set("n", "gd", "<Cmd>lua vim.lsp.buf.definition()<CR>", { desc = "Go to definition" })
		vim.keymap.set("n", "gD", "<Cmd>lua vim.lsp.buf.declaration()<CR>", { desc = "Go to declaration" })
		vim.keymap.set("n", "gr", "<Cmd>lua vim.lsp.buf.references()<CR>", { desc = "Go to references" })
		vim.keymap.set("n", "gl", "<Cmd>lua vim.diagnostic.open_float()<CR>", { desc = "Go to line diagnostics" })
		vim.keymap.set("n", "<Leader>cr", "<Cmd>lua vim.lsp.buf.rename()<CR>", { desc = "Rename symbol" })
		vim.keymap.set("n", "<Leader>ca", "<Cmd>lua vim.lsp.buf.code_action()<CR>", { desc = "Apply code action" })
	end)

	lsp.setup()

	vim.diagnostic.config({ virtual_text = true })

	local cmp = require("cmp")

	cmp.setup(lsp.defaults.cmp_config({
		mapping = {
			["<Tab>"] = cmp.mapping.confirm({ select = true }),
			["<C-k>"] = cmp.mapping.select_prev_item(),
			["<C-j>"] = cmp.mapping.select_next_item(),
			["<S-Tab>"] = vim.NIL,
			["<CR>"] = vim.NIL,
		},
		formatting = {
			fields = { "abbr", "kind", "menu" },
			format = require("lspkind").cmp_format({}),
		},
		window = {
			completion = cmp.config.window.bordered(),
		},
	}))
end

return M
