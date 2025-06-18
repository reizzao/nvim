# 💤 README CUSTOM NOTES
---
# README - CUSTOM NVIM

Instalar:

A starter template for [LazyVim](https://github.com/LazyVim/LazyVim).
Refer to the [documentation](https://lazyvim.github.io/installation) to get started.

---

Todo:

# Plugins
> Baixar os Plugins:
  * Para_Multi_Cursor: `nvim-next`
      * Nota: // O Neovim não tem multi-cursor nativo como VSCode. -- Isso é uma simulação via mapeamentos de movimento. -- Para multi-cursor verdadeiro, use plugins como 'nvim-next'.

---

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

* Informacoes [
  - Custom: [a lua/custom está presente em todos nvim há utilizar ]
  - ConteudoCustom: [ contem a help/ ., ]
  - ConteudoHelp: [ contem backups de configuracoes vim,conceitos vim puro, vim modernizado para neovim, ]
]

---
* Tarefas_essenciais
  - Apos_Formatacao: [
      - Clonar: e colar a pasta nvim no nvim instalado.
      - Chamar_Custom: add ao init.lua da raiz a chamada para o custom `require("custom.main")` 
  ]


