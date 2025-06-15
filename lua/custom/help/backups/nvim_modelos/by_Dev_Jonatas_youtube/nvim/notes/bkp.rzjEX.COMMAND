 -- COMMAND :: COMANDOS
-- print("vindo do file:: debug.getinfo(1).source")

-- Vars locais mapeando api vim para usar neste arquivo
local api = vim.api
local opt = vim.opt
local g = vim.g
local cmd = vim.cmd

local M = {}

function M.setup_options()
  -- Opções Globais (vim.o / opt)
  -- Essas configurações afetam o Neovim como um todo.

  -- DESIGNS --
  cmd([[ set guicursor= ]])        -- assume o I-Beam(após vc configurar no terminal em uso o cursor como I-Beam) > Esconde o cursor piscando (se estiver usando GUI)
  opt.background = "dark"         -- Define o fundo como escuro (pode ser "light")
  -- LINHAS
  opt.relativenumber = true       -- Mostra números de linha relativos
  -- cmd([[ set number  ]])          -- mostrar numero das linhas : Show line numbers
  cmd([[ set showtabline=1 ]])    -- Sempre mostrar guias e a quantidade de tabs : Always show tabs
  cmd([[ set nowrap ]])           -- Exibir linhas longas como apenas uma linha : Display long lines as just one line
  -- cmd([[ set cursorline ]])       -- Ativar destaque da linha atual : TODO: ESTA FAZENDO LINHA - MELHOR DESTACAR MASI GORDINHA
  -- opt.colorcolumn = "80"       -- Destaca a coluna 80 (para guias de código)
  -- opt.syntax = "on"            -- Habilita o realce de sintaxe

  cmd([[ syntax enable  ]])       -- Habilitar syntax highlighing
  cmd([[ set autowriteall ]])     -- AutoSave - TODO NAO FUNCIONANDO --
  cmd([[ let extension = expand('%:e') ]])
  cmd([[ let filenamev = expand('%:t') ]])
  -- SET MAPLEADER -> TODO
  -- cmd([[ set noswapfile ]])            -- desabilita criação de arquivo  backup .swp
  cmd([[ confirm ]])                      -- pede confirmações antes de ação
  cmd([[ set title ]])                    -- mostra titulo ???
  -- CODIFICACA
  cmd([[ set encoding=utf-8  ]])          -- A codificação exibida : The encoding displayed
  cmd([[ set pumheight=10 ]])             -- Makes popup menu smaller : tornar menu popup menor
  cmd([[ set fileencoding=utf-8  ]])      -- Codificação de arquivo (específico)
  cmd([[ set cmdheight=1 ]])              -- Mais espaço para exibição de mensagens : More space for displaying messages
  cmd([[ set iskeyword+=- ]])             -- tratar palavras separadas por travessão como um objeto de texto de palavra : treat dash separated words as a word text object

  cmd([[ set mouse=a ]])                   --  Habilita o mouse em todos os modos
  cmd([[ set splitbelow ]])                -- As divisões horizontais estarão automaticamente abaixo : Horizontal splits will automatically be below
  cmd([[ set splitright  ]])               -- Vertical splits will automatically be to the right

  cmd([[ set t_Co=256 ]])                  -- Suporta 256 cores : Support 256 colors
  cmd([[ set conceallevel=0 ]])            -- Para que eu possa ver  em arquivos markdown : So that I can see in markdown files
  -- IDENTACAO
  cmd([[ set tabstop=4 ]])                 -- Insert 2 spaces for a tab
  cmd([[ set shiftwidth=2 ]])              -- Alterar o número de caracteres de espaço inseridos para recuo : Change the number of space characters inserted for indentation

  cmd([[ set smarttab ]])                 -- Torna a tabulação mais inteligente e perceberá que você tem 2 contra 4 : Makes tabbing smarter will realize you have 2 vs 4
  cmd([[ set expandtab ]])                -- Usa espaços em vez de tabs : Converts tabs to spaces
  cmd([[ set smartindent ]])              -- Torna o recuo inteligente : Makes indenting smart
  cmd([[ set autoindent ]])               -- Bom recuo automatico : Good auto indent
  cmd([[ set laststatus=0 ]])             -- Sempre exibir a linha de status : Always display the status line
  cmd([[ set ruler ]])                    -- Mostrar a posição do cursor o tempo todo: Show the cursor position all the time

  opt.termguicolors = false        -- Habilita cores verdadeiras no terminal
  -- opt.signcolumn = "yes"          -- Sempre mostra a coluna de sinais
  opt.wrap = false                -- Quebra de linha
  opt.linebreak = true            -- Quebra de linha em caracteres completos
  opt.showbreak = "↳ "            -- Caractere para indicar quebra de linha

  opt.undofile = true             -- Persiste o histórico de undo
  opt.undodir = os.getenv("HOME") .. "/.cache/nvim/undo" -- Onde armazenar os arquivos de undo
  opt.ignorecase = true           -- Ignora maiúsculas/minúsculas em buscas
  opt.smartcase = true            -- Smartcase (ignora maiúsculas/minúsculas a menos que haja maiúsculas na busca)

  opt.updatetime = 300            -- Tempo para gravar swapfile e emitir CursorHold
  opt.timeoutlen = 500            -- Tempo limite para keycodes mapeados
  opt.writebackup = false         -- Não cria arquivo de backup antes de sobrescrever
  opt.swapfile = true            -- Não cria arquivos de swap
  opt.backspace = "indent,eol,start" -- Comportamento da tecla backspace
  opt.history = 500               -- Quantidade de comandos na história

  -- COMPARTILHAMENTO - INTEGRACOES --
  cmd([[ set clipboard=unnamedplus ]])    -- compartilhar de área de transferência entre o Vim e o Linux



    -- TABS VER O MELHOR
    -- opt.tabstop = 2                 -- Tamanho do tab
    -- opt.shiftwidth = 2              -- Tamanho do indent
    -- opt.autoindent = true           -- Indentação automática
    -- opt.smartindent = true          -- Indentação inteligente


    -- TODO: NAO SEI O SIGNIFICADO
    -- opt.hlsearch = true             -- Realça resultados de busca
    -- opt.incsearch = true            -- Busca incremental
    -- opt.inccommand = "split"        -- Preview de substituições em tempo real
    -- opt.scrolloff = 8               -- Linhas de contexto acima/abaixo do cursor
    -- opt.sidescrolloff = 8           -- Colunas de contexto à esquerda/direita
    -- opt.clipboard = "unnamedplus"   -- Sincroniza o clipboard do sistema
    -- opt.conceallevel = 0            -- Nível de ocultação de caracteres




  -- Opções de Janela (vim.wo / opt_local)
  -- Estas afetam apenas a janela atual. Usamos opt aqui, mas se você precisar definir
  -- para um buffer específico, usaria vim.bo.
  -- Para a maioria das configurações de UI, opt é suficiente e aplica globalmente.

  -- Exemplo: (geralmente não é necessário definir w/b opções aqui a menos que
  -- você tenha um script que abre janelas ou buffers específicos com opções específicas)
  -- opt_local.list = true
  -- opt_local.listchars = "tab:» ,trail:·"

  -- Define uma função de comando personalizada se quiser um atalho para ativar/desativar algo
  -- Isso não é uma "opção", mas um comando customizado.
  api.nvim_create_user_command("ToggleRelativeNumber", function()
    opt.relativenumber = not opt.relativenumber:get()
  end, { desc = "Toggle relative line numbers" })

  -- Define atalhos para comandos customizados, se quiser
  vim.keymap.set("n", "<leader>r", ":ToggleRelativeNumber<CR>", { desc = "Toggle relative line numbers" })

  -- Confirma que as opções foram carregadas
  vim.notify("Aviso: Opções básicas do Neovim configuradas!", vim.log.levels.INFO, { title = "Config" })
end

return M

