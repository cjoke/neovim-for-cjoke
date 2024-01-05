return {
	"nvim-neo-tree/neo-tree.nvim",
	branch = "v3.x",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-tree/nvim-web-devicons",
		"MunifTanjim/nui.nvim",
	},
	config = function()
		local keymap = vim.keymap.set
		keymap("n", "<leader>e", ":Neotree filesystem toggle left<CR>", {})
		keymap("n", "<leader>bf", ":Neotree buffers reveal float<CR>", {})
	end,
}
