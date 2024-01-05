-- vim.cmd("set expandtab")
-- vim.cmd("set tabstop=2")
-- vim.cmd("set softtabstop=2")
-- vim.cmd("set shiftwidth=2")
-- vim.cmd("set timeoutlen=300")
-- Set leader key to space

-- set mapleader to space
vim.g.mapleader = " "
vim.g.python3_host_prog = "~/.pyenv/versions/nvim/bin/python"

-- Set up copilot config
vim.g.copilot_no_tab_maps = true
vim.g.copilot_disable_mappings = 1
vim.g.copilot_filetypes = {
	["*"] = false,
	["python"] = true,
	["c"] = true,
	["cpp"] = true,
  -- ["lua"] = true,
  -- markdown is needed for CopilotChat
  ["Markdown"] = true,
}

vim.opt.expandtab = true
vim.opt.tabstop = 2
vim.opt.softtabstop = 2
vim.opt.shiftwidth = 2
vim.opt.timeoutlen = 300

vim.opt.undofile = true
vim.opt.updatetime = 100
vim.opt.termguicolors = true
vim.opt.cursorline = true
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.shiftwidth = 2
vim.opt.sidescrolloff = 8
vim.opt.scrolloff = 0
vim.opt.guifont = "monospace:h17"
vim.opt.title = true
vim.opt.titleold = vim.split(os.getenv("SHELL") or "", "/")[3]
vim.opt.fillchars = vim.opt.fillchars + "eob: "
vim.opt.shortmess:append("c")

-- Set up codeium config
-- disable codeium default bindings
vim.g.codeium_disable_bindings = 1
-- set codeium filetypes to enable/disable
vim.g.codeium_filetypes = {
	["*"] = false,
	["python"] = true,
	["c"] = true,
	["cpp"] = true,
}

-- Set line numbers
vim.wo.number = true
vim.wo.relativenumber = true

-- make keymappings prettier
local opts = { noremap = true, silent = true }
local keymap = vim.keymap.set

-- Navigate vim panes better
keymap("n", "<M-k>", ":wincmd k<CR>", opts)
keymap("n", "<M-j>", ":wincmd j<CR>", opts)
keymap("n", "<M-h>", ":wincmd h<CR>", opts)
keymap("n", "<M-l>", ":wincmd l<CR>", opts)

-- Stay in indent mode
keymap("v", "<", "<gv", opts)
keymap("v", ">", ">gv", opts)

-- delete current buffer
keymap("n", "Q", "<cmd>bdelete!<CR>", opts)
keymap("n", "<leader>c", "<cmd>bd!<CR>", opts)

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

-- clear search highlight on escape
keymap("n", "<leader>h", ":nohlsearch<CR>")
