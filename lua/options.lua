-- set mapleader to space
vim.g.mapleader = " "
vim.g.python3_host_prog = "$HOME/.pyenv/versions/nvim/bin/python"

-- Set up copilot config
vim.g.copilot_no_tab_maps = true
vim.g.copilot_disable_mappings = 1
vim.g.copilot_filetypes = {
	["*"] = false,
	["python"] = true,
	["c"] = true,
	["cpp"] = true,
	["bash"] = true,
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
vim.opt.encoding = 'utf-8'
vim.opt.fileencoding = 'utf-8'
-- Set up codeium config
-- disable codeium default bindings
-- vim.g.codeium_disable_bindings = 1
-- set codeium filetypes to enable/disable
-- vim.g.codeium_filetypes = {
-- 	["*"] = false,
-- 	["python"] = true,
-- 	["c"] = true,
-- 	["cpp"] = true,
-- }

-- Set line numbers
vim.wo.number = true
vim.wo.relativenumber = true
