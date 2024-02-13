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
        ":lua require('telescope.builtin').buffers()<CR>",
        { noremap = true, silent = true }
      )
      keymap(
        "n",
        "<leader>fh",
        ":lua require('telescope.builtin').help_tags()<CR>",
        { noremap = true, silent = true }
      )
      keymap(
        "n",
        "<leader>fd",
        ":lua require('telescope.builtin').diagnostics()<CR>",
        { noremap = true, silent = true }
      )
      keymap(
        "n",
        "<leader>fc",
        ":lua require('telescope.builtin').commands()<CR>",
        { noremap = true, silent = true }
      )
      keymap(
        "n",
        "<leader>fk",
        ":lua require('telescope.builtin').keymaps()<CR>",
        { noremap = true, silent = true }
      )
      keymap(
        "n",
        "<leader>fo",
        ":lua require('telescope.builtin').oldfiles()<CR>",
        { noremap = true, silent = true }
      )
      keymap(
        "n",
        "<leader>fm",
        ":lua require('telescope.builtin').man_pages()<CR>",
        { noremap = true, silent = true }
      )
      keymap(
        "n",
        "<leader>ff",
        ":lua require('telescope.builtin').find_files()<CR>",
        { noremap = true, silent = true }
      )
      keymap(
        "n",
        "<leader>Gs",
        ":lua require('telescope.builtin').git_status()<CR>",
        { noremap = true, silent = true }
      )
      keymap(
        "n",
        "<leader>fw",
        ":lua require('telescope.builtin').grep_string()<CR>",
        { noremap = true, silent = true }
      )
      keymap(
        "n",
        "<leader>fl",
        ":lua require('telescope.builtin').current_buffer_fuzzy_find()<CR>",
        { noremap = true, silent = true }
      )
      keymap(
        "n",
        "<leader>ft",
        ":lua require('telescope.builtin').tags()<CR>",
        { noremap = true, silent = true }
      )
      keymap(
        "n",
        "<leader>fr",
        ":lua require('telescope.builtin').lsp_references()<CR>",
        { noremap = true, silent = true }
      )
    end,
  },
}
