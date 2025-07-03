-- ~/.config/nvim/lua/custom/lsp.lua

return {
  "neovim/nvim-lspconfig",
  dependencies = {
    -- Gerenciador de LSPs (altamente recomendado para facilitar a instalação)
    "williamboman/mason.nvim",
    "williamboman/mason-lspconfig.nvim",
    -- Para autocompletar e snippets
    "hrsh7th/nvim-cmp",
    "hrsh7th/cmp-nvim-lsp",
    "L3MON4D3/LuaSnip",
    "saadparwaiz1/cmp_luasnip",
  },
  config = function()
    local lspconfig = require("lspconfig")
    local mason_lspconfig = require("mason-lspconfig")
    local cmp = require("cmp")
    local luasnip = require("luasnip")

    -- Configuração do Mason para instalar LSPs automaticamente
    require("mason").setup({
      ui = {
        icons = {
          package_installed = "✓",
          package_pending = "➜",
          package_uninstalled = "✗",
        },
      },
    })

    mason_lspconfig.setup({
      -- Servidores que você quer que o Mason instale automaticamente
      ensure_installed = {
        "denols",         -- Para Deno
        "bashls",         -- Para Shell Script
        "gopls",          -- Para Go
        "kotlin_language_server", -- Para Kotlin (certifique-se de que o nome está correto)
      },
    })

    mason_lspconfig.setup_handlers({
      function(server_name)
        lspconfig[server_name].setup({
          on_attach = function(client, bufnr)
            -- Mapeamentos de teclas básicos para LSP
            local buf_set_keymap = vim.api.nvim_buf_set_keymap
            local opts = { noremap = true, silent = true }

            buf_set_keymap(bufnr, "n", "gd", "<cmd>lua vim.lsp.buf.definition()<CR>", opts)
            buf_set_keymap(bufnr, "n", "K", "<cmd>lua vim.lsp.buf.hover()<CR>", opts)
            buf_set_keymap(bufnr, "n", "gi", "<cmd>lua vim.lsp.buf.implementation()<CR>", opts)
            buf_set_keymap(bufnr, "n", "<leader>rn", "<cmd>lua vim.lsp.buf.rename()<CR>", opts)
            buf_set_keymap(bufnr, "n", "<leader>ca", "<cmd>lua vim.lsp.buf.code_action()<CR>", opts)
            buf_set_keymap(bufnr, "n", "gr", "<cmd>lua vim.lsp.buf.references()<CR>", opts)
            buf_set_keymap(bufnr, "n", "<leader>f", "<cmd>lua vim.lsp.buf.format()<CR>", opts)
            buf_set_keymap(bufnr, "n", "<leader>wd", "<cmd>lua vim.lsp.diagnostic.set_loclist()<CR>", opts)
            buf_set_keymap(bufnr, "n", "[d", "<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>", opts)
            buf_set_keymap(bufnr, "n", "]d", "<cmd>lua vim.lsp.diagnostic.goto_next()<CR>", opts)
          end,
          capabilities = vim.lsp.protocol.make_client_capabilities(),
        })
      end,
    })

    -- Configuração do nvim-cmp (autocompletar)
    cmp.setup({
      snippet = {
        expand = function(args)
          luasnip.lsp_expand(args.body)
        end,
      },
      mapping = cmp.mapping.preset.insert({
        ["<C-b>"] = cmp.mapping.scroll_docs(-4),
        ["<C-f>"] = cmp.mapping.scroll_docs(4),
        ["<C-Space>"] = cmp.mapping.complete(),
        ["<C-e>"] = cmp.mapping.abort(),
        ["<CR>"] = cmp.mapping.confirm({ select = true }), -- Confirma a seleção
      }),
      sources = cmp.sources({
        { name = "nvim_lsp" },
        { name = "luasnip" },
      }),
    })
  end,
}