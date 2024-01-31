return {
  {
    "nvim-telescope/telescope-ui-select.nvim",
  },
  {
    "nvim-telescope/telescope.nvim",
    tag = "0.1.5",
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function()
      require("telescope").setup({
        defaults = {
          prompt_prefix = '🔭 ', -- prefix for input prompt

          winblend = 5,

          layout_strategy = 'flex',
          layout_config = {
            horizontal = {
              preview_width = 0.6,
            },
            vertical = {
              preview_height = 0.5,
            },
            flex = {
              horizontal = {
                preview_width = 0.9,
              },
            },
          },

          selection_strategy = "reset",
          sorting_strategy = "descending",
          scroll_strategy = "cycle",
          color_devicons = true,

          use_less = true,

          set_env = { ['COLORTERM'] = 'truecolor' },

          file_previewer = require 'telescope.previewers'.vim_buffer_cat.new,
          grep_previewer = require 'telescope.previewers'.vim_buffer_vimgrep.new,
          qflist_previewer = require 'telescope.previewers'.vim_buffer_qflist.new,

          -- Developer configurations: Not meant for general override
          buffer_previewer_maker = require 'telescope.previewers'.buffer_previewer_maker
        },
        extensions = {
          ["ui-select"] = {
            require("telescope.themes").get_dropdown({}),
          },
        },
      })
      local builtin = require("telescope.builtin")
      local keymap = vim.keymap.set
      keymap("n", "<leader>fg", builtin.live_grep, { desc = "Live Grep" })
      keymap("n", "<leader>fb", builtin.buffers, { desc = "Files Buffers" })
      keymap("n", "<leader>fh", builtin.help_tags, { desc = "Files Help" })
      keymap("n", "<leader>fd", builtin.diagnostics, { desc = "Files Diagnostics" })
      keymap("n", "<leader>fc", builtin.commands, { desc = "Files Commands" })
      keymap("n", "<leader>fk", builtin.keymaps, { desc = "Files Keymaps" })
      keymap("n", "<leader>fo", builtin.oldfiles, { desc = "Files Oldfiles" })
      keymap("n", "<leader>fm", builtin.man_pages, { desc = "Files Manpages" })
      keymap("n", "<leader>ff", builtin.find_files, { desc = "Find Files" })
      keymap("n", "<leader>Gs", builtin.git_status, { desc = "Git Status" })
      keymap("n", "<leader>fw", builtin.grep_string, { desc = "Grep Word/strings" })
      keymap("n", "<leader>fl", builtin.current_buffer_fuzzy_find, { desc = "Find Lines current buffer" })
      keymap("n", "<leader>ft", builtin.tags, { desc = "Files Tags" })
    end,
  },
}
