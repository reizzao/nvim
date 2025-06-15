-- ~/.config/nvim/lua/custom/core/keymaps/init.lua

-- Este é o módulo agregador para todos os mapeamentos categorizados.
-- Ele carrega os mapeamentos de cada arquivo de categoria e os consolida.

local M = {}

M.keymaps = {} -- Tabela principal que conterá todos os mapeamentos categorizados

-- Carrega e adiciona mapeamentos de cada categoria
-- O 'require' usa o caminho relativo a 'lua/'
M.keymaps.editing = require("custom.core.keymaps.editing")
M.keymaps.movement = require("custom.core.keymaps.movement")
M.keymaps.resizing = require("custom.core.keymaps.resizing")
M.keymaps.searching = require("custom.core.keymaps.searching")
M.keymaps.plugins = require("custom.core.keymaps.plugins") -- Mapeamentos de plugins como LSP, Terminal, Git

-- Adicione mais categorias aqui conforme necessário

-- Retorna a tabela principal com todas as categorias de mapeamentos.
return M