-- ~/.config/nvim/lua/plugins/lspconfig.lua
return {
  "neovim/nvim-lspconfig",
  dependencies = {
    "williamboman/mason.nvim",
    "williamboman/mason-lspconfig.nvim",
    -- ... outras dependências
  },
  opts = {},
  config = function()
    local lspconfig = require('lspconfig')
    local mason_lspconfig = require('mason_lspconfig') -- Corrigido para mason_lspconfig

    -- O cmp_nvim_lsp.default_capabilities() já deve funcionar se 'nvim-cmp' estiver OK.
    local capabilities = require('cmp_nvim_lsp').default_capabilities()

    -- **NÃO FAÇA require("nvim-lsp-ts-utils") ou require("nvim-lsp-utils") AQUI DIRETAMENTE**
    -- O LazyVim vai cuidar de carregar os plugins que você definiu no lsp_utils.lua
    -- usando 'event = "LspAttach"'.

    mason_lspconfig.setup({
      ensure_installed = {
        "bashls",
        "tsserver",
        "gopls",
        "kotlin_language_server",
        "dartls",
        "marksman",
        "html",
        "cssls",
      },
      handlers = {
        lspconfig.clangd.setup({
          capabilities = capabilities,
        }),

        ["tsserver"] = function()
            local server_opts = {
                capabilities = capabilities,
            }

            -- O nvim-lsp-ts-utils será carregado pelo 'event = "LspAttach"'
            -- Se ele estiver disponível, o 'require' abaixo funcionará.
            -- É importante que esta parte esteja no 'on_attach' do server,
            -- para garantir que o plugin seja inicializado no momento certo.
            server_opts.on_attach = function(client, bufnr)
                -- APENAS se ts-utils estiver carregado, tente configurá-lo e anexá-lo.
                if pcall(require, "nvim-lsp-ts-utils") then
                    local ts_utils = require("nvim-lsp-ts-utils")
                    ts_utils.setup({ server = client }) -- Passa o cliente LSP
                    ts_utils.attach(client, bufnr)
                end
                -- Se precisar de nvim-lsp-utils aqui, também use pcall e require
            end

            lspconfig.tsserver.setup(server_opts)
        end,

        function(server_name)
            if server_name ~= "tsserver" then
                lspconfig[server_name].setup({
                    capabilities = capabilities,
                })
            end
        end,
      },
    })
  end,
}

--[[
[STATUS MY LSP CONFIG em 2025_Junho ](https://g.co/gemini/share/5ccad3f4e402)


]]