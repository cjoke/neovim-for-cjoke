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
        extensions = {
          ["ui-select"] = {
            require("telescope.themes").get_dropdown({}),
          },
        },
      })
      local builtin = require("telescope.builtin")
      local keymap = vim.keymap.set
      keymap("n", "<leader>fg", builtin.live_grep, {desc = "[F]iles [G]rep"})
      keymap("n", "<leader>fb", builtin.buffers, {desc = "[F]iles [B]uffers"})
      keymap("n", "<leader>fh", builtin.help_tags, {desc = "[F]iles [H]elp"})
      keymap("n", "<leader>fd", builtin.diagnostics, {desc = "[F]iles [D]iagnostics"})
      keymap("n", "<leader>fc", builtin.commands, {desc = "[F]iles [C]ommands"})
      keymap("n", "<leader>fk", builtin.keymaps, {desc = "[F]iles [K]eymaps"})
      keymap("n", "<leader>fo", builtin.oldfiles, {desc = "[F]iles [O]ldfiles"})
      keymap("n", "<leader>fm", builtin.man_pages, {desc = "[F]iles [M]anpages"})
      keymap("n", "<leader>Gs", builtin.git_status, {desc = "[G]it [S]tatus"})
      keymap("n", "<leader>Gc", builtin.git_commits, {desc = "[G]it [C]ommits"})
      keymap("n", "<leader>Gb", builtin.git_branches, {desc = "[G]it [B]ranches"})
      keymap("n", "<leader>Ge", builtin.git_bcommits, {desc = "[G]it [B]commits"})
      keymap("n", "<leader>fw", builtin.grep_string, {desc = "[G]rep [W]ord/strings"})
      keymap("n", "<leader>fl", builtin.current_buffer_fuzzy_find, {desc = "[F]ind [L]ines current buffer"})
      keymap("n", "<leader>ft", builtin.tags, {desc = "[F]iles [T]ags"})
    end,
  },
}
