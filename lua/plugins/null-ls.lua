-- Provide autoformatting for configured language servers
local M = {
	"jose-elias-alvarez/null-ls.nvim",
}

function M.config()
	local null_ls = require("null-ls")
	local formatting = null_ls.builtins.formatting
	local augroup = vim.api.nvim_create_augroup("LspFormatting", {})

	null_ls.setup({
		sources = {
			formatting.black,
			formatting.google_java_format,
			formatting.gofmt,
			formatting.ocamlformat.with({
				args = { "--enable-outside-detected-project", "--name", "$FILENAME", "-" },
			}),
			formatting.prettier,
			formatting.rustfmt,
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
end

return M
