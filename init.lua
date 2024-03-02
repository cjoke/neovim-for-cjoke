local vim = vim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

require("options")
require("keymappings")
require("lazy").setup("plugins")

local cmd = vim.cmd -- to execute Vim commands e.g. cmd('pwd')
local fn = vim.fn   -- to call Vim functions e.g. fn.bufnr()

local M = {}

local function session_file_path()
  local workdir = fn.expand("%:p:h") -- get the directory of the current file
  return workdir .. "/Session.vim"
end

function M.save_session()
  cmd("mksession! " .. session_file_path())
end

function M.restore_session()
  if fn.filereadable(session_file_path()) == 1 then
    cmd("source " .. session_file_path())
  end
end

function M.setup()
  cmd("command! -nargs=0 Mksession lua require('plugins.last-session').save_session()")
  cmd("command! -nargs=0 SourceSession lua require('plugins.last-session').restore_session()")

  cmd("autocmd VimLeave * Mksession")
  cmd("autocmd VimEnter * SourceSession")
end

return M
