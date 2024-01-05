return {
  {
    "github/copilot.vim",
      config = function()
        vim.keymap.set('i', '<C-l>', 'copilot#Accept("<CR>")', {
          expr = true,
          replace_keycodes = false
        })
        vim.keymap.set('i', '<C-h>', '<Plug>(copilot-dismiss)')
        vim.keymap.set('i', '<C-k>', '<Plug>(copilot-next)')
        vim.keymap.set('i', '<C-j>', '<Plug>(copilot-previous)')
        vim.keymap.set('i', '<C-L>', '<Plug>(copilot-accept-word)')
        vim.g.copilot_no_tab_map = true
    end,
  },
}
