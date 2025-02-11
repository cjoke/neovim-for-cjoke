return {
  {
    "nvim-treesitter/nvim-treesitter-textobjects",
    -- after = "nvim-treesitter",
    -- requires = "nvim-treesitter/nvim-treesitter",
  },

  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    event = { "BufReadPre", "BufNewFile" },
    config = function()
      local config = require("nvim-treesitter.configs")
      config.setup({
        auto_install = true,
        highlight = { enable = true },
        indent = { enable = true },

        incremental_selection = {
          enable = true,
          keymaps = {
            init_selection = "<leader>ss",
            node_incremental = "<leader>si",
            scope_incremental = "<leader>sc",
            node_decremental = "<leader>sd",
          },
        },
        textobjects = {

          select = {
            enable = true,
            -- automatically jump forward to textobj, similar to targets.vim
            lookahead = true,

            keymaps = {
              -- you can use the capture groups defined in textobjects.scm
              -- these works in visualmode (charvise)
              ["am"] = "@function.outer",
              ["im"] = "@function.inner",
              ["ac"] = "@class.outer",
              ["ic"] = "@class.inner",
              ["aa"] = "@parameter.outer",
              ["ia"] = "@parameter.inner",
              ["ab"] = "@block.outer",
              ["ib"] = "@block.inner",
              ["as"] = "@statement.outer",
              ["is"] = "@statement.inner",
              ["ax"] = "@attribute.outer",
              ["ix"] = "@attribute.inner",
              ["i/"] = "@comment.inner",
              ["a/"] = "@comment.outer",
              ["i#"] = "@comment.inner",
              ["a#"] = "@comment.outer",
              ["i*"] = "@comment.inner",
              ["a*"] = "@comment.outer",
            },

            selection_modes = {
              ["@parameter.outer"] = "v", -- charwise
              ["@function.outer"] = "v", -- linewise
              ["@class.outer"] = "<c-v>", -- blockwise
            },

            include_surrounding_whitespace = true,
          },

          move = {
            enable = true,
            set_jumps = true, -- whether to set jumps in the jumplist
            goto_next_start = {
              ["]m"] = "@function.outer",
              ["]c"] = "@class.outer",
              ["]a"] = "@parameter.outer",
              ["]b"] = "@block.outer",
              ["]s"] = "@statement.outer",
              ["]x"] = "@attribute.outer",
              ["]/"] = "@comment.outer",
              ["]#"] = "@comment.outer",
              ["]*"] = "@comment.outer",
            },
            goto_next_end = {
              ["]M"] = "@function.outer",
              ["]C"] = "@class.outer",
              ["]A"] = "@parameter.outer",
              ["]B"] = "@block.outer",
              ["]S"] = "@statement.outer",
              ["]X"] = "@attribute.outer",
              ["]?"] = "@comment.outer",
            },
            goto_previous_start = {
              ["[m"] = "@function.outer",
              ["[c"] = "@class.outer",
              ["[a"] = "@parameter.outer",
              ["[b"] = "@block.outer",
              ["[s"] = "@statement.outer",
              ["[x"] = "@attribute.outer",
              ["[/"] = "@comment.outer",
              ["[#"] = "@comment.outer",
              ["[*"] = "@comment.outer",
            },
            goto_previous_end = {
              ["[M"] = "@function.outer",
              ["[C"] = "@class.outer",
              ["[A"] = "@parameter.outer",
              ["[B"] = "@block.outer",
              ["[S"] = "@statement.outer",
              ["[X"] = "@attribute.outer",
              ["[?"] = "@comment.outer",
            },
          },
        },
      })
      local ts_repeat_move = require("nvim-treesitter.textobjects.repeatable_move")
      local keymap = vim.keymap.set
      -- vim way: ; goes to the direction you were moving.
      keymap({ "n", "x", "o" }, ";", ts_repeat_move.repeat_last_move)
      keymap({ "n", "x", "o" }, ",", ts_repeat_move.repeat_last_move_opposite)

      -- optionally, make builtin f, f, t, t also repeatable with ; and ,
      keymap({ "n", "x", "o" }, "f", ts_repeat_move.builtin_f)
      keymap({ "n", "x", "o" }, "F", ts_repeat_move.builtin_F)
      keymap({ "n", "x", "o" }, "t", ts_repeat_move.builtin_t)
      keymap({ "n", "x", "o" }, "T", ts_repeat_move.builtin_T)
    end,
  },
}
