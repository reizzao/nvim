-- ~/.config/nvim/lua/custom/core/keymaps/movement.lua
-- Mapeamentos de Movimentação e Navegação

local M = {}

M.keymaps = {
  -- Mover entre janelas (splits)
  ["<C-h>"] = { "<C-w>h", "Mover para janela esquerda", motivo = "Usa 'h' (esquerda) da Home Row com Ctrl, padrão Vim para janelas." },
  ["<C-j>"] = { "<C-w>j", "Mover para janela abaixo", motivo = "Usa 'j' (baixo) da Home Row com Ctrl, padrão Vim para janelas." },
  ["<C-k>"] = { "<C-w>k", "Mover para janela acima", motivo = "Usa 'k' (cima) da Home Row com Ctrl, padrão Vim para janelas." },
  ["<C-l>"] = { "<C-w>l", "Mover para janela direita", motivo = "Usa 'l' (direita) da Home Row com Ctrl, padrão Vim para janelas." },

  -- Navegação por buffers (arquivos abertos)
  ["<leader>bn"] = { ":bnext<CR>", "Próximo buffer", motivo = "Leader + 'bn' (buffer next) é um atalho mnemônico para navegação rápida de buffers." },
  ["<leader>bp"] = { ":bprevious<CR>", "Próximo buffer", motivo = "Leader + 'bp' (buffer previous) é mnemônico para voltar buffers." },
  ["<leader>bd"] = { ":bdelete<CR>", "Fechar buffer", motivo = "Leader + 'bd' (buffer delete) para fechar o buffer atual de forma concisa." },

  -- EXPLORER
    -- Explorer nativo netwr
    ["<leader>ee"] = { "<Cmd>Ex<CR>", "abre explorer nativo netwr", motivo = "e significa: explorer. -- usarei `ee` por ser segunda opção de explorador." },

  -- Plug_Config: Explorador de Arquivos : Alternar Neo-tree
  ["<leader>e"] = { ":NeotreeToggle<CR>", "Alternar Neo-tree", motivo = "Leader + 'n' (Neo-tree/navigation) para acesso rápido ao explorador de arquivos." },
}

return M.keymaps