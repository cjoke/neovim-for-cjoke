return {
	{
		"williamboman/mason.nvim",
		lazy = false,
		config = function()
			require("mason").setup()
		end,
	},
	{
		"williamboman/mason-lspconfig.nvim",
		lazy = false,
		opts = {
			auto_install = true,
		},
	},
	{
		"neovim/nvim-lspconfig",
		lazy = false,
		config = function()
			local capabilities = require("cmp_nvim_lsp").default_capabilities()

			local lspconfig = require("lspconfig")
			lspconfig.tsserver.setup({
				capabilities = capabilities,
			})
      lspconfig.clangd.setup({
        capabilities = capabilities,
      })
			lspconfig.html.setup({
				capabilities = capabilities,
			})
			lspconfig.lua_ls.setup({
			  cabilities = capabilities,
			})
			lspconfig.pyright.setup({
			  cabilities = capabilities,
			})
			local keymap = vim.keymap.set
			keymap("n", "K", vim.lsp.buf.hover, { desc = "Show documentation" })
			keymap("n", "<leader>gd", vim.lsp.buf.definition, { desc = "Go to Definition" })
			keymap("n", "<leader>gr", vim.lsp.buf.references, { desc = "Go to Reference" })
			keymap("n", "<leader>ca", vim.lsp.buf.code_action, { desc = "Code Action" })
		end,
	},
}
