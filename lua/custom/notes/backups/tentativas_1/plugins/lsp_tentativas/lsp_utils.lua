-- ~/.config/nvim/lua/plugins/lsp_utils.lua

return {
  {
    "onsails/lspkind.nvim",
  },
  {
    -- Remova 'enabled = false' para habilitar este plugin
    "nvimdev/nvim-lsp-utils",
    event = "LspAttach", -- Carrega quando um LSP é anexado
    dependencies = {
      "nvim-lua/plenary.nvim", -- Dependência necessária
    },
    opts = {}, -- Pode adicionar opções de configuração aqui se houver
    config = function(_, opts)
        -- Se quiser que ele se configure automaticamente ou emane algo
        -- Por exemplo: require("nvim-lsp-utils").setup(opts) se o plugin tiver uma função setup
    end,
  },
  -- Se nvim-lsp-ts-utils não for mais usado, você pode simplesmente removê-lo
  {
    "nvimtools/nvim-lsp-ts-utils",
    enabled = false, -- Mantenha desabilitado se não usar
  },
}