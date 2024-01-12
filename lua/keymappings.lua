-- make keymappings prettier
local opts = { noremap = true, silent = true }
local keymap = vim.keymap.set

-- clear search highlight on escape
keymap("n", "<leader>h", ":nohlsearch<CR>")

-- Navigate vim panes better
keymap("n", "<M-k>", ":wincmd k<CR>", opts)
keymap("n", "<M-j>", ":wincmd j<CR>", opts)
keymap("n", "<M-h>", ":wincmd h<CR>", opts)
keymap("n", "<M-l>", ":wincmd l<CR>", opts)

-- Stay in indent mode
keymap("v", "<", "<gv", opts)
keymap("v", ">", ">gv", opts)

-- delete current buffer
keymap("n", "<leader>q", "<cmd>bd!<CR>", opts)

-- buffer scrolling
keymap("n", "<leader>bn", "<cmd>bnext<CR>", opts)
keymap("n", "<leader>bp", "<cmd>bprevious<CR>", opts)

-- Resize windows/buffers with arrows
keymap("n", "<C-Up>", ":resize +2<CR>", opts)
keymap("n", "<C-Down>", ":resize -2<CR>", opts)
keymap("n", "<C-Left>", ":vertical resize -2<CR>", opts)
keymap("n", "<C-Right>", ":vertical resize +2<CR>", opts)

-- move vertically up/down easier and center cursor
keymap("n", "<c-j>", "<c-d>", opts)
keymap("n", "<c-k>", "<c-u>", opts)
keymap("n", "<c-m>", "<s-m>", opts)

-- keymaps for codeium
keymap("i", "<C-l>", function()
	return vim.fn["codeium#Accept"]()
end, { expr = true, silent = true })

keymap("i", "<C-k>", function()
	return vim.fn["codeium#CycleCompletions"](1)
end, { expr = true, silent = true })

keymap("i", "<C-j>", function()
	return vim.fn["codeium#CycleCompletions"](-1)
end, { expr = true, silent = true })

keymap("i", "<C-h>", function()
	return vim.fn["codeium#Clear"]()
end, { expr = true, silent = true })


