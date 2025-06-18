-- bootstrap lazy.nvim, LazyVim and your plugins
require("config.lazy")

-- : no init.lua :: carregar o utils/loader que carrega todos os modulos em /custom
-- Requer o módulo loader
local custom_loader = require('utils.loader')

-- Define o caminho para sua pasta custom
local custom_dir = vim.fn.stdpath('config') .. '/lua/custom'

-- Carrega todos os arquivos .lua de lua/custom/
custom_loader.load_directory(custom_dir, 'custom')

--
-- ~/.config/nvim/init.lua ou lua/config/options.lua
