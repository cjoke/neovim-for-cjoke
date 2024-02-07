return {
	{
		"cjoke/CopilotChat.nvim",
		opts = {
			show_help = "yes", -- Show help text for CopilotChatInPlace, default: yes
			debug = false, -- Enable or disable debug mode, the log file will be in ~/.local/state/nvim/CopilotChat.nvim.log
			disable_extra_info = "no", -- Disable extra information (e.g: system prompt) in the response.
		},
		build = function()
			vim.notify("Please update the remote plugins by running ':UpdateRemotePlugins', then restart Neovim.")
		end,
		event = "VeryLazy",
		keys = {
			{ "<leader>cce", "<cmd>CopilotChatExplain<cr>", desc = "CopilotChat - Explain code" },
			{ "<leader>cct", "<cmd>CopilotChatTests<cr>", desc = "CopilotChat - Generate tests" },
      { "<leader>ce", "<cmd>CopilotChatExplain<cr>",   desc = "CopilotChat - Explain code" },
      { "<leader>ct", "<cmd>CopilotChatTests<cr>",     desc = "CopilotChat - Generate tests" },
      { "<leader>cr", "<cmd>CopilotChatReview<cr>",    desc = "CopilotChat - Review code" },
      { "<leader>cR", "<cmd>CopilotChatRefactor<cr>",  desc = "CopilotChat - Refactor code" },
      { "<leader>cs", "<cmd>CopilotChatSummarize<cr>", desc = "CopilotChat - Summarize text" },
      { "<leader>cS", "<cmd>CopilotChatSpelling<cr>",  desc = "CopilotChat - Correct spelling" },
      { "<leader>cw", "<cmd>CopilotChatWording<cr>",   desc = "CopilotChat - Improve wording" },
      { "<leader>cc", "<cmd>CopilotChatConcise<cr>",   desc = "CopilotChat - Make text concise" },
			{
				"<leader>ccv",
				":CopilotChatVisual",
				mode = "x",
				desc = "CopilotChat - Open in vertical split",
			},
			{
				"<leader>ccx",
				":CopilotChatInPlace<cr>",
				mode = "x",
				desc = "CopilotChat - Run in-place code",
			},
		},
	},
}
