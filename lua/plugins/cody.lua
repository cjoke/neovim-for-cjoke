return {
  {
    "sourcegraph/sg.nvim",
    enabled = false,
    config = function()
     require("sg").setup({})
    end,
    dependencies = { "nvim-lua/plenary.nvim" },
    -- If you have a recent version of lazy.nvim, you don't need to add this!
    build = "nvim -l build/init.lua",
  },
}
