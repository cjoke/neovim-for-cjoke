return {
  {
    "cjoke/CopilotChat.nvim",
    opts = {
      show_help = "yes",      -- Show help text for CopilotChatInPlace, default: yes
      debug = true,          -- Enable or disable debug mode, the log file will be in ~/.local/state/nvim/CopilotChat.nvim.log
      disable_extra_info = "no", -- Disable extra information (e.g: system prompt) in the response.
    },
    build = function()
      vim.notify("Please update the remote plugins by running ':UpdateRemotePlugins', then restart Neovim.")
    end,
    event = "VeryLazy",
    keys = {
      { "<leader>ce",  "<cmd>CopilotChatExplain<cr>",   desc = "CopilotChat - Explain code" },
      { "<leader>cg",  "<cmd>CopilotChatTests<cr>",     desc = "CopilotChat - Generate tests" },
      { "<leader>cr",  "<cmd>CopilotChatReview<cr>",    desc = "CopilotChat - Review code" },
      { "<leader>cR",  "<cmd>CopilotChatRefactor<cr>",  desc = "CopilotChat - Refactor code" },
      { "<leader>cs",  "<cmd>CopilotChatSummarize<cr>", desc = "CopilotChat - Summarize text" },
      { "<leader>ccs", "<cmd>CopilotChatSpelling<cr>",  desc = "CopilotChat - Correct spelling" },
      { "<leader>ccw", "<cmd>CopilotChatWording<cr>",   desc = "CopilotChat - Improve wording" },
      { "<leader>ccc", "<cmd>CopilotChatConcise<cr>",   desc = "CopilotChat - Make text concise" },
      { "<leader>ci",  "<cmd>CopilotChatInPlace<cr>",   desc = "CopilotChat - Chat in place" },
      { "<leader>cv",  "<cmd>CopilotChatVisual<cr>",    desc = "CopilotChat - Chat in visual mode" },
      {
        "<leader>ccv",
        ":CopilotChatVisual",
        mode = "x",
        desc = "+CopilotChat - Open in vertical split",
      },
      {
        "<leader>ccx",
        ":CopilotChatInPlace<cr>",
        mode = "x",
        desc = "+CopilotChat - Run in-place code",
      },
    },
  },
}
