local lspconfig_status, lspconfig = pcall(require, "lspconfig")
if not lspconfig_status then
	return
end

local cmp_nvim_lsp_status, cmp_nvim_lsp = pcall(require, "cmp_nvim_lsp")
if not cmp_nvim_lsp_status then
	return
end

local typescript_setup, typescript = pcall(require, "typescript")
if not typescript_setup then
	return
end

local k = vim.keymap

-- enable keymaps for available lsp server
local on_attach = function(client, bufnr)
	local opts = { noremap = true, silent = true, buffer = bufnr }

	k.set("n", "gf", "<cmd>Lspsaga lsp_finder<CR>", opts) -- show definition, references
	k.set("n", "gD", "<Cmd>lua vim.lsp.buf.declaration()<CR>", opts) -- go to declaration
	k.set("n", "gd", "<cmd>Lspsaga peek_definition<CR>", opts) -- see definition and make edits in window
	k.set("n", "gi", "<cmd>lua vim.lsp.buf.implementation()<CR>", opts) -- go to implementation
	k.set("n", "<leader>ca", "<cmd>Lspsaga code_action<CR>", opts) -- see available code actions
	k.set("n", "<leader>rn", "<cmd>Lspsaga rename<CR>", opts) -- smart rename
	k.set("n", "<leader>d", "<cmd>Lspsaga show_line_diagnostics<CR>", opts) -- show  diagnostics for line
	k.set("n", "<leader>d", "<cmd>Lspsaga show_cursor_diagnostics<CR>", opts) -- show diagnostics for cursor
	k.set("n", "[d", "<cmd>Lspsaga diagnostic_jump_prev<CR>", opts) -- jump to previous diagnostic in buffer
	k.set("n", "]d", "<cmd>Lspsaga diagnostic_jump_next<CR>", opts) -- jump to next diagnostic in buffer
	k.set("n", "K", "<cmd>Lspsaga hover_doc<CR>", opts) -- show documentation for what is under cursor
	k.set("n", "<leader>o", "<cmd>LSoutlineToggle<CR>", opts) -- see outline on right hand side

	if client.name == "tsserver" then
		k.set("n", "<leader>rf", ":TypescriptRenameFile<CR>") -- rename file and update imports
		k.set("n", "<leader>oi", ":TypescriptOrganizeImports<CR>") -- organize imports
		k.set("n", "<leader>ru", ":TypescriptRemoveUnused<CR>") -- remove unused variables
	end
end

local capabilities = cmp_nvim_lsp.default_capabilities()

local signs = { Error = " ", Warn = " ", Hint = "ﴞ ", Info = " " }
for type, icon in pairs(signs) do
	local hl = "DiagnosticSign" .. type
	vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
end

lspconfig["cssls"].setup({
	capabilities = capabilities,
	on_attach = on_attach,
})

lspconfig["html"].setup({
	capabilities = capabilities,
	on_attach = on_attach,
})

lspconfig["jdtls"].setup({
	capabilities = capabilities,
	on_attach = on_attach,
})

lspconfig["gopls"].setup({
	capabilities = capabilities,
	on_attach = on_attach,
})

lspconfig["ocamllsp"].setup({
	capabilities = capabilities,
	on_attach = on_attach,
})

lspconfig["pyright"].setup({
	capabilities = capabilities,
	on_attach = on_attach,
})

lspconfig["sumneko_lua"].setup({
	capabilities = capabilities,
	on_attach = on_attach,
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

lspconfig["tailwindcss"].setup({
	capabilities = capabilities,
	on_attach = on_attach,
})

typescript.setup({
	server = {
		capabilities = capabilities,
		on_attach = on_attach,
	},
})
