" colors/meu_tema.vim

" Limpa quaisquer destaques existentes (redundante, mas seguro)
highlight clear
if exists("syntax_on")
  syntax reset
endif

" Set options
set background=dark " ou light, dependendo do seu tema
" set termguicolors " (já setado no init.lua, mas pode ser útil aqui para depurar)

" Carrega o tema Lua
lua require('colorschemes.meu_tema') " <<--- Este nome deve ser o do seu arquivo Lua!