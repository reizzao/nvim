-- ~/.config/nvim/lua/custom/init.lua

return {
  -- Carrega todos os plugins definidos em lua/custom/languages.lua
  require("custom.languages"),
  -- Carrega as configurações de LSP definidas em lua/custom/lsp.lua
  require("custom.lsp"),

  -- NOVO: Carrega seus arquivos de mapeamento de teclas
  require("custom.keymaps_files"),
  require("custom.keymaps_move"),
  require("custom.keymaps_text"),
  require("custom.keymaps"), -- Se este for um arquivo geral de keymaps, mantenha-o.
}