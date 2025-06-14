-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

vim.g.guicursor = ""          -- depois $`reset` no terminal para assumir o cursor fininho : < IBeam > configurado no terminal.
vim.g.mapleader = " "         -- Define a tecla 'leader' (geralmente configurado em um local anterior, como init.lua do LazyVim)

-- AREA TRANSFERENCIA NVIM >> LINUX --
vim.cmd([[ set clipboard=unnamedplus ]])   -- compartilhar de área de transferência entre o Vim e o Linux

-- Salvar --
vim.cmd([[
  nnoremap <C-s> :w<CR>
  inoremap <C-s> <Esc>:w<CR>l
  vnoremap <C-s> <Esc>:w<CR>
]])

-- Copiar >> Colar -- Volta em modo insert --
vim.cmd([[
  noremap <C-c> "+y
  inoremap <C-c> "+y<CR>

  noremap <C-v> "+p
  inoremap <C-v> <Esc>"+p<Esc>i
]])

-- Defazer :TODO: alem de refazer >> tambem é solucao para conflito de zoom do terminator --
vim.cmd([[ map <C-S-z> g+ ]])
vim.cmd([[ nnoremap <C-S-z> g+ ]])
vim.cmd([[ inoremap <C-S-z> <Esc>g+ ]])
vim.cmd([[ vnoremap <C-S-z> <Esc>g+ ]])

-- Refazer C-Z --
vim.cmd([[ map <C-z> :undo<CR> ]])
vim.cmd([[ nnoremap <C-z> :undo<CR> ]])
vim.cmd([[ inoremap <C-z> <Esc>:undo<CR>l ]])
vim.cmd([[ vnoremap <C-z> <Esc>:undo<CR> ]])

-- Selecionar Tudo
vim.cmd([[ map <C-a> ggVG ]])

-- BUFFERS --
-- proximo buffer
vim.cmd([[ map <S-Tab> :bnext<CR> ]])
-- deletar buffer
vim.cmd([[ map <A-w> :bdelete<CR> ]])

-- identar >> iEsta funcionando com  Maior e Menor Que < > sendo com alt ou ctrl ou sozinho rs --
vim.cmd([[
  nnoremap . >>
  nnoremap , <<

  inoremap <C-.> <Esc><gv
  inoremap <C-,> <Esc>>gv

  vnoremap , <gv
  vnoremap . >gv
 ]])

 -- TABS --
 vim.cmd([[
   noremap <Tab> :tabnext<CR>
   ]])

-- TRANSFORMAR -> TOGGLE ==> MAIUSCULA -> MINUSCULA
-- uso: só colocar o cursor no meio do texto e executar o atalho
-- todo: esta funcionando somente Maiusculo
vim.cmd([[
  inoremap <C-u> <ESC>viwUi " pra maiuscula em insert
  nnoremap <C-u> viwU<Esc> " pra minuscula em normal
]])

-- SUBSTITUIÇÃO TODAS OCORRENCIAS DIGITADAS
-- para usar execute o atalho -> volte uma barra com a seta e digite A PROCURA -> após a proxima barra digite o que  vai substituir a procura encontrada
vim.cmd([[
  nnoremap <A-s> :%s///g<Left><Left>
  nnoremap <A-sc> :%s///gc<Left><Left><Left>

  xnoremap <A-s> :s///g<Left><Left>
  xnoremap <A-sc> :s///gc<Left><Left><Left>

  vnoremap * y/\V<C-R>=escape(@",'/\')<CR><CR>

]])



