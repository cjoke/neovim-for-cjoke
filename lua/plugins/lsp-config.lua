return {
  {
    "williamboman/mason.nvim",
    lazy = false,
    config = function()
      require("mason").setup()
    end,
  },
  {
    "williamboman/mason-lspconfig.nvim",
    lazy = false,
    opts = {
      auto_install = true,
    },
  },
  {
    "neovim/nvim-lspconfig",
    lazy = false,
    dependencies = {
      { "hrsh7th/cmp-cmdline" },
    },
    config = function()
      local capabilities = require("cmp_nvim_lsp").default_capabilities()

      local lspconfig = require("lspconfig")
      lspconfig.tsserver.setup({
        capabilities = capabilities,
      })
      lspconfig.clangd.setup({
        capabilities = capabilities,
      })
      lspconfig.html.setup({
        capabilities = capabilities,
      })
      lspconfig.lua_ls.setup({
        cabilities = capabilities,
      })
      lspconfig.pyright.setup({
        cabilities = capabilities,
      })
      local keymap = vim.keymap.set
      keymap("n", "K", vim.lsp.buf.hover, { desc = "Show documentation" })
      keymap("n", "<leader>gd", vim.lsp.buf.definition, { desc = "Go to Definition" })
      keymap("n", "<leader>gr", vim.lsp.buf.references, { desc = "Go to Reference" })
      keymap("n", "<leader>ca", vim.lsp.buf.code_action, { desc = "Code Action" })
      keymap("n", "<leader>rn", vim.lsp.buf.rename, { desc = "Rename" })
      keymap("n", "<leader>gf", vim.lsp.buf.format, { desc = "Go Format" })
      vim.api.nvim_create_autocmd("LspAttach", {
        group = vim.api.nvim_create_augroup("UserLspConfig", {}),
        callback = function(ev)

          -- Enable completion triggered by <c-x><c-o>
          vim.bo[ev.buf].omnifunc = "v:lua.vim.lsp.omnifunc"

          -- Buffer local mappings.
          local opts = { buffer = ev.buf }
          keymap("n", "gD", vim.lsp.buf.declaration, opts)
          keymap("n", "gd", vim.lsp.buf.definition, opts)
          keymap("n", "K", vim.lsp.buf.hover, opts)
          keymap("n", "gi", vim.lsp.buf.implementation, opts)
          keymap("n", "<space>wa", vim.lsp.buf.add_workspace_folder, opts)
          keymap("n", "<space>wr", vim.lsp.buf.remove_workspace_folder, opts)
          keymap("n", "<space>wl", function()
            print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
          end, opts)
          keymap("n", "<space>D", vim.lsp.buf.type_definition, opts)
          keymap("n", "<space>rn", vim.lsp.buf.rename, opts)
          keymap({ "n", "v" }, "<space>ca", vim.lsp.buf.code_action, opts)
          keymap("n", "gr", vim.lsp.buf.references, opts)
          keymap("n", "<space>f", function()
            vim.lsp.buf.format({ async = true })
          end, opts)
        end,
      })

      -- `/` cmdline setup.
      local cmp = require("cmp")
      cmp.setup.cmdline("/", {
        mapping = cmp.mapping.preset.cmdline(),
        sources = {
          { name = "buffer" },
        },
      })

      -- `:` cmdline setup.
      cmp.setup.cmdline(":", {
        mapping = cmp.mapping.preset.cmdline(),
        sources = cmp.config.sources({
          { name = "path" },
          {
            name = "cmdline",
            option = {
              ignore_cmds = { "Man", "!" },
            },
          },
        }),
      })
    end,
  },
}
