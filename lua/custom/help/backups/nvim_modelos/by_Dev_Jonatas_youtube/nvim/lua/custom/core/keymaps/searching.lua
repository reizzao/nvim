-- ~/.config/nvim/lua/custom/core/keymaps/searching.lua
-- Mapeamentos de Pesquisa

local M = {}

M.keymaps = {
  -- Pesquisar em todo o projeto (requer 'telescope.nvim' e 'ripgrep')
  ["<leader>ff"] = { "<cmd>Telescope find_files<CR>", "Procurar arquivos", motivo = "Leader + 'ff' (find files) para busca rápida de arquivos no projeto." },
  ["<leader>fg"] = { "<cmd>Telescope live_grep<CR>", "Procurar texto no projeto (grep)", motivo = "Leader + 'fg' (find grep) para buscar texto em todos os arquivos do projeto." },
}

return M.keymaps