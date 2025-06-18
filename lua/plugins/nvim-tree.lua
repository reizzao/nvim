-- ~/.config/nvim/lua/plugins/nvim-tree.lua

return {
  "nvim-tree/nvim-tree.lua",
  version = "*", -- ou a versão que você usa
  lazy = false,  -- nvim-tree geralmente não é lazy-loaded, pois é um explorer principal
  dependencies = {
    "nvim-tree/nvim-web-devicons",
  },
  opts = {
    -- Outras opções de configuração do nvim-tree
    -- ...
    view = {
      width = 30,
      -- Outras opções de view
    },
    actions = {
      open_file = {
        quit_on_open = false, -- Não fechar o nvim-tree ao abrir um arquivo
      },
    },
    -- Aqui é onde você define o 'on_attach' para seus remapeamentos
    on_attach = function(bufnr)
      local tree_api = require("nvim-tree.api")

      -- Desabilitar mapeamentos padrão que você não quer
      -- tree_api.nvim_tree_unmap_default_keymaps() -- Desabilita TODOS os mapeamentos padrão
      -- ou desabilite um por um:
      -- vim.keymap.del('n', 'a', { buffer = bufnr }) -- Exemplo: desabilita 'a' (adicionar)

      -- Seus remapeamentos personalizados (usando vim.keymap.set com { buffer = bufnr })
      vim.keymap.set('n', 'A', tree_api.node.add, { buffer = bufnr, desc = 'NvimTree: Adicionar' }) -- Remapeia Shift+A para adicionar
      vim.keymap.set('n', 'D', tree_api.node.remove, { buffer = bufnr, desc = 'NvimTree: Deletar' }) -- Remapeia Shift+D para deletar
      vim.keymap.set('n', '<CR>', tree_api.node.open.edit, { buffer = bufnr, desc = 'NvimTree: Abrir/Editar' }) -- Remapeia Enter para abrir/editar
      vim.keymap.set('n', 'P', tree_api.node.navigate.parent_close, { buffer = bufnr, desc = 'NvimTree: Ir p/ pai e fechar' }) -- Exemplo de remapeamento

      -- Exemplo de remapeamento para Alt + r para renomear
      vim.keymap.set('n', '<A-r>', tree_api.node.rename, { buffer = bufnr, desc = 'NvimTree: Renomear (Alt+r)' })

      -- Você pode mapear para funções customizadas ou comandos do Nvim-Tree
      -- tree_api.node.open.vertical ou tree_api.node.open.horizontal
    end,
    -- ...
  },
}

-- Navegação:
-- h, l, j, k (ou setas): Mover para esquerda, direita, baixo, cima.
-- <CR> (Enter): Abrir arquivo ou expandir/contrair diretório.
-- o: Abrir o arquivo selecionado.
-- i: Abrir o arquivo em um novo split vertical.
-- s: Abrir o arquivo em um novo split horizontal.
-- v: Abrir o arquivo em um novo vertical split (similar a i no nvim-tree.lua).
-- gI: Abrir o arquivo em um novo buffer no tab atual (ignora splits existentes).
-- t: Abrir o arquivo em uma nova aba.
-- P: Ir para o pai do diretório atual.
-- . (ponto): Alternar visibilidade de arquivos ocultos (dotfiles).
-- f: Fuzzy find (usa Telescope se configurado para isso).
-- ?: Exibir a ajuda de atalhos do Nvim-Tree.
-- Manipulação de Arquivos/Diretórios:
-- a: Adicionar novo arquivo/diretório (digite / no final para criar diretório).
-- d: Deletar o item selecionado (com confirmação).
-- r: Renomear o item selecionado.
-- x: Recortar o item selecionado para o clipboard interno do Nvim-Tree.
-- c: Copiar o item selecionado para o clipboard interno do Nvim-Tree.
-- p: Colar o item do clipboard interno na localização atual.
-- y: Copiar o nome do arquivo para o clipboard do sistema.
-- Y: Copiar o caminho relativo do arquivo para o clipboard do sistema.
-- gy: Copiar o caminho absoluto do arquivo para o clipboard do sistema.
-- Outros:
-- R: Recarregar a árvore do diretório.
-- C: Mudar o diretório raiz do Nvim-Tree para o diretório do arquivo atual.
-- S: Alternar exibição de arquivos Git ignorados.
-- Para ver os atalhos reais na sua configuração:

-- Abra o Nvim-Tree (geralmente <leader>e no LazyVim).
-- Com o cursor na janela do Nvim-Tree, pressione ?. Uma janela de ajuda aparecerá com todos os atalhos configurados.
