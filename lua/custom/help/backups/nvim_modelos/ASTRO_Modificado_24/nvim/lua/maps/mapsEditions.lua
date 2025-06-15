-- Maps EDITIONS --

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

-- Deletar Linha --
vim.cmd([[
  nnoremap dd dd<CR>
  inoremap dd <Esc>dd<CR>
  vnoremap dd dd<Esc>i
]])

-- Refazer : alem de refazer >> tambem é solucao para conflito de zoom do terminator --
vim.cmd([[ map <C-r> g+ ]])
vim.cmd([[ nnoremap <C-r> g+ ]])
vim.cmd([[ inoremap <C-r> <Esc>g+ ]])
vim.cmd([[ vnoremap <C-r> <Esc>g+ ]])

-- Sair Forçado --
vim.cmd([[ map <A-q> :q!<CR> ]])
vim.cmd([[ nnoremap <A-q> :q!<CR> ]])
vim.cmd([[ inoremap <A-q> <Esc>:q!<CR>l ]])
vim.cmd([[ vnoremap <A-q> <Esc>:q!<CR> ]])


-- Selecionar Tudo
vim.cmd([[ map <C-a> ggVG ]])

-- Refazer C-Z --
vim.cmd([[ map <C-z> :undo<CR> ]])
vim.cmd([[ nnoremap <C-z> :undo<CR> ]])
vim.cmd([[ inoremap <C-z> <Esc>:undo<CR>l ]])
vim.cmd([[ vnoremap <C-z> <Esc>:undo<CR> ]])

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

-- Movimentacoes --
-- Mover linhas --
vim.cmd([[
  nnoremap <S-down> :m .+1<CR>==
  nnoremap <S-up> :m .-2<CR>==
  inoremap <S-down> <Esc>:m .+1<CR>==gi
  inoremap <S-up> <Esc>:m .-2<CR>==gi
  vnoremap <S-down> :m '>+1<CR>gv=gv
  vnoremap <S-up> :m '<-2<CR>gv=gv
]])

-- Redimensionar janelas >Somente com SETAS LATERAIS em Normal mode > tanto painel e terminal --
vim.cmd([[
  nnoremap <C-up>    :resize -2<CR>
  nnoremap <C-down>  :resize +2<CR>
  nnoremap <C-left>  <Esc>:vertical resize -2<CR>
  nnoremap <C-right> <Esc>:vertical resize +2<CR>
]])





