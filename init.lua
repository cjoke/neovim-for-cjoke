local vim = vim
vim.api.nvim_command('autocmd VimEnter * UpdateRemotePlugins')

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

require("config.options")
require("config.keymappings")
require("lazy").setup("plugins")

-- auto save session
require('config.last-session').setupSessionManager()
-- vim.cmd [[ autocmd VimEnter * lua require('config.last-session').restoreLastSession() ]]
