" colors/theme_tokyo.vim

highlight clear
if exists("syntax_on")
  syntax reset
endif
set background=dark
lua require('colorschemes.theme_tokyo') " <<--- Este nome deve ser o do seu arquivo Lua!