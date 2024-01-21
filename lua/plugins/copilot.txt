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
    end,
  },
}
