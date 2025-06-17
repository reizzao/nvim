-- plugins/treesitter.lua

return {
  -- Treesitter (para highlight avançado)
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    config = function()
      require("nvim-treesitter.configs").setup({
        ensure_installed = { "bash", "lua", "vimdoc", "javascript", "html", "css" }, -- Adicione as linguagens do seu projeto
        highlight = {
          enable = true, -- Ativa o highlight
        },
      })
    end,
  },
}
