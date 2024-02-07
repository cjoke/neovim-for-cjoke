return {
	{
		"mfussenegger/nvim-dap",
		dependencies = {
			-- "leoluz/nvim-dap-go",
			"rcarriga/nvim-dap-ui",
			"mfussenegger/nvim-dap-python",
		},
		config = function()
			require("dapui").setup()
			-- require("dap-go").setup()
      require("dap-python").setup()

			local dap, dapui = require("dap"), require("dapui")

			dap.listeners.before.attach.dapui_config = function()
				dapui.open()
			end
			dap.listeners.before.launch.dapui_config = function()
				dapui.open()
			end
			dap.listeners.before.event_terminated.dapui_config = function()
				dapui.close()
			end
			dap.listeners.before.event_exited.dapui_config = function()
				dapui.close()
			end
      local keymap = vim.keymap.set
			keymap("n", "<Leader>dt", ":DapToggleBreakpoint<CR>")
			keymap("n", "<Leader>dc", ":DapContinue<CR>")
			keymap("n", "<Leader>dx", ":DapTerminate<CR>")
			keymap("n", "<Leader>do", ":DapStepOver<CR>")
      -- from configuration example in :help dap
      keymap('n', '<F5>', function() require('dap').continue() end)
      keymap('n', '<F10>', function() require('dap').step_over() end)
      keymap('n', '<F11>', function() require('dap').step_into() end)
      keymap('n', '<F12>', function() require('dap').step_out() end)
      keymap({'n', 'v'}, '<Leader>dh', function()
        require('dap.ui.widgets').hover()
      end)
      keymap({'n', 'v'}, '<Leader>dp', function()
        require('dap.ui.widgets').preview()
      end)
      keymap('n', '<Leader>df', function()
        local widgets = require('dap.ui.widgets')
        widgets.centered_float(widgets.frames)
      end)
      keymap('n', '<Leader>ds', function()
        local widgets = require('dap.ui.widgets')
        widgets.centered_float(widgets.scopes)
      end)
		end,
	},
}
