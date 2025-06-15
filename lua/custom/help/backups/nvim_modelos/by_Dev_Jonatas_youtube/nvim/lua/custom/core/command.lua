 -- COMMAND :: COMANDOS
-- print("vindo do file:: debug.getinfo(1).source")

-- Vars locais mapeando api vim para usar neste arquivo
local api = vim.api
local opt = vim.opt
local g = vim.g
local cmd = vim.cmd

  -- CONFIGS

  -- VIM GLOBAL ---------------------------
vim.g.mapleader = " "        -- tecla leader a master para atalhos
vim.g.maplocalleader = " "
vim.g.guicursor= ""          -- cursor I-Beam - Fino piscante - dê $`reset` no terminal. `cmd([[ set guicursor= ]]) -- guicursor igual a nada`

-- VIM OPTIONS ---------------------------
opt.timeoutlen = 300         -- Diminui o tempo de espera da sequência mapeada
opt.cursorline = true         -- Mostra em qual linha o cursor está
opt.scrolloff = 10            -- Número mínimo de linhas na tela para manter acima e abaixo do cursor.
opt.inccommand = "split"      -- Pré-visualiza substituições em tempo real, enquanto você digita!

opt.number = true            -- Exibir números de linha por padrão
opt.relativenumber = true    -- adicionar números de linha relativos, para ajudar com saltos.
opt.mouse = "a"              -- Habilita o modo mouse
opt.showmode = false         -- Não exibe o modo, pois já está na linha de status


opt.clipboard = "unnamedplus" -- Sincroniza a área de transferência entre o sistema e o Neovim.
opt.breakindent = true        -- Habilita o recuo de quebra

opt.splitright = true         -- Configura como novas divisões devem ser abertas
opt.splitbelow = true

opt.list = true               -- Define como o Neovim exibirá certos caracteres de espaço em branco no editor.
opt.listchars = { tab = "» ", trail = "·", nbsp = "␣" }


--- Mapeamentos de Teclas Básicos
-- Veja `:help vim.keymap.set()`

-- Define destaque na busca, mas limpa ao pressionar <Esc> no modo normal
opt.hlsearch = true
vim.keymap.set("n", "<Esc>", "<cmd>nohlsearch<CR>")



  opt.termguicolors = false        -- Habilita cores verdadeiras no terminal
  -- opt.signcolumn = "yes"          -- Sempre mostra a coluna de sinais - todo? como deixar falso
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

  -- TABS CONFIG
  opt.tabstop = 2                 -- Tamanho do tab
  opt.shiftwidth = 2              -- Tamanho do indent
  opt.autoindent = true           -- Indentação automática
  opt.smartindent = true          -- Indentação inteligente


  -- TODO: ALGUNS NAO SEI O SIGNIFICADO
  opt.hlsearch = true             -- Realça resultados de busca
  opt.incsearch = true            -- Busca incremental
  opt.inccommand = "split"        -- Preview de substituições em tempo real
  opt.scrolloff = 8               -- Linhas de contexto acima/abaixo do cursor
  opt.sidescrolloff = 8           -- Colunas de contexto à esquerda/direita
  opt.clipboard = "unnamedplus"   -- Sincroniza o clipboard do sistema
  opt.conceallevel = 0            -- Nível de ocultação de caracteres



  -- Opções de Janela (vim.wo / opt_local)
  -- Estas afetam apenas a janela atual. Usamos opt aqui, mas se você precisar definir
  -- para um buffer específico, usaria vim.bo.
  -- Para a maioria das configurações de UI, opt é suficiente e aplica globalmente.

  -- Exemplo: (geralmente não é necessário definir w/b opções aqui a menos que
  -- você tenha um script que abre janelas ou buffers específicos com opções específicas)
  -- opt_local.list = true
  -- opt_local.listchars = "tab:» ,trail:·"




-- return M
-- end
-- FIM FUNCAO
