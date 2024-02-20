return {
  {
    'AndrewRadev/splitjoin.vim',
    config = function()
      vim.g.splitjoin_trailing_comma = 1
      vim.g.splitjoin_python_trailing_comma = 1
      vim.g.splitjoin_python_spaces = 1
      vim.g.splitjoin_python_curly_braces = 1
    end,
  }
}
