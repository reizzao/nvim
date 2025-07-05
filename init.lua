-- init.lua

-- Carrega a função de carregamento que criamos
local loader = require('utils.loader')

-- --- Configurações Core ---
-- Certifique-se de que 'termguicolors' esteja true aqui para que as cores funcionem
loader.load_directory('core')

-- --- Def Tema Padrao (Colorscheme) ---
-- Para um tema do GitHub (ex: catppuccin): -- Certifique-se de ter o plugin instalado primeiro! -Obs: este nao precisa de estar compativel na pasta colors/
vim.cmd("colorscheme catppuccin")  " [ON]]
-- vim.cmd("colorscheme theme_tokyo") " [OFF : TODO]]
-- vim.cmd("colorscheme meu_tema") " [OFF : TODO]]


-- vim.cmd("colorscheme catppuccin")

-- --- Mapeamentos de Tecla ---
loader.load_directory('keymaps')

-- --- Plugins ---
loader.load_directory('plugins')

-- --- Configuração LSP (Language Server Protocol) ---
loader.load_directory('lsp')

-- --- Configurações de Tipo de Arquivo (Filetype Plugins) ---
loader.load_directory('ftplugin')
