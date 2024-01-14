return {
	"nvimtools/none-ls.nvim",
	config = function()
		local null_ls = require("null-ls")
		null_ls.setup({
			sources = {
				null_ls.builtins.formatting.black,
				null_ls.builtins.formatting.stylua,
				null_ls.builtins.diagnostics.flake8,
        null_ls.builtins.code_actions.gitsigns,
        null_ls.builtins.formatting.json_tool,
        null_ls.builtins.formatting.pyflyby,
        null_ls.builtins.formatting.reorder_python_imports,
        null_ls.builtins.formatting.xmlformat,
        null_ls.builtins.formatting.yamlfix,
			},
		})
		local keymap = vim.keymap.set
		keymap("n", "<leader>gf", vim.lsp.buf.format, { desc = "Go Format" })
	end,
}
