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
	},
	event = "BufReadPre",
}

function M.config()
	require("neodev").setup()

	local lsp = require("lsp-zero")
	local cmp = require("cmp")

	lsp.preset("recommended")
	lsp.set_preferences({
		set_lsp_keymaps = false,
		sign_icons = {
			error = "■",
			warn = "■",
			hint = "■",
			info = "■",
		},
	})
	lsp.ensure_installed({ "sumneko_lua" })

	local cmp_kinds = {
		-- https://github.com/microsoft/vscode-codicons/raw/main/dist/codicon.ttf
		Text = " ",
		Method = " ",
		Function = " ",
		Constructor = " ",
		Field = " ",
		Variable = " ",
		Class = " ",
		Interface = " ",
		Module = " ",
		Property = " ",
		Unit = " ",
		Value = " ",
		Enum = " ",
		Keyword = " ",
		Snippet = " ",
		Color = " ",
		File = " ",
		Reference = " ",
		Folder = " ",
		EnumMember = " ",
		Constant = " ",
		Struct = " ",
		Event = " ",
		Operator = " ",
		TypeParameter = " ",
	}

	local cmp_mappings = lsp.defaults.cmp_mappings({
		["<Tab>"] = cmp.mapping.confirm({ select = true }),
	})
	cmp_mappings["<S-Tab>"] = nil
	cmp_mappings["<CR>"] = nil

	lsp.setup_nvim_cmp({
		mapping = cmp_mappings,
		formatting = {
			fields = { "kind", "abbr" },
			format = function(_, item)
				item.kind = cmp_kinds[item.kind]
				return item
			end,
		},
	})

	lsp.on_attach(function(_, _)
		vim.keymap.set("n", "K", "<Cmd>lua vim.lsp.buf.hover()<CR>", { desc = "Show documentation" })
		vim.keymap.set("n", "gd", "<Cmd>lua vim.lsp.buf.definition()<CR>", { desc = "Go to definition" })
		vim.keymap.set("n", "gD", "<Cmd>lua vim.lsp.buf.declaration()<CR>", { desc = "Go to declaration" })
		vim.keymap.set("n", "gr", "<Cmd>lua vim.lsp.buf.references()<CR>", { desc = "Go to references" })
		vim.keymap.set("n", "gl", "<Cmd>lua vim.diagnostic.open_float()<CR>", { desc = "Go to line diagnostics" })
		vim.keymap.set("n", "<Leader>r", "<Cmd>lua vim.lsp.buf.rename()<CR>", { desc = "Rename symbol" })
		vim.keymap.set("n", "<Leader>a", "<Cmd>lua vim.lsp.buf.code_action()<CR>", { desc = "Apply code action" })
	end)

	lsp.setup()

	vim.diagnostic.config({
		virtual_text = true,
	})
end

return M
