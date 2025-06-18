# README - CUSTOM NVIM

Adicionar apos novas Formatacoes :
- Pastas: plugins/ + custom/ + utils/

- No init lua: `
-- === PERSONAL INIT LUA =======================================================
-- : no init.lua :: carregar o utils/loader que carrega todos os modulos em /custom
-- Requer o módulo loader
local custom_loader = require('utils.loader')

-- Define o caminho para sua pasta custom
local custom_dir = vim.fn.stdpath('config') .. '/lua/custom'

-- Carrega todos os arquivos .lua de lua/custom/
custom_loader.load_directory(custom_dir, 'custom')

--
-- ~/.config/nvim/init.lua ou lua/config/options.lua
-- === FINAL PERSONAL INIT LUA =================================================
`


Ja_Vem_Intalados:
  - Explorer: nvim-tree
  - Auto_Pair: para fechamento de chaves

---

Tutoriais :
 - Keymaps : [refatoracao keymaps em vim.setKeymaps](https://g.co/gemini/share/9d23569bfae3)
