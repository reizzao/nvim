-- CONFIGURACOES

vim.g.guicursor = "" -- depois $`reset` no terminal para assumir o cursor fininho : < IBeam > configurado no terminal.

-- Leaders : mapleader use como <leader>, segundo leader use <LocalLeader> (que agora é Alt)
vim.g.mapleader = " "
vim.g.maplocalleader = "<Esc>" -- segundo leader use como <LocalLeader> (que agora é Alt)
-- Definir a tecla leader local como o caractere de Escape.-- Isso é o que permite usar Alt como prefixo para mapeamentos.

-- ** Copiar para o Clipboard do Sistema **
-- Esta linha é CRUCIAL e deve estar ativa.
vim.cmd([[ set clipboard=unnamedplus ]])

-- Os comandos padrão 'y' (yank), 'd' (delete), 'p' (paste)
-- AGORA usarão o clipboard do sistema (o mesmo que Ctrl+C/Ctrl+V fora do Neovim)
vim.keymap.set("n", "Y", "yy", { desc = "Copiar linha inteira para o clipboard do sistema" })

-- Seus mapeamentos podem ser simplificados (opcional, os seus funcionam mas são redundantes):
vim.keymap.set("n", "<LocalLeader>y", '"+y', { desc = "Copiar para o clipboard do sistema" })
vim.keymap.set("n", "<LocalLeader>p", '"+p', { desc = "Colar do clipboard do sistema" })

-- ARQUIVO
-- =============================================
-- =============================================

-- ** Desfazer (Undo) **
-- Mapeia Ctrl-z para 'u' (undo padrão) nos modos Normal, Visual e Visual-Linha.
-- 'u' no modo visual/visual-linha desfaz a última alteração feita na seleção.
-- Obs: o Ctr+z é problematico para o vim - então use leader+u pra desfazer
vim.keymap.set({ "n", "v", "x" }, "<leader>u", "u", { desc = "Desfazer (Ctrl-z)" })

-- ** Refazer (Redo) **
-- Mapeia Ctrl-r para '<C-r>' (redo padrão) nos modos Normal, Visual e Visual-Linha.
-- '<C-r>' é o comando nativo para refazer. --
vim.keymap.set({ "n", "v", "x" }, "<C-r>", "<C-r>", { desc = "Refazer (Ctrl-r) - Padrão Vim" })
-- Refazer (Space + r) -- Obs: o Ctr+s+z é problematico para o vim - então use leader+r pra refazer
vim.keymap.set({ "n", "v", "x" }, "<leader>r", "<C-r>", { desc = "Refazer (Leader-r)" })

vim.keymap.set("n", "C-s", ":w<CR>", { desc = "Salvar arquivo." })
-- =============================================
-- SAIR
-- =============================================
vim.keymap.set("n", "<leader>qa", ":qa!<CR>", { desc = "Matar SAIR SEM SALVAR do editor neovim" }) -- TODO: ATALHO
vim.keymap.set("n", "<leader>wq", ":wq!<CR>", { desc = "Sair Salvando do Editor Neovim" })
vim.api.nvim_set_keymap(
  "n",
  "<leader>qb",
  "<Cmd>wq!<CR>",
  { noremap = true, silent = true, desc = "Fechar aba buffer em foco salvando" }
) -- TODO Não precisa faz o mesmo de fechar o editor salvando.

-- BUFFERS --
-- proximo buffer
vim.cmd([[ map <S-Tab> :bnext<CR> ]])
-- deletar buffer
vim.cmd([[ map <A-w> :bdelete<CR> ]])

-- ** Fechar TODOS os Buffers e Abrir um Novo Vazio **
-- Mapeamos Alt + q a para a nova função close_all_buffers.
vim.keymap.set("n", "<A-q>", function()
  buffers_utils.close_all_buffers(false) -- `false` para não forçar em buffers modificados
end, { desc = "Fechar todos os buffers e abrir novo vazio" })

-- Opcional: Versão que força o fechamento de todos os buffers (ignora alterações não salvas)
vim.keymap.set("n", "<M-qA>", function() -- Usando Alt + Shift + q + A para forçar
  buffers_utils.close_all_buffers(true) -- `true` para forçar o fechamento
end, { desc = "Fechar todos os buffers (FORÇAR) e abrir novo vazio" })

-- Mapear jj para sair do modo de inserção (como Esc)
vim.keymap.set("i", "jj", "<Esc>", { desc = "Sair do modo de inserção" })

-- Mapear uma função Lua para recarregar o arquivo de configuração do Neovim
vim.keymap.set("n", "<leader>rc", function()
  vim.cmd("source " .. vim.fn.stdpath("config") .. "/init.lua")
  vim.notify("Configuração recarregada!", vim.log.levels.INFO)
end, { desc = "Recarregar config do Neovim" })

-- Mapeamento para copiar o caminho completo do arquivo atual
vim.keymap.set("n", "<leader>cp", function()
  local file_path = vim.fn.expand("%:p") -- Obtém o caminho completo do arquivo
  vim.fn.setreg("+", file_path) -- Copia para o registrador do sistema (clipboard)
  vim.notify("Caminho do arquivo copiado!", vim.log.levels.INFO)
end, { desc = "Copiar caminho completo do arquivo" })

-- Exemplos adicionais para recuperar outros atalhos comuns, se necessário:
-- Mover para o início da linha (primeiro caractere não-branco)
-- Se algum plugin anular '<Home>' ou '0' ou '^'
vim.keymap.set("n", "<Home>", "^", { desc = "Início da linha (primeiro char nao-branco)" })
vim.keymap.set("n", "0", "0", { desc = "Início absoluto da linha" })

-- Mover para o fim da linha
-- Se algum plugin anular '<End>' ou '$'
vim.keymap.set("n", "<End>", "$", { desc = "Fim da linha" })

-- Voltar uma palavra
-- Se algum plugin anular 'b'
vim.keymap.set("n", "b", "b", { desc = "Voltar uma palavra" })

-- Próxima palavra
-- Se algum plugin anular 'w'
vim.keymap.set("n", "w", "w", { desc = "Próxima palavra" })

-- Recarregar o arquivo atual sem salvar (descartar alterações)
-- Se algum plugin anular ':e!'
vim.keymap.set("n", "<leader>eR", ":e!<CR>", { desc = "Recarregar arquivo (descartar alterações)" })

vim.keymap.set("n", "<A-a>", "ggVG", { desc = "Selecionar Tudo (Alt+a)" })

-- LINHA -----------------------------------------------------------------------
-- Deletar Linha --
vim.cmd([[
  nnoremap <A-d> dd<CR>
  inoremap <A-d> <Esc>dd<CR>
  vnoremap <A-d> dd<Esc>i
]])

-- identar >> Esta funcionando com  Maior e Menor Que < > sendo com alt ou ctrl ou sozinho rs --
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
  inoremap <A-m> <ESC>viwUi " pra maiuscula em insert
  nnoremap <A-m> viwU<Esc> " pra minuscula em normal
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

-- MOVIMENTACOES ---------------------------------------------------------------
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

vim.api.nvim_set_keymap("n", "<A-Up>", "<Cmd>0<CR>", { noremap = true, silent = true, desc = "Início do Arquivo" })
vim.api.nvim_set_keymap("n", "<A-Down>", "<Cmd>$<CR>", { noremap = true, silent = true, desc = "Fim do Arquivo" })

vim.api.nvim_set_keymap(
  "n",
  "<A-e>",
  "<Cmd>Ex<CR>",
  { noremap = true, silent = true, desc = "explorer nativo netwr :Ex" }
)

---
