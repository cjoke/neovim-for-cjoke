-- Keymappings for neovim
-- I try to keep everything here. but thats not always the case

local opts = { noremap = true, silent = true }
local keymap = vim.keymap.set

-- rename CopilotChat to CC
vim.cmd('command! -nargs=* CC CopilotChat <args>')

-- Git stuff
keymap("n", "<leader>Gs", ":G<CR>", opts)
keymap("n", "<leader>Gc", ":G commit<CR>", opts)
keymap("n", "<leader>Gd", ":G diff<CR>", opts)
keymap("n", "<leader>Gp", ":G pull<CR>", opts)
keymap("n", "<leader>GP", ":G push<CR>", opts)
keymap("n", "<leader>Gf", ":G fetch<CR>", opts)
keymap("n", "<leader>Gm", ":G merge<CR>", opts)
keymap("n", "<leader>Gt", ":G tag<CR>", opts)
keymap("n", "<leader>Ga", ":G add %<CR>", opts)
keymap("n", "<leader>Gb", ":G blame<CR>", opts)

-- Notes/neorg
keymap("n", "<leader>ng", ":Neorg workspace general", opts)
keymap("n", "<leader>nd", ":Neorg workspace develop", opts)
keymap("n", "<leader>nm", ":Neorg workspace music", opts)

-- Translate text to norwegian
keymap("v", "<leader>tt", ":Translate no<CR>", opts)
keymap("n", "<leader>tt", ":Translate no<CR>", opts)

-- clear search highlight on escape
keymap("n", "<leader>h", ":nohlsearch<CR>")

-- Global lsp keymaps
keymap("n", "<space>do", vim.diagnostic.open_float)
keymap("n", "[d", vim.diagnostic.goto_prev)
keymap("n", "]d", vim.diagnostic.goto_next)
keymap("n", "<space>ds", vim.diagnostic.setloclist)

-- Navigate vim panes better
keymap("n", "<M-k>", ":wincmd k<CR>", opts)
keymap("n", "<M-j>", ":wincmd j<CR>", opts)
keymap("n", "<M-h>", ":wincmd h<CR>", opts)
keymap("n", "<M-l>", ":wincmd l<CR>", opts)

-- Move lines up and down in visual mode
keymap("v", "J", ":m '>+1<CR>gv=gv")
keymap("v", "K", ":m '<-2<CR>gv=gv")

-- move intentation left and right
keymap("v", "<", "<gv", opts)
keymap("v", ">", ">gv", opts)

-- delete current buffer
keymap("n", "<leader>q", "<cmd>bd!<CR>", opts)

-- buffer previous/next
keymap("n", "<leader>bp", "<cmd>bprevious<CR>", opts)
keymap("n", "<leader>bn", "<cmd>bnext<CR>", opts)

-- Resize windows/buffers with arrows
keymap("n", "<C-Up>", ":resize +2<CR>", opts)
keymap("n", "<C-Down>", ":resize -2<CR>", opts)
keymap("n", "<C-Left>", ":vertical resize -2<CR>", opts)
keymap("n", "<C-Right>", ":vertical resize +2<CR>", opts)

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

-- Zen Mode
vim.api.nvim_set_keymap("n", "<leader>zn", ":TZNarrow<CR>", {})
vim.api.nvim_set_keymap("v", "<leader>zn", ":'<,'>TZNarrow<CR>", {})
vim.api.nvim_set_keymap("n", "<leader>zf", ":TZFocus<CR>", {})
vim.api.nvim_set_keymap("n", "<leader>zm", ":TZMinimalist<CR>", {})
vim.api.nvim_set_keymap("n", "<leader>za", ":TZAtaraxis<CR>", {})

-- Symbols-outline
keymap("n", "<leader>so", ":SymbolsOutline<CR>", opts)

-- split windows
keymap("n", "<leader>|h", ":split<CR>", opts)
keymap("n", "<leader>|v", ":vsplit<CR>", opts)

