-- ~/.config/nvim/lua/custom/core/keymaps/editing.lua
-- Mapeamentos de Edição de Texto

local M = {}

M.keymaps = {
  -- Salvar e Sair
  ["<leader>s"] = { "<cmd>w<CR>", "Salvar", mode = { "n", "i", "v" }, motivo = "`s` de save." },
  ["<leader>q"] = { "<cmd>wq<CR>", "Salvar e sair", motivo = "#." },
  ["<leader>qq"] = { "<cmd>q!<CR>", "Sair sem salvar", motivo = "#" },
  ["<leader>qb"] = { "<cmd>qa<CR>", "Sair de todos os buffers", motivo = "`qb` fecha buffers" },

  -- Recortar/Copiar/Colar (usando registrador do sistema)
  ["x"] = { '"+x', "Recortar para clipboard do sistema", mode = "v", motivo = "Usa 'x' (cut) com '+' para o clipboard do sistema." },
  ["c"] = { '"+c', "Copiar para clipboard do sistema", mode = "v", motivo = "Usa 'c' (copy) com '+' para o clipboard do sistema." },
  ["y"] = { '"+y', "Copiar para clipboard do sistema", mode = "v", motivo = "Usa 'y' (yank/copy) com '+' para o clipboard do sistema." },
  ["<leader>p"] = { '"+p', "Colar do clipboard do sistema", motivo = "Leader + 'p' (paste) com '+' para colar do clipboard do sistema." },

  -- Plug_Config : Comentar/Descomentar linhas (requer 'comment.nvim')
  ["cx"] = { "<Plug>(comment_toggle_linewise)", "Alternar comentário de linha", mode = { "n", "v" }, motivo = "usei `cx` por ser perto do `c`" },

  ["cc"] = { "<Plug>(comment_toggle_linewise_current)", "Comentar linha atual", motivo = "'gcc' (global comment current) para comentar a linha atual rapidamente." },
}

return M.keymaps