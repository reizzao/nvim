-- ~/.config/nvim/lua/custom/core/keymaps/plugins.lua
-- Mapeamentos relacionados a Configurações de Plugins (LSP, Terminal, Git)

local M = {}

M.keymaps = {
  -- Funções de Linguagem (LSP - Language Server Protocol)
  ["gd"] = { vim.lsp.buf.definition, "Ir para definição", motivo = "'gd' (go definition) é um atalho Vim padrão para navegação de código LSP." },
  ["gr"] = { vim.lsp.buf.references, "Mostrar referências", motivo = "'gr' (go references) para ver onde um símbolo é usado." },
  ["<leader>rn"] = { vim.lsp.buf.rename, "Renomear", motivo = "Leader + 'rn' (rename) para refatorar nomes de símbolos." },
  ["<leader>fm"] = { vim.lsp.buf.format, "Formatar documento", motivo = "Leader + 'fm' (format) para formatar o código com o LSP." },
  ["gl"] = { vim.diagnostic.open_float, "Mostrar diagnóstico sob o cursor", motivo = "'gl' (go to diagnostic) para exibir erros/avisos flutuantes." },
  ["[d"] = { vim.diagnostic.goto_prev, "Próximo diagnóstico", motivo = "'[d' para navegar para o diagnóstico anterior." },
  ["]d"] = { vim.diagnostic.goto_next, "Próximo diagnóstico", motivo = "']d' para navegar para o próximo diagnóstico." },
  ["<leader>ca"] = { vim.lsp.buf.code_action, "Ações de Código", mode = { "n", "v" }, motivo = "Leader + 'ca' (code action) para correções rápidas e refatorações do LSP." },

  -- Terminal Integrado (requer 'toggleterm.nvim')
  ["<leader>t"] = { "<cmd>ToggleTerm<CR>", "Alternar terminal flutuante", motivo = "Leader + 't' (terminal) para abrir/fechar o terminal rapidamente." },
  ["<leader>t"] = { "<cmd>ToggleTerm<CR>", "Alternar terminal flutuante", mode = "t", motivo = "Permite alternar o terminal também a partir do modo Terminal." },

  -- Git (requer 'gitsigns.nvim')
  ["gj"] = { "<cmd>Gitsigns next_hunk<CR>", "Próximo 'hunk' Git", motivo = "'gj' (git jump next) para navegar entre as alterações do Git." },
  ["gk"] = { "<cmd>Gitsigns prev_hunk<CR>", "Anterior 'hunk' Git", motivo = "'gk' (git jump previous) para navegar para a alteração Git anterior." },
  ["<leader>hs"] = { "<cmd>Gitsigns preview_hunk<CR>", "Pré-visualizar 'hunk'", motivo = "Leader + 'hs' (hunk show) para ver detalhes de uma alteração Git." },
  ["<leader>gs"] = { "<cmd>Gitsigns stage_hunk<CR>", "Estagiar 'hunk' (git add)", mode = { "n", "v" }, motivo = "Leader + 'gs' (git stage) para adicionar um 'hunk' ao stage." },
}

return M.keymaps