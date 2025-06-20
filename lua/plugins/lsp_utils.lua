-- ~/.config/nvim/lua/plugins/lsp_utils.lua
return {
  {
    "onsails/lspkind.nvim",
  },
  {
    -- DESABILITE OU REMOVA ESTE PLUGIN SE ELE NÃO ESTÁ SENDO ENCONTRADO
    "nvimtools/nvim-lsp-ts-utils", -- Deixe o nome original ou comente a linha
    enabled = false, -- <--- Adicione esta linha para desabilitar
    event = "LspAttach",
    opts = {},
    config = function(_, opts)
        -- if pcall(require, "nvim-lsp-ts-utils") then
        --   require("nvim-lsp-ts-utils").setup(opts)
        -- end
    end,
  },
  {
    -- DESABILITE OU REMOVA ESTE PLUGIN SE ELE NÃO ESTÁ SENDO ENCONTRADO
    "nvimtools/nvim-lsp-utils", -- Deixe o nome original ou comente a linha
    enabled = false, -- <--- Adicione esta linha para desabilitar
    event = "LspAttach",
    dependencies = {
      "nvim-lua/plenary.nvim",
    },
    opts = {},
    config = function(_, opts)
        -- if pcall(require, "nvim-lsp-utils") then
        --   require("nvim-lsp-utils").setup(opts)
        -- end
    end,
  },
  -- ... (seus outros plugins LSP como nvim-lspconfig, mason, etc.)
}