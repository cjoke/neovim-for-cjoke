return {
  {
    "folke/which-key.nvim",
    event = "VeryLazy",
    init = function()
      vim.o.timeout = true
      vim.o.timeoutlen = 300
    end,
    opts = function(_, opts)
      local wk = require("which-key")
      wk.register({
        ["<leader>"] = {
          -- This is kinda like a index page for the keybindings
          -- I use it as extention for the keymappins.lua File
          -- to show/make the group description instead of the +prefix
          -- I also extend the functionality of the keymappings.lua file
          f = {
            name = "+File stuff/TeleScope",
            n = { "<cmd>enew<cr>", "New File" },
          },
          G = {
            name = "+Git tools",
          },
          b = {
            name = "+Buffer stuff",
            l = { "<cmd>ls<cr>", "List Buffers" },
          },
          c = {
            name = "+Copilot",
          },
          cc = {
            name = "+Copilot",
          },
          d = {
            name = "+Dap tools",
          },
          n = {
            name = "+Neorg",
          },
          w = {
            name = "+Workspaces",
          },
          z = {
            name = "+Zen mode",
          },
          g = {
            name = "+Go to/format",
          },
        },
      })
      -- set some opts if you want
      -- ie. `opts.layout ...` or something
      return opts
    end,
  },
}
