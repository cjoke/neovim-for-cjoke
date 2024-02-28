local IS_DEV = true
return {
  {
    dir = IS_DEV and "~/dev/CopilotChat.nvim" or nil,
    "cjoke/CopilotChat.nvim",
    dependencies = {
      { "github/copilot.vim"},
      { "nvim-telescope/telescope.nvim" }, -- Use telescope for help actions
      { "nvim-lua/plenary.nvim" },
    },
    opts = {
      debug = true, -- Enable or disable debug mode, the log file will be in ~/.local/state/nvim/CopilotChat.nvim.log
    },
    config = function(_, opts)
      local chat = require("CopilotChat")
      local select = require("CopilotChat.select")

      chat.setup(opts)

      -- Restore CopilotChatVisual
      vim.api.nvim_create_user_command("CopilotChatVisual", function(args)
        chat.ask(args.args, { selection = select.visual })
      end, { nargs = "*", range = true })

      -- Restore CopilotChatInPlace (sort of)
      vim.api.nvim_create_user_command("CopilotChatInPlace", function(args)
        chat.ask(args.args, { selection = select.visual, window = { layout = "float" } })
      end, { nargs = "*", range = true })

      -- Restore CopilotChatBuffer
      vim.api.nvim_create_user_command("CopilotChatBuffer", function(args)
        chat.ask(args.args, { selection = select.buffer })
      end, { nargs = "*", range = true })
    end,
    event = "VeryLazy",
    keys = {
      { "<leader>ccb", "<cmd>CopilotChatBuffer ",     desc = "CopilotChat - Chat with current buffer" },
      { "<leader>cce", "<cmd>CopilotChatExplain<cr>", desc = "CopilotChat - Explain code" },
      { "<leader>cct", "<cmd>CopilotChatTests<cr>",   desc = "CopilotChat - Generate tests" },
      {
        "<leader>ccv",
        ":CopilotChatVisual ",
        mode = "x",
        desc = "CopilotChat - Open in vertical split",
      },
      {
        "<leader>ccx",
        ":CopilotChatInPlace<cr>",
        mode = "x",
        desc = "CopilotChat - Run in-place code",
      },
      {
        "<leader>ccf",
        "<cmd>CopilotChatFixDiagnostic<cr>", -- Get a fix for the diagnostic message under the cursor.
        desc = "CopilotChat - Fix diagnostic",
      },
    },
  },
}
