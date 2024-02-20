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
          prompt_prefix = "🔭 ", -- prefix for input prompt

          winblend = 5,

          layout_strategy = "flex",
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

          set_env = { ["COLORTERM"] = "truecolor" },

          file_previewer = require("telescope.previewers").vim_buffer_cat.new,
          grep_previewer = require("telescope.previewers").vim_buffer_vimgrep.new,
          qflist_previewer = require("telescope.previewers").vim_buffer_qflist.new,

          -- Developer configurations: Not meant for general override
          buffer_previewer_maker = require("telescope.previewers").buffer_previewer_maker,
        },
        extensions = {
          ["ui-select"] = {
            require("telescope.themes").get_dropdown({}),
          },
        },
      })
      local builtin = require("telescope.builtin")
      local keymap = vim.api.nvim_set_keymap
      keymap(
        "n",
        "<leader>fg",
        ":lua builtin.live_grep()<CR>",
        { noremap = true, silent = true }
      )
      keymap(
        "n",
        "<leader>fb",
        ":lua builtin.buffers()<CR>",
        { noremap = true, silent = true }
      )
      keymap(
        "n",
        "<leader>fh",
        ":lua builtin.help_tags()<CR>",
        { noremap = true, silent = true }
      )
      keymap(
        "n",
        "<leader>fd",
        ":lua builtin.diagnostics()<CR>",
        { noremap = true, silent = true }
      )
      keymap(
        "n",
        "<leader>fc",
        ":lua builtin.commands()<CR>",
        { noremap = true, silent = true }
      )
      keymap(
        "n",
        "<leader>fk",
        ":lua builtin.keymaps()<CR>",
        { noremap = true, silent = true }
      )
      keymap(
        "n",
        "<leader>fo",
        ":lua builtin.oldfiles()<CR>",
        { noremap = true, silent = true }
      )
      keymap(
        "n",
        "<leader>fm",
        ":lua builtin.man_pages()<CR>",
        { noremap = true, silent = true }
      )
      keymap(
        "n",
        "<leader>ff",
        ":lua builtin.find_files()<CR>",
        { noremap = true, silent = true }
      )
      keymap(
        "n",
        "<leader>Gs",
        ":lua builtin.git_status()<CR>",
        { noremap = true, silent = true }
      )
      keymap(
        "n",
        "<leader>fw",
        ":lua builtin.grep_string()<CR>",
        { noremap = true, silent = true }
      )
      keymap(
        "n",
        "<leader>fl",
        ":lua builtin.current_buffer_fuzzy_find()<CR>",
        { noremap = true, silent = true }
      )
      keymap(
        "n",
        "<leader>ft",
        ":lua builtin.tags()<CR>",
        { noremap = true, silent = true }
      )
      keymap(
        "n",
        "<leader>fr",
        ":lua builtin.lsp_references()<CR>",
        { noremap = true, silent = true }
      )
    end,
  },
}
