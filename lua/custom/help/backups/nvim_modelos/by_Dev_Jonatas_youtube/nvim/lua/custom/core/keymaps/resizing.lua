-- ~/.config/nvim/lua/custom/core/keymaps/resizing.lua
-- Mapeamentos de Redimensionamento de Janelas

local M = {}

M.keymaps = {
  ["<C-Up>"] = { ":resize +2<CR>", "Aumentar janela vertical", motivo = "Ctrl + Seta para cima para aumentar a altura da janela." },
  ["<C-Down>"] = { ":resize -2<CR>", "Diminuir janela vertical", motivo = "Ctrl + Seta para baixo para diminuir a altura da janela." },
  ["<C-Left>"] = { ":vertical resize -2<CR>", "Diminuir janela horizontal", motivo = "Ctrl + Seta para esquerda para diminuir a largura da janela." },
  ["<C-Right>"] = { ":vertical resize +2<CR>", "Aumentar janela horizontal", motivo = "Ctrl + Seta para direita para aumentar a largura da janela." },
}

return M.keymaps