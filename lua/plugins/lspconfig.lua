-- ~/.config/nvim/lua/plugins/lspconfig.lua

return {
  {
    "neovim/nvim-lspconfig",
    dependencies = {
      "williamboman/mason.nvim",
      "williamboman/mason-lspconfig.nvim",
      "hrsh7th/cmp-nvim-lsp",
      -- Se você quiser integrar formatadores/linters como shfmt, stylua, etc.
      -- adicione um destes plugins E suas configurações em um arquivo separado, ex: none-ls.lua
      -- "nvimtools/none-ls.nvim",
      -- "stevearc/conform.nvim",
    },
    opts = {},
    config = function()
      local lspconfig = require('lspconfig')
      local mason_lspconfig = require('mason_lspconfig')
      local capabilities = require('cmp_nvim_lsp').default_capabilities()

      local on_attach = function(client, bufnr)
        vim.diagnostic.config({
          virtual_text = { end_col = true, prefix = '●' },
          signs = true, underline = true, update_in_insert = false,
          severity_sort = true,
          float = { source = "always", focusable = false, border = "rounded", header = "", prefix = "" },
        })

        vim.keymap.set('n', 'gd', vim.lsp.buf.definition, { buffer = bufnr, desc = 'Go to definition' })
        vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, { buffer = bufnr, desc = 'Go to declaration' })
        vim.keymap.set('n', 'gr', vim.lsp.buf.references, { buffer = bufnr, desc = 'Go to references' })
        vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, { buffer = bufnr, desc = 'Go to implementation' })
        vim.keymap.set('n', 'K', vim.lsp.buf.hover, { buffer = bufnr, desc = 'Hover Documentation' })
        vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, { buffer = bufnr, desc = 'Rename symbol' })
        vim.keymap.set('n', '<leader>ca', vim.lsp.buf.code_action, { buffer = bufnr, desc = 'Code Action' })
        vim.keymap.set('n', '<leader>f', function() vim.lsp.buf.format { async = true } end, { buffer = bufnr, desc = 'Format Code' })
      end

      mason_lspconfig.setup({
        ensure_installed = {
          -- **SOMENTE LSPs AQUI COM OS NOMES CORRETOS PARA LSPCONFIG**
          "bashls",                 -- Mapper para bash-language-server
          "cssls",                  -- Mapper para css-lsp
          "dartls",                 -- Mapper para dart-language-server
          "denols",                 -- Mapper para deno
          "gopls",                  -- Mapper para gopls (nome igual)
          "html",                   -- Mapper para html-lsp
          "jsonls",                 -- Mapper para json-lsp
          "kotlin_language_server", -- Mapper para kotlin-language-server
          "lua_ls",                 -- Mapper para lua-language-server
          "marksman",               -- Mapper para marksman (nome igual)
          "vimls",                  -- Mapper para vim-language-server
          "yaml_language_server",   -- Mapper para yaml-language-server (nome igual)
          -- Adicione "clangd" se você usa C/C++
        },
        handlers = {
          -- Handler para denols
          ["denols"] = function()
              lspconfig.denols.setup({
                  capabilities = capabilities,
                  on_attach = on_attach,
                  root_dir = lspconfig.util.root_pattern("deno.json", "deno.jsonc", ".git"),
                  init_options = {
                      enable = true,
                      lint = true,
                      unstable = true,
                      importMap = "deno.json",
                  },
              })
          end,
          -- Se você usa o LSP para golangci-lint, adicione um handler específico:
          -- ["golangci_lint_langserver"] = function()
          --     lspconfig.golangci_lint_langserver.setup({
          --         capabilities = capabilities,
          --         on_attach = on_attach,
          --     })
          -- end,

          -- Handler genérico para os outros LSPs
          function(server_name)
              -- Exclua aqui qualquer server que tenha um handler específico acima
              if server_name ~= "denols" and server_name ~= "golangci_lint_langserver" then -- adicione "clangd" aqui se tiver um handler para ele
                  lspconfig[server_name].setup({
                      capabilities = capabilities,
                      on_attach = on_attach,
                  })
              end
          end,
        },
      })
    end,
  },
}