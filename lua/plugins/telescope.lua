return {
	{
		"nvim-telescope/telescope-ui-select.nvim",
	},
	{
		"nvim-telescope/telescope-fzf-native.nvim",
		build = "make",
	},
	{
		"nvim-telescope/telescope.nvim",
		branch = "0.1.x",
		dependencies = { "nvim-lua/plenary.nvim" },
		config = function()
			local telescope = require("telescope")
			local previewers = require("telescope.previewers")
			-- local builtin = require("telescope.builtin")
			local keymap = vim.api.nvim_set_keymap

			local telescope_config = {
				defaults = {
					prompt_prefix = "🔭 ",
					height = 0.9,
					width = 0.9,
					preview_cutoff = 120,
					winblend = 5,
					layout_strategy = "flex", -- flex, horizontal, vertical
					layout_config = {
						prompt_position = "bottom",
						mirror = false,
						horizontal = { preview_width = 0.5 },
						vertical = { preview_height = 0.5 },
						flex = { horizontal = { preview_width = 0.5 } },
					},
					selection_strategy = "reset",
					sorting_strategy = "ascending",
					scroll_strategy = "cycle",
					color_devicons = true,
					use_less = false,
					set_env = { ["COLORTERM"] = "truecolor" },
					file_previewer = previewers.vim_buffer_cat.new,
					grep_previewer = previewers.vim_buffer_vimgrep.new,
					qflist_previewer = previewers.vim_buffer_qflist.new,
					buffer_previewer_maker = previewers.buffer_previewer_maker,
				},
				extensions = {
					fzf = {
						fuzzy = true,
						override_generic_sorter = true,
						override_file_sorter = true,
						case_mode = "smart_case",
					},
					["ui-select"] = {
						require("telescope.themes").get_dropdown({}),
					},
				},
			}
			telescope.setup(telescope_config)
			-- telescope.load_extension("fzf")

			local mappings = {
				fg = 'require("telescope.builtin").live_grep',
				fb = 'require("telescope.builtin").buffers',
				fh = 'require("telescope.builtin").help_tags',
				fd = 'require("telescope.builtin").diagnostics',
				fc = 'require("telescope.builtin").commands',
				fk = 'require("telescope.builtin").keymaps',
				fo = 'require("telescope.builtin").oldfiles',
				fm = 'require("telescope.builtin").man_pages',
				ff = 'require("telescope.builtin").find_files',
				Gs = 'require("telescope.builtin").git_status',
				fw = 'require("telescope.builtin").grep_string',
				fl = 'require("telescope.builtin").current_buffer_fuzzy_find',
				ft = 'require("telescope.builtin").tags',
				fr = 'require("telescope.builtin").lsp_references',
				fq = 'require("telescope.builtin").quickfix',
			}

			for k, v in pairs(mappings) do
				keymap("n", "<leader>" .. k, ":lua " .. v .. "()<CR>", { noremap = true, silent = true })
			end
		end,
	},
}
