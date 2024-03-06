return {
	{
		"folke/which-key.nvim",
		event = "VeryLazy",
		init = function()
			vim.o.timeout = true
			vim.o.timeoutlen = 300
		end,
		opts = function(_, opts)
			local wk = require("which-key")
			wk.register({
				["<leader>"] = {
					-- This is kinda like a index page for the keybindings
					-- I use it as extention for the keymappins.lua File
					-- to show/make the group description instead of the +prefix
					-- I also extend the functionality of the keymappings.lua file
					f = {
						name = "+File stuff/TeleScope",
						n = { "<cmd>enew<cr>", "New File" },
						g = { "<cmd>Telescope live_grep<cr>", "Live Grep" },
						b = { "<cmd>Telescope buffers<cr>", "Buffers" },
						h = { "<cmd>Telescope help_tags<cr>", "Help Tags" },
						D = { "<cmd>Telescope diagnostics<cr>", "Diagnostics" },
						c = { "<cmd>Telescope commands<cr>", "Commands" },
						k = { "<cmd>Telescope keymaps<cr>", "Keymaps" },
						o = { "<cmd>Telescope oldfiles<cr>", "Old Files" },
						m = { "<cmd>Telescope man_pages<cr>", "Man Pages" },
						f = { "<cmd>Telescope find_files<cr>", "Find Files" },
						s = { "<cmd>Telescope git_status<cr>", "Git Status" },
						w = { "<cmd>Telescope grep_string<cr>", "Grep String" },
						l = { "<cmd>Telescope current_buffer_fuzzy_find<cr>", "Current Buffer Fuzzy Find" },
						t = { "<cmd>Telescope tags<cr>", "Tags" },
						r = { "<cmd>Telescope lsp_references<cr>", "LSP References" },
						d = { "<cmd>Telescope lsp_definitions<cr>", "LSP Definitions" },
					},
					G = {
						name = "+Git tools",
					},
					b = {
						name = "+Buffer stuff",
						l = { "<cmd>ls<cr>", "List Buffers" },
					},
					c = {
						name = "+Copilot",
					},
					cc = {
						name = "+Copilot",
					},
					d = {
						name = "+Dap tools",
					},
					n = {
						name = "+Neorg",
					},
					w = {
						name = "+Workspaces",
					},
					z = {
						name = "+Zen mode",
					},
					g = {
						name = "+Go to/format",
					},
					l = {
						name = "+local stuff",
						s = { "<cmd>LoadSession<CR>", "Load Session" },
					},
				},
			})
			-- set some opts if you want
			-- ie. `opts.layout ...` or something
			return opts
		end,
	},
}
