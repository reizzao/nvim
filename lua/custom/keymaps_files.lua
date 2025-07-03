-- ~/.config/nvim/lua/custom/keymaps_files.lua
-- GERENCIAMENTO DE ARQUIVOS

-- Salvar
vim.keymap.set({ "n", "i", "v" }, "<C-s>", function()
  vim.cmd("w")
  if vim.api.nvim_get_mode().mode == "i" then
    vim.schedule(function()
      vim.api.nvim_feedkeys("l", "n", false) -- Salva e mantém cursor no modo Inserção.
    end)
  end
end, { desc = "Salvar arquivo" })

-- Sair
-- vim.keymap.set("n", "<F12>", "<Cmd>wq!<CR>", { desc = "Salvar e fechar todas as janelas" }) -- Salva e fecha todas as janelas (mata o editor).
vim.keymap.set("n", "<A-ww>", function()
  -- Fecha todos os buffers, perguntando por modificações se não salvos
  vim.cmd('qa')
end, { desc = "Fechar todos os buffers e abrir novo vazio" })

-- vim.keymap.set("n", "<F12>", function() -- TODO nao sei se vou usar
--   require("buffers_utils").close_buffer(true) -- Força o fechamento de todos os buffers (ignora modificações).
-- end, { desc = ":qa! >> SEM SALVAR Fechar todos os buffers (FORÇAR)" })

-- Mapeamentos base para copiar/colar linha inteira
vim.keymap.set("n", "Y", "yy", { desc = "Copiar linha inteira para o clipboard do sistema" }) -- Copia a linha atual para o clipboard.
vim.keymap.set("n", "<LocalLeader>y", '"+y', { desc = "Copiar para o clipboard do sistema" }) -- Copia seleção/movimento para o clipboard.
vim.keymap.set("n", "<LocalLeader>p", '"+p', { desc = "Colar do clipboard do sistema" }) -- Cola do clipboard.


vim.keymap.set('n', 'A-w', ':bd<CR>', { desc = "Fechar buffer em foco" })

-- Buffers
vim.keymap.set("n", "<S-Tab>", ":bnext<CR>", { desc = "Próximo buffer" }) -- Navega para o próximo buffer.
vim.keymap.set("n", "<A-w>", ":bdelete<CR>", { desc = "Deletar buffer atual" }) -- Deleta o buffer atual.

-- Recarregar Configuração
vim.keymap.set("n", "<leader>rc", function()
  vim.cmd("source " .. vim.fn.stdpath("config") .. "/init.lua")
  vim.notify("Configuração recarregada!", vim.log.levels.INFO) -- Recarrega o arquivo de configuração do Neovim.
end, { desc = "Recarregar config do Neovim" })

-- Copiar Caminho do Arquivo
vim.keymap.set("n", "<leader>cp", function()
  local file_path = vim.fn.expand("%:p")
  vim.fn.setreg("+", file_path)
  vim.notify("Caminho do arquivo copiado!", vim.log.levels.INFO) -- Copia o caminho completo do arquivo atual para o clipboard.
end, { desc = "Copiar caminho completo do arquivo" })

-- Recarregar Arquivo Atual
vim.keymap.set("n", "<leader>eR", ":e!<CR>", { desc = "Recarregar arquivo (descartar alterações)" }) -- Recarrega o arquivo atual, descartando alterações não salvas.

-- Explorer Nativo
vim.keymap.set("n", "<A-e>", "<Cmd>Ex<CR>", { desc = "Abrir explorer nativo (netrw)" }) -- Abre o gerenciador de arquivos nativo (netrw).
