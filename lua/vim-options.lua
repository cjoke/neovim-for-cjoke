vim.cmd("set expandtab")
vim.cmd("set tabstop=2")
vim.cmd("set softtabstop=2")
vim.cmd("set shiftwidth=2")
vim.cmd("set timeoutlen=300")
vim.g.mapleader = " "

local opts = { noremap = true, silent = true }
local keymap = vim.keymap.set

-- Navigate vim panes better
keymap('n', '<c-k>', ':wincmd k<CR>', opts)
keymap('n', '<c-j>', ':wincmd j<CR>', opts)
keymap('n', '<c-h>', ':wincmd h<CR>', opts)
keymap('n', '<c-l>', ':wincmd l<CR>', opts)


-- Stay in indent mode
keymap("v", "<", "<gv", opts)
keymap("v", ">", ">gv", opts)

-- delete current buffer
keymap("n", "Q", "<cmd>bdelete!<CR>", opts)
keymap("n", "<leader>c", "<cmd>bd!<CR>", opts)

-- telescope bufferlist
vim.api.nvim_set_keymap(
  "n",
  "<leader>b",
  "<cmd>lua require('telescope.builtin').buffers(require('telescope.themes').get_dropdown{previewer = false, initial_mode='normal'})<cr>",
  opts
)


-- Resize windows/buffers with arrows
keymap("n", "<C-Up>", ":resize -2<CR>", opts)
keymap("n", "<C-Down>", ":resize +2<CR>", opts)
keymap("n", "<C-Left>", ":vertical resize +2<CR>", opts)
keymap("n", "<C-Right>", ":vertical resize -2<CR>", opts)

-- move vertically up/down easier and center cursor
keymap("n", "<c-j>", "<c-d>", opts)
keymap("n", "<c-k>", "<c-u>", opts)
keymap("n", "<c-m>", "<s-m>", opts)


-- keymaps for codeium
keymap('i', '<C-l>', function() return vim.fn['codeium#Accept']() end, { expr = true, silent = true })
keymap('i', '<C-k>', function() return vim.fn['codeium#CycleCompletions'](1) end, { expr = true, silent = true })
keymap('i', '<C-j>', function() return vim.fn['codeium#CycleCompletions'](-1) end, { expr = true, silent = true })
keymap('i', '<C-x>', function() return vim.fn['codeium#Clear']() end, { expr = true, silent = true })


keymap('n', '<leader>h', ':nohlsearch<CR>')
vim.wo.number = true
vim.wo.relativenumber = true
