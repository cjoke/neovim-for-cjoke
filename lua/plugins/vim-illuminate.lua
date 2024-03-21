-- highligs related stuff with similar words
return {
  "RRethy/vim-illuminate",
  enabled = false,
  config = function()
    -- Autocommands
    vim.cmd([[
      autocmd BufEnter * lua require("illuminate").configure({})
      autocmd FileType python lua require("illuminate").configure({})
    ]])
  end,
}
