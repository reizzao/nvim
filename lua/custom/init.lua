-- ~/.config/nvim/lua/custom/init.lua

return {
  -- Carrega todos os plugins definidos em lua/custom/languages.lua
  require("custom.languages"),
  -- Carrega as configurações de LSP definidas em lua/custom/lsp.lua
  require("custom.lsp"),
  -- Adicione outros módulos customizados aqui, se houver
}