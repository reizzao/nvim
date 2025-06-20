return {
  {
    "neovim/nvim-lspconfig",
    dependencies = {
      "williamboman/mason.nvim",
      "williamboman/mason-lspconfig.nvim", -- ESSENCIAL para a integração Mason/LSP
      "hrsh7th/cmp-nvim-lsp",              -- ESSENCIAL para a integração LSP/Autocompletar
      -- ... outras dependências como nvim-cmp, lspkind, etc.
    },
    opts = {},
    config = function()
      local lspconfig = require('lspconfig')
      local mason_lspconfig = require('mason-lspconfig')
      local capabilities = require('cmp_nvim_lsp').default_capabilities() -- ESSA LINHA PRECISA DE cmp_nvim_lsp

      mason_lspconfig.setup({
        ensure_installed = { "tsserver", "gopls", "html", "cssls", "bashls" }, -- Seus LSPs
        handlers = {
          lspconfig.clangd.setup({ capabilities = capabilities }),
          ["tsserver"] = function()
              local server_opts = { capabilities = capabilities }
              server_opts.on_attach = function(client, bufnr)
                  if pcall(require, "nvim-lsp-ts-utils") then -- Se decidir reativá-lo depois
                      local ts_utils = require("nvim-lsp-ts-utils")
                      ts_utils.setup({ server = client })
                      ts_utils.attach(client, bufnr)
                  end
              end
              lspconfig.tsserver.setup(server_opts)
          end,
          function(server_name)
            if server_name ~= "tsserver" then
                lspconfig[server_name].setup({ capabilities = capabilities })
            end
          end,
        },
      })
    end,
  },
}