local lsp_status, lsp = pcall(require, "lsp-zero")
if not lsp_status then
	return
end

local cmp_status, cmp = pcall(require, "cmp")
if not cmp_status then
	return
end

lsp.preset("recommended")

lsp.ensure_installed({
	"ocamllsp",
	"pyright",
	"sumneko_lua",
	"tsserver",
})

local cmp_mappings = lsp.defaults.cmp_mappings({
	["<C-Space>"] = cmp.mapping.confirm({ select = false }),
})
cmp_mappings["<CR>"] = nil

lsp.setup_nvim_cmp({
	mapping = cmp_mappings,
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

local null_ls_setup, null_ls = pcall(require, "null-ls")
if not null_ls_setup then
	return
end

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
		formatting.stylua,
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
