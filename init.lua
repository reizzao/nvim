-- init.lua

-- Carrega a função de carregamento que criamos
local loader = require('custom.utils.loader')

-- --- Configurações Core ---
-- Certifique-se de que 'termguicolors' esteja true aqui para que as cores funcionem
loader.load_directory('custom.core')

-- --- Def Tema Padrao (Colorscheme) ---
-- Para um tema do GitHub (ex: catppuccin): -- Certifique-se de ter o plugin instalado primeiro! -Obs: este nao precisa de estar compativel na pasta colors/
vim.cmd("colorscheme catppuccin")
-- vim.cmd("colorscheme theme_tokyo")
-- vim.cmd("colorscheme meu_tema")


-- vim.cmd("colorscheme catppuccin")

-- --- Mapeamentos de Tecla ---
loader.load_directory('custom.keymaps')

-- --- Plugins ---
loader.load_directory('custom.plugins')

-- --- Configuração LSP (Language Server Protocol) ---
loader.load_directory('custom.lsp')

-- --- Configurações de Tipo de Arquivo (Filetype Plugins) ---
loader.load_directory('custom.ftplugins')
