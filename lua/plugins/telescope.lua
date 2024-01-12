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
      keymap("n", "<leader>fg", builtin.live_grep, {desc = "Files Grep"})
      keymap("n", "<leader>fb", builtin.buffers, {desc = "Files Buffers"})
      keymap("n", "<leader>fh", builtin.help_tags, {desc = "Files Help"})
      keymap("n", "<leader>fd", builtin.diagnostics, {desc = "Files Diagnostics"})
      keymap("n", "<leader>fc", builtin.commands, {desc = "Files Commands"})
      keymap("n", "<leader>fk", builtin.keymaps, {desc = "Files Keymaps"})
      keymap("n", "<leader>fo", builtin.oldfiles, {desc = "Files Oldfiles"})
      keymap("n", "<leader>fm", builtin.man_pages, {desc = "Files Manpages"})
      keymap("n", "<leader>Gs", builtin.git_status, {desc = "Git Status"})
      keymap("n", "<leader>Gc", builtin.git_commits, {desc = "Git Commits"})
      keymap("n", "<leader>Gb", builtin.git_branches, {desc = "Git Branches"})
      keymap("n", "<leader>Ge", builtin.git_bcommits, {desc = "Git Bcommits"})
      keymap("n", "<leader>fw", builtin.grep_string, {desc = "Grep Word/strings"})
      keymap("n", "<leader>fl", builtin.current_buffer_fuzzy_find, {desc = "Find Lines current buffer"})
      keymap("n", "<leader>ft", builtin.tags, {desc = "Files Tags"})
    end,
  },
}
