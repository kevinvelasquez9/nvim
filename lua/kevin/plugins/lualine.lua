local status, lualine = pcall(require, "lualine")
if not status then
	return
end

local function lsp_name()
	for _, client in ipairs(vim.lsp.get_active_clients()) do
		if client.attached_buffers[vim.api.nvim_get_current_buf()] then
			return client.name
		end
	end
	return "no lsp"
end

lualine.setup({
	options = {
		theme = "gruvbox",
	},
	sections = {
		lualine_x = { "filetype", lsp_name },
	},
})
