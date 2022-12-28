local M = {
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
}

function M.config()
	local lsp = require("lsp-zero")
	local cmp = require("cmp")

	lsp.preset("recommended")

	lsp.ensure_installed({
		"cssls",
		"gopls",
		"html",
		"ocamllsp",
		"pyright",
		"sumneko_lua",
		"tailwindcss",
		"tsserver",
	})

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

	local null_ls = require("null-ls")
	local formatting = null_ls.builtins.formatting
	local augroup = vim.api.nvim_create_augroup("LspFormatting", {})

	null_ls.setup({
		sources = {
			formatting.black,
			formatting.gofumpt,
			formatting.google_java_format,
			formatting.ocamlformat.with({
				args = { "--enable-outside-detected-project", "--name", "$FILENAME", "-" },
			}),
			formatting.prettier,
			formatting.rustfmt,
			formatting.stylua,
			formatting.taplo,
		},
		-- format on save
		on_attach = function(current_client, bufnr)
			if current_client.supports_method("textDocument/formatting") then
				vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
				vim.api.nvim_create_autocmd("BufWritePre", {
					group = augroup,
					buffer = bufnr,
					callback = function()
						vim.lsp.buf.format({
							filter = function(client)
								--  only use null-ls for formatting instead of lsp server
								return client.name == "null-ls"
							end,
							bufnr = bufnr,
						})
					end,
				})
			end
		end,
	})
end

return M
