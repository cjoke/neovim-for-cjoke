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

        textobjects = {

          select = {
            enable = true,
            -- Automatically jump forward to textobj, similar to targets.vim
            lookahead = true,

            keymaps = {
              -- You can use the capture groups defined in textobjects.scm
              -- these works in visualmode (charvise)
              ["af"] = "@function.outer",
              ["if"] = "@function.inner",
              ["ac"] = "@class.outer",
              ["ic"] = { query = "@class.inner", desc = "Select inner part of a class region" },
              ["as"] = { query = "@scope", query_group = "locals", desc = "Select language scope" },
            },

            selection_modes = {
              ["@parameter.outer"] = "v", -- charwise
              ["@function.outer"] = "V", -- linewise
              ["@class.outer"] = "<c-v>", -- blockwise
            },

            include_surrounding_whitespace = true,
          },

          move = {
            enable = true,
            set_jumps = true, -- whether to set jumps in the jumplist
          },
        },
      })
      local ts_repeat_move = require("nvim-treesitter.textobjects.repeatable_move")
      local keymap = vim.keymap.set
      -- vim way: ; goes to the direction you were moving.
      keymap({ "n", "x", "o" }, ";", ts_repeat_move.repeat_last_move)
      keymap({ "n", "x", "o" }, ",", ts_repeat_move.repeat_last_move_opposite)

      -- Optionally, make builtin f, F, t, T also repeatable with ; and ,
      keymap({ "n", "x", "o" }, "f", ts_repeat_move.builtin_f)
      keymap({ "n", "x", "o" }, "F", ts_repeat_move.builtin_F)
      keymap({ "n", "x", "o" }, "t", ts_repeat_move.builtin_t)
      keymap({ "n", "x", "o" }, "T", ts_repeat_move.builtin_T)
    end,
  },
}
