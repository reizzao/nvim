-- ~/.config/nvim/lua/plugins/lspconfig.lua

return {
  "neovim/nvim-lspconfig",
  dependencies = {
    "williamboman/mason.nvim",
    "williamboman/mason-lspconfig.nvim",
    "nvimdev/nvim-lsp-utils", -- Para o F2 renomear
  },
  config = function()
    local lspconfig = require('lspconfig')
    local mason_lspconfig = require('mason-lspconfig')
    -- 'cmp_nvim_lsp.default_capabilities()' fornece capabilities que o cmp precisa para interagir com o LSP
    -- É importante que cmp_nvim_lsp esteja carregado ANTES desta linha.
    -- Como ele é uma dependência de nvim-cmp (que deve ser carregado primeiro), isso deve funcionar.
    local capabilities = require('cmp_nvim_lsp').default_capabilities()

    -- on_attach function para mapeamentos de teclas e nvim-lsp-utils
    local on_attach = function(client, bufnr)
      -- Mapeamentos de LSP
      vim.keymap.set('n', 'gd', vim.lsp.buf.definition, { buffer = bufnr, desc = 'LSP: Go to Definition' })
      vim.keymap.set('n', 'gr', vim.lsp.buf.references, { buffer = bufnr, desc = 'LSP: Show References' })
      vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, { buffer = bufnr, desc = 'LSP: Go to Declaration' })
      vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, { buffer = bufnr, desc = 'LSP: Go to Implementation' })
      vim.keymap.set('n', 'K', vim.lsp.buf.hover, { buffer = bufnr, desc = 'LSP: Hover Documentation' })
      vim.keymap.set('n', '<leader>ws', vim.lsp.buf.workspace_symbol, { buffer = bufnr, desc = 'LSP: Workspace Symbols' })
      vim.keymap.set('n', '<leader>vd', vim.diagnostic.open_float, { buffer = bufnr, desc = 'LSP: View Diagnostic' })
      vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, { buffer = bufnr, desc = 'LSP: Previous Diagnostic' })
      vim.keymap.set('n', ']d', vim.diagnostic.goto_next, { buffer = bufnr, desc = 'LSP: Next Diagnostic' })
      vim.keymap.set('n', '<leader>vca', vim.lsp.buf.code_action, { buffer = bufnr, desc = 'LSP: Code Action' })
      vim.keymap.set('n', '<leader>vrr', vim.lsp.buf.references, { buffer = bufnr, desc = 'LSP: Show References' }) -- Duplicado com gr?
      -- O F2 para renomear
      vim.keymap.set('n', '<F2>', function()
        if pcall(require, 'nvim-lsp-utils') and require('nvim-lsp-utils').rename then
          require('nvim-lsp-utils').rename()
        else
          vim.lsp.buf.rename()
        end
      end, { buffer = bufnr, desc = "LSP: Renomear Símbolo" })
    end

    mason_lspconfig.setup({
      ensure_installed = {
        "bashls", "denols", "gopls", "kotlin_language_server", -- Adicione "denols" aqui!
        "dartls", "marksman", "html", "cssls", "jsonls", "lua_ls",
        -- Remova "tsserver" se você quer que o Deno Lida com TS/JS e não quer o tsserver padrão
      },
      handlers = {
        function(server_name)
          lspconfig[server_name].setup({
            capabilities = capabilities,
            on_attach = on_attach, -- Anexa os mapeamentos e funções como o rename do F2
          })
        end,
      },
    })

    -- Configurações específicas para Deno LSP
    lspconfig.denols.setup({
      on_attach = on_attach,
      capabilities = capabilities,
      root_dir = lspconfig.util.root_pattern("deno.json", "deno.jsonc", "deps.ts", ".git"),
      -- Opcional: Desabilitar tsserver dentro do denols se ele estiver causando problemas
      -- init_options = {
      --   ts = {
      --     enable = false,
      --   },
      -- },
    })

    -- EXEMPLO: Se você ainda precisa de tsserver para projetos Node.js/navegador,
    -- mas quer que o Deno lide com TS em projetos Deno.
    -- lspconfig.tsserver.setup({
    --   on_attach = on_attach,
    --   capabilities = capabilities,
    --   -- Você pode adicionar um root_dir aqui para ativá-lo apenas em pastas com package.json, por exemplo
    --   root_dir = lspconfig.util.root_pattern("package.json", ".git"),
    -- })

  end,
}