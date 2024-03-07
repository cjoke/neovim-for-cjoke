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
    -- tag = "0.1.5",
    branch = "0.1.x",
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function()
      require("telescope").setup({
        defaults = {
          prompt_prefix = "🔭 ", -- prefix for input prompt
          height = 0.9,
          width = 0.9,
          preview_cutoff = 120,
          winblend = 5,
          layout_strategy = "flex",
          layout_config = {
            prompt_position = "bottom", -- position the prompt at the bottom
            mirror = false,    -- do not flip the layout vertically
            horizontal = {
              preview_width = 0.5, -- (when layout is horizontal)
            },
            vertical = {
              preview_height = 0.5, -- (when layout is vertical)
            },
            flex = {
              horizontal = {
                preview_width = 0.5, -- (when layout is flex and horizontal)
              },
            },
          },

          selection_strategy = "reset",
          sorting_strategy = "ascending", -- "ascending" | "descending" 
          scroll_strategy = "cycle",
          color_devicons = true,

          use_less = false,

          set_env = { ["COLORTERM"] = "truecolor" },

          file_previewer = require("telescope.previewers").vim_buffer_cat.new,
          grep_previewer = require("telescope.previewers").vim_buffer_vimgrep.new,
          qflist_previewer = require("telescope.previewers").vim_buffer_qflist.new,

          -- Developer configurations: Not meant for general override
          buffer_previewer_maker = require("telescope.previewers").buffer_previewer_maker,
        },

        extensions = {
          fzf = {
            fuzzy = true,             -- false will only do exact matching
            override_generic_sorter = true, -- override the generic sorter
            override_file_sorter = true, -- override the file sorter
            case_mode = "smart_case", -- or "ignore_case" or "respect_case"
            -- the default case_mode is "smart_case"
          },
          ["ui-select"] = {
            require("telescope.themes").get_dropdown({}),
          },
        },
      })
      require("telescope").load_extension("fzf")

      local builtin = require("telescope.builtin")
      local keymap = vim.api.nvim_set_keymap
      keymap("n", "<leader>fg", ":lua builtin.live_grep()<CR>", { noremap = true, silent = true })
      keymap("n", "<leader>fb", ":lua builtin.buffers()<CR>", { noremap = true, silent = true })
      keymap("n", "<leader>fh", ":lua builtin.help_tags()<CR>", { noremap = true, silent = true })
      keymap("n", "<leader>fd", ":lua builtin.diagnostics()<CR>", { noremap = true, silent = true })
      keymap("n", "<leader>fc", ":lua builtin.commands()<CR>", { noremap = true, silent = true })
      keymap("n", "<leader>fk", ":lua builtin.keymaps()<CR>", { noremap = true, silent = true })
      keymap("n", "<leader>fo", ":lua builtin.oldfiles()<CR>", { noremap = true, silent = true })
      keymap("n", "<leader>fm", ":lua builtin.man_pages()<CR>", { noremap = true, silent = true })
      keymap("n", "<leader>ff", ":lua builtin.find_files()<CR>", { noremap = true, silent = true })
      keymap("n", "<leader>Gs", ":lua builtin.git_status()<CR>", { noremap = true, silent = true })
      keymap("n", "<leader>fw", ":lua builtin.grep_string()<CR>", { noremap = true, silent = true })
      keymap("n", "<leader>fl", ":lua builtin.current_buffer_fuzzy_find()<CR>", { noremap = true, silent = true })
      keymap("n", "<leader>ft", ":lua builtin.tags()<CR>", { noremap = true, silent = true })
      keymap("n", "<leader>fr", ":lua builtin.lsp_references()<CR>", { noremap = true, silent = true })
      keymap(
        "n",
        "<leader>fq",
        ":lua require('telescope.builtin').quickfix()<CR>",
        { noremap = true, silent = true }
      )
    end,
  },
}
