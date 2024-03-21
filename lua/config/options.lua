-- set mapleader to space
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- vim.loader.enable()
-- what env neovim would run in.
vim.g.python3_host_prog = "$HOME/.pyenv/versions/3.12.2/bin/python3"

-- In your init.lua file
vim.cmd [[
  autocmd FileType python setlocal foldmethod=syntax
  autocmd FileType python setlocal foldlevel=1
]]
-- set TMPDIR user env
-- vim.env.TMPDIR = "~/.cache/nvim/"
vim.opt.showtabline = 1
vim.opt.expandtab = true
vim.opt.tabstop = 2
vim.opt.softtabstop = 2
vim.opt.shiftwidth = 2
vim.opt.timeoutlen = 300
vim.opt.swapfile = false
-- sync with system clipboard
vim.opt.clipboard = "unnamedplus"
-- unlimited undo
vim.opt.undofile = true
vim.opt.updatetime = 100
vim.opt.termguicolors = true
vim.opt.cursorline = true
vim.opt.shiftwidth = 2
vim.opt.sidescrolloff = 8
vim.opt.scrolloff = 6
vim.opt.guifont = "monospace:h17"
vim.opt.encoding = 'utf-8'
vim.opt.fileencoding = 'utf-8'

-- set line numbers globally
vim.opt.number = true
vim.opt.relativenumber = true
-- Set line numbers on buffers
vim.wo.number = true
vim.wo.relativenumber = true
