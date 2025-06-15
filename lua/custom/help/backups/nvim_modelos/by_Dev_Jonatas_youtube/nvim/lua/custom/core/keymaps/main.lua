-- ~/.config/nvim/lua/config/keymaps.lua

---
-- 1. Importar o Módulo de Mapeamentos Agregados
---
-- O caminho 'my_config.keymaps' agora refere-se ao 'init.lua' dentro de 'custom/core/keymaps/'
local all_categorized_keymaps = require("custom.core.keymaps.init")

---
-- 2. Função Auxiliar para Aplicar Mapeamentos
---
-- Esta função itera sobre a tabela de mapeamentos e os aplica usando vim.keymap.set.
-- Ela utiliza a descrição do campo 'motivo' como a descrição principal do atalho.
local function setup_all_keymaps()
  -- Loop através das categorias (ex: 'editing', 'movement', 'resizing', etc.)
  -- O 'all_categorized_keymaps.keymaps' agora é a tabela consolidada do init.lua
  for category_name, category_maps in pairs(all_categorized_keymaps.keymaps) do
    -- Loop através dos mapeamentos dentro de cada categoria
    for key_binding, map_details in pairs(category_maps) do
      local rhs = map_details[1] -- O que o atalho faz (comando, função, etc.)
      local desc = map_details.motivo -- Usamos 'motivo' como a descrição principal
      local mode = map_details.mode or "n" -- O modo padrão é 'n' (Normal) se não especificado

      -- Aplica o mapeamento
      vim.keymap.set(mode, key_binding, rhs, { desc = desc, silent = true })
    end
  end
end

---
-- 3. Chamar a Função para Configurar Todos os Mapeamentos
---
setup_all_keymaps()

-- ---
-- 4. Exemplo de Mapeamento Direto (fora do módulo, se necessário)
-- ---
-- Você ainda pode adicionar mapeamentos diretamente aqui se tiver algum atalho único
-- que não se encaixe bem nas categorias ou queira adicionar de forma rápida.
-- Ex:
-- vim.keymap.set("n", "<leader>test", "<cmd>echo 'Teste de mapeamento direto!'<CR>", { desc = "Meu atalho de teste" })