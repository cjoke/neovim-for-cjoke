return {
  "karb94/neoscroll.nvim",
  config = function()
    require("neoscroll").setup({})
    local t = {}
    -- Syntax: t[keys] = {function, {function arguments}}
    t["<C-u>"] = { "scroll", { "-vim.wo.scroll", "true", "150" } }
    t["<C-d>"] = { "scroll", { "vim.wo.scroll", "true", "150" } }
    t["<C-b>"] = { "scroll", { "-vim.api.nvim_win_get_height(0)", "true", "250" } }
    t["<C-f>"] = { "scroll", { "vim.api.nvim_win_get_height(0)", "true", "250" } }
    t["<C-j>"] = { "scroll", { "-0.10", "false", "100" } }
    t["<C-k>"] = { "scroll", { "0.10", "false", "100" } }
    t["zt"] = { "zt", { "150" } }
    t["zz"] = { "zz", { "150" } }
    t["zb"] = { "zb", { "150" } }

    require("neoscroll.config").set_mappings(t)
  end,
}
