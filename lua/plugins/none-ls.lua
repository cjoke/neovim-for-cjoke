return {
	"nvimtools/none-ls.nvim",
	config = function()
		local null_ls = require("null-ls")
		null_ls.setup({
			sources = {
				null_ls.builtins.formatting.black,
				null_ls.builtins.formatting.stylua,
				null_ls.builtins.formatting.prettier,
				null_ls.builtins.diagnostics.mypy,
				null_ls.builtins.diagnostics.ruff,
			},
		})
		local keymap = vim.keymap.set
		keymap("n", "<leader>gf", vim.lsp.buf.format, { desc = "[G]o [F]ormat" })
	end,
}
