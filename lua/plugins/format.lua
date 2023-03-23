local M = {
	"jose-elias-alvarez/null-ls.nvim",
	event = "BufReadPost",
}

function M.config()
	local null_ls = require("null-ls")
	local formatting = null_ls.builtins.formatting
	local augroup = vim.api.nvim_create_augroup("LspFormatting", {})
	null_ls.setup({
		sources = {
			formatting.black,
			formatting.gofmt,
			formatting.prettier.with({ extra_filetypes = { "svelte" } }),
			formatting.rustfmt,
			formatting.stylua,
		},
		-- Format on save
		on_attach = function(current_client, bufnr)
			if current_client.supports_method("textDocument/formatting") then
				vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
				vim.api.nvim_create_autocmd("BufWritePre", {
					group = augroup,
					buffer = bufnr,
					callback = function()
						vim.lsp.buf.format({
							filter = function(client)
								-- Only use null-ls for formatting instead of lsp server
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
