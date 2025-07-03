-- ~/.config/nvim/lua/custom/keymaps.text.lua
-- EDICAO DE TEXTOS

-- Desfazer (Undo)
vim.keymap.set({ "n", "v", "x" }, "<leader>u", "u", { desc = "Desfazer (Leader-u)" }) -- Desfaz a última alteração.
vim.keymap.set("i", "<C-z>", "<Esc>ua", { desc = "Desfazer (Ctrl-z) no modo Insert" }) -- Desfaz no modo Inserção e retorna.

-- Refazer (Redo)
-- Removido o mapeamento duplicado de <C-r> para <C-r>
vim.keymap.set({ "n", "v", "x" }, "<leader>r", "<C-r>", { desc = "Refazer (Leader-r)" }) -- Refaz a última alteração desfeita.
vim.keymap.set("i", "<C-r>", "<Esc><C-r>a", { desc = "Refazer (Ctrl-r) no modo Insert" }) -- Refaz no modo Inserção e retorna.

-- Sair do Modo de Inserção
vim.keymap.set("i", "jj", "<Esc>", { desc = "Sair do modo de inserção (atalho rápido)" }) -- Mapeia "jj" para sair do modo de inserção.

-- Selecionar Tudo
vim.keymap.set("n", "<A-a>", "ggVG", { desc = "Selecionar todo o conteúdo do arquivo" }) -- Seleciona todo o conteúdo do arquivo no modo Normal.

-- Deletar Linha
vim.keymap.set({ "n", "v" }, "<A-d>", "dd", { desc = "Deletar linha" }) -- Deleta a linha atual ou a seleção.
vim.keymap.set("i", "<A-d>", "<Esc>ddi", { desc = "Deletar linha no modo Insert" }) -- Deleta a linha no modo Inserção e retorna.

-- Indentar
vim.keymap.set("n", ".", ">>", { desc = "Indentar linha atual para direita" }) -- Indenta a linha atual para a direita.
vim.keymap.set("n", ",", "<<", { desc = "Indentar linha atual para esquerda" }) -- Indenta a linha atual para a esquerda.
vim.keymap.set("i", "<C-.>", "<Esc>>>a", { desc = "Indentar para direita no modo Insert" }) -- Indenta para direita no modo Inserção e retorna.
vim.keymap.set("i", "<C-,>", "<Esc><<a", { desc = "Indentar para esquerda no modo Insert" }) -- Indenta para esquerda no modo Inserção e retorna.
vim.keymap.set("v", ".", ">", { desc = "Indentar seleção para direita" }) -- Indenta a seleção para a direita.
vim.keymap.set("v", ",", "<", { desc = "Indentar seleção para esquerda" }) -- Indenta a seleção para a esquerda.

-- Toggle Case (Maiúscula/Minúscula da palavra)
local function toggle_word_case()
  local current_word = vim.fn.expand("<cword>")
  if current_word == nil or current_word == "" then
    return "<Nop>"
  end
  if current_word:upper() == current_word then
    return "viwu" -- Se maiúscula, torna minúscula.
  else
    return "viwU" -- Se minúscula/misto, torna maiúscula.
  end
end
vim.keymap.set("n", "<A-m>", toggle_word_case(), { expr = true, desc = "Alternar case da palavra" }) -- Alterna entre maiúscula e minúscula da palavra sob o cursor.
vim.keymap.set("i", "<A-m>", "<Esc>" .. toggle_word_case() .. "a", { expr = true, desc = "Alternar case da palavra (Insert)" }) -- Alterna o case da palavra no modo Inserção e retorna.

-- Toggle Case (Maiúscula/Minúscula da seleção)
local function toggle_visual_case()
  local selection = vim.api.nvim_get_vvar("register")
  if selection:find("%u") then
    return "u" -- Se a seleção tem maiúsculas, torna minúscula.
  else
    return "U" -- Se não tem maiúsculas, torna maiúscula.
  end
end
vim.keymap.set("v", "<A-m>", toggle_visual_case(), { expr = true, desc = "Alternar case da seleção" }) -- Alterna entre maiúscula e minúscula da seleção.

-- Substituição de Todas Ocorrências
vim.keymap.set("n", "<A-s>", ":%s///g<Left><Left>", { desc = "Substituir todas as ocorrências no arquivo" }) -- Inicia substituição global (achar/substituir).
vim.keymap.set("n", "<A-sc>", ":%s///gc<Left><Left><Left>", { desc = "Substituir todas (com confirmação)" }) -- Inicia substituição global com confirmação.
vim.keymap.set({ "x", "v" }, "<A-s>", ":<C-u>s///g<Left><Left>", { desc = "Substituir na seleção" }) -- Inicia substituição na seleção.
vim.keymap.set({ "x", "v" }, "<A-sc>", ":<C-u>s///gc<Left><Left><Left>", { desc = "Substituir na seleção (com confirmação)" }) -- Inicia substituição na seleção com confirmação.
vim.keymap.set("v", "*", 'y/\\V<C-R>"<CR>', { desc = "Buscar seleção (literalmente)" }) -- Copia a seleção e inicia uma busca literal por ela.
