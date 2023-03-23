vim.cmd([[ let g:neo_tree_remove_legacy_commands = 1 ]])

-- TODO lewis6991/gitsigns
return {
	{
		"windwp/nvim-spectre",
		keys = {
			{
				"<Leader>fr",
				function()
					require("spectre").open()
				end,
				desc = "Find and replace",
			},
		},
	},
	{
		"nvim-telescope/telescope.nvim",
		cmd = "Telescope",
		tag = "0.1.0",
		dependencies = { "nvim-lua/plenary.nvim" },
		keys = {
			{ "<Leader>:", "<cmd>Telescope command_history<cr>", desc = "Command history" },
			{ "<Leader>fc", "<Cmd>Telescope colorscheme<CR>", desc = "Find colorscheme" },
			{ "<Leader>ff", "<Cmd>Telescope find_files<CR>", desc = "Find files" },
			{ "<Leader>fg", "<Cmd>Telescope live_grep<CR>", desc = "Find grep" },
			{ "<Leader>fk", "<Cmd>Telescope keymaps<CR>", desc = "Find keymaps" },
		},
		config = {
			defaults = {
				prompt_prefix = " ",
				selection_caret = " ",
				mappings = {
					i = {
						["<C-k>"] = "move_selection_previous",
						["<C-j>"] = "move_selection_next",
					},
				},
			},
			pickers = { colorscheme = { enable_preview = true } },
		},
	},
	{
		"folke/which-key.nvim",
		event = "VeryLazy",
		config = function()
			require("which-key").register({
				mode = { "n", "v" },
				["g"] = { name = "+goto" },
				["gz"] = { name = "+surround" },
				["]"] = { name = "+next" },
				["["] = { name = "+prev" },
				["<Leader>b"] = { name = "+buffer" },
				["<Leader>c"] = { name = "+code" },
				["<Leader>f"] = { name = "+file/find" },
				["<Leader>g"] = { name = "+git" },
				["<Leader>gh"] = { name = "+hunks" },
				["<Leader>x"] = { name = "+diagnostics/quickfix" },
			})
		end,
	},
	"lewis6991/gitsigns.nvim",
	event = { "BufReadPre", "BufNewFile" },
	opts = {
		signs = {
			add = { text = "+" },
			change = { text = "~" },
			delete = { text = "_" },
			topdelete = { text = "‾" },
			changedelete = { text = "~" },
		},
		on_attach = function(buffer)
			local gs = package.loaded.gitsigns

			local function map(mode, l, r, desc)
				vim.keymap.set(mode, l, r, { buffer = buffer, desc = desc })
			end

      -- stylua: ignore start
      map("n", "]h", gs.next_hunk, "Next hunk")
      map("n", "[h", gs.prev_hunk, "Prev hunk")
      map({ "n", "v" }, "<Leader>ghs", "<Cmd>Gitsigns stage_hunk<CR>", "Stage hunk")
      map({ "n", "v" }, "<Leader>ghr", "<Cmd>Gitsigns reset_hunk<CR>", "Reset hunk")
      map("n", "<Leader>ghS", gs.stage_buffer, "Stage buffer")
      map("n", "<Leader>ghu", gs.undo_stage_hunk, "Undo stage hunk")
      map("n", "<Leader>ghR", gs.reset_buffer, "Reset buffer")
      map("n", "<Leader>ghp", gs.preview_hunk, "Preview hunk")
      map("n", "<Leader>ghb", function() gs.blame_line({ full = true }) end, "Blame line")
      map("n", "<Leader>ghd", gs.diffthis, "Diff this")
      map("n", "<Leader>ghD", function() gs.diffthis("~") end, "Diff this ~")
      map({ "o", "x" }, "ih", ":<C-U>Gitsigns select_hunk<CR>", "GitSigns select hunk")
		end,
	},
	{
		"RRethy/vim-illuminate",
		event = { "BufReadPost", "BufNewFile" },
		opts = { delay = 200 },
		config = function(_, opts)
			require("illuminate").configure(opts)

			local function map(key, dir, buffer)
				vim.keymap.set("n", key, function()
					require("illuminate")["goto_" .. dir .. "_reference"](false)
				end, { desc = dir:sub(1, 1):upper() .. dir:sub(2) .. " Reference", buffer = buffer })
			end

			map("]]", "next")
			map("[[", "prev")

			-- also set it after loading ftplugins, since a lot overwrite [[ and ]]
			vim.api.nvim_create_autocmd("FileType", {
				callback = function()
					local buffer = vim.api.nvim_get_current_buf()
					map("]]", "next", buffer)
					map("[[", "prev", buffer)
				end,
			})
		end,
		keys = {
			{ "]]", desc = "Next Reference" },
			{ "[[", desc = "Prev Reference" },
		},
	},
	{
		"echasnovski/mini.bufremove",
		keys = {
			{
				"<Leader>bx",
				function()
					require("mini.bufremove").delete(0, false)
				end,
				desc = "Delete buffer",
			},
		},
	},
	{
		"nvim-neo-tree/neo-tree.nvim",
		version = "v2.x",
		keys = {
			{ "<Leader>e", "<Cmd>Neotree toggle<CR>", desc = "Toggle file explorer" },
		},
		opts = {
			enable_git_status = false,
			enable_diagnostics = false,
		},
	},
}
