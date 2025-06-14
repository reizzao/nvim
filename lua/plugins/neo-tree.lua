-- ~/.config/nvim/lua/plugins/neo-tree.lua

return {
  'nvim-neo-tree/neo-tree.nvim',
  branch = 'v3.x', -- Mantenha a branch correta para evitar problemas de compatibilidade
  dependencies = {
    'nvim-lua/plenary.nvim',
    'nvim-tree/nvim-web-devicons', -- Para ícones de arquivo (importante!)
    'MunifTanjim/nui.nvim',       -- Necessário para a interface do Neo-tree
  },
  -- Define os mapeamentos de teclado para o Neo-tree
  keys = {
    -- Atalho para alternar o Neo-tree (File Explorer)
    -- '<leader>e' é o atalho padrão do LazyVim para o explorador
    {
      '<leader>e',
      function()
        -- Esta função verifica se o Neo-tree está aberto e o alterna, ou o abre no modo de explorador de arquivos.
        if require('neo-tree.sources.filesystem').get_state().current_dir ~= nil then
          require('neo-tree.command').execute('focus')
        else
          require('neo-tree.command').execute('normal')
        end
      end,
      desc = 'Alternar Neo-tree (Explorer)',
    },
    -- Adicione aqui mapeamentos específicos para criar arquivos/diretórios diretamente
    -- Exemplo: <leader>nf para novo arquivo, <leader>nd para novo diretório
    { '<leader>nf', function() require('neo-tree.command').execute('create_file_prompt') end, desc = 'Novo Arquivo' },
    { '<leader>nd', function() require('neo-tree.command').execute('create_directory_prompt') end, desc = 'Novo Diretório' },
  },
  -- Opções de configuração do Neo-tree
  opts = {
    -- Define quais fontes de dados o Neo-tree deve exibir
    -- 'filesystem': explorador de arquivos
    -- 'buffers': lista de buffers abertos
    -- 'git_status': arquivos com status Git (modificados, não rastreados, etc.)
    -- 'diagnostics': problemas de linter/LSP
    sources = { 'filesystem', 'buffers', 'git_status', 'diagnostics' },
    -- Configurações padrão para componentes visuais
    default_component_configs = {
      container = {
        enable_treesitter_hl = true, -- Habilita destaque de sintaxe Tree-sitter
      },
      indent = {
        indent_size = 2,
        padding = 1,
        with_markers = true,
        indent_marker = '|',
        last_indent_marker = '└', -- Um marcador mais amigável para o último item
      },
      filesystem = {
        -- Itens filtrados (ocultos)
        filtered_items = {
          visible = true,
          hide_dotfiles = false, -- Mostrar arquivos ocultos (com .)
          hide_git_ignored = false, -- Mostrar arquivos ignorados pelo Git
          hide_by_name = {
            'node_modules',
            '.git',
            '.DS_Store',
            '__pycache__', -- Exemplo de pastas a ocultar
          },
        },
        follow_current_file = { enable = true }, -- Sincroniza a árvore com o arquivo atualmente aberto
        group_empty_dirs = false, -- Agrupa diretórios vazios
        cut_copy_paste = {
          settle_on_browse = false,
          mru_enabled = true,
          mru_marker = '󰆇 ', -- Ícone para 'Most Recently Used'
        },
      },
      buffers = {
        follow_current_path = true, -- Segue o caminho do buffer ativo
        group_by_dirname = true,    -- Agrupa buffers pelo diretório
        show_unloaded = true,
        separator = false,
      },
      git_status = {
        -- Configurações específicas para o status Git
      },
    },
    -- Configurações da janela do Neo-tree
    window = {
      position = 'left', -- Posição da janela (left, right, float, current)
      width = 30,        -- Largura da janela
      -- height = 0,     -- Altura automática
      mappings = {
        -- Mapeamentos de teclas que funcionam DENTRO do painel do Neo-tree
        ['<space>'] = 'none', -- Desabilita o leader para não conflitar com WhichKey dentro do Neo-tree
        ['l'] = 'open',        -- Abrir arquivo/diretório
        ['h'] = 'close_node',  -- Fechar nó (diretório)
        ['s'] = 'split_with_window',  -- Abrir arquivo em split horizontal
        ['v'] = 'vsplit_with_window', -- Abrir arquivo em split vertical
        ['t'] = 'tabnew_with_window', -- Abrir arquivo em nova aba
        ['<CR>'] = 'open',     -- Enter para abrir
        ['A'] = 'add_directory', -- Adicionar diretório (com prompt)
        ['a'] = 'add',         -- Adicionar arquivo/diretório (com prompt)
        ['d'] = 'delete',      -- Deletar
        ['r'] = 'rename',      -- Renomear
        ['c'] = 'copy',        -- Copiar
        ['x'] = 'cut',         -- Recortar
        ['p'] = 'paste',       -- Colar
        ['S'] = 'toggle_split', -- Alterna o split para o arquivo selecionado
        ['<bs>'] = 'navigate_up', -- Voltar para o diretório pai
        ['.'] = 'set_root',    -- Define o diretório selecionado como raiz da árvore
        ['R'] = 'refresh',     -- Atualizar a árvore
        ['?'] = 'show_help',   -- Mostrar ajuda de mapeamentos
        ['<'] = 'prev_source', -- Trocar para a fonte anterior (filesystem, buffers, git)
        ['>'] = 'next_source', -- Trocar para a próxima fonte
      },
    },
  },
  -- Comando de linha que pode ser usado: :Neotree
  cmd = 'Neotree',
}