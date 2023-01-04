local M = {
	"VonHeikemen/lsp-zero.nvim",
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
	},
}

function M.config()
	local lsp = require("lsp-zero")
	local cmp = require("cmp")

	lsp.preset("recommended")

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
		["<C-Space>"] = cmp.mapping.confirm({ select = true }),
	})
	cmp_mappings["<CR>"] = nil

	lsp.setup_nvim_cmp({
		mapping = cmp_mappings,
		formatting = {
			format = function(_, vim_item)
				vim_item.kind = (cmp_kinds[vim_item.kind] or "") .. " " .. vim_item.kind
				return vim_item
			end,
		},
	})

	lsp.configure("sumneko_lua", {
		settings = {
			Lua = {
				diagnostics = {
					globals = { "vim" },
				},
				workspace = {
					library = {
						[vim.fn.expand("$VIMRUNTIME/lua")] = true,
						[vim.fn.stdpath("config") .. "/lua"] = true,
					},
				},
			},
		},
	})

	lsp.setup()
end

return M
