-- CONFIGURACOES

vim.g.guicursor = "" -- depois $`reset` no terminal para assumir o cursor fininho : < IBeam > configurado no terminal.
vim.g.mapleader = " " -- Define a tecla 'leader' (geralmente configurado em um local anterior, como init.lua do LazyVim)

-- ajudas : { "n", "v", "x", "i" } - objeto todos modos -
-- set_keymap("n", "<A-q>", "<cmd>wq!<CR>", "Salvar e sair")

vim.cmd([[ set clipboard=unnamedplus ]]) -- compartilhar de área de transferência entre o Vim e o Linux

-- ARQUIVO ---------------------------------------------------------------------

-- Salvar
vim.keymap.set({ 'n', 'i', 'v' }, '<C-s>', function()
  vim.cmd('w')
  if vim.api.nvim_get_mode().mode == 'i' then
    vim.schedule(function()
      vim.api.nvim_feedkeys('l', 'n', false) -- Volta para a posição original no modo Inserção
    end)
  end
end, { desc = "Salvar arquivo" })
-- Nota: Para o modo visual, o :w não precisa de <Esc> antes.
-- A função anônima permite lógica condicional para o modo de inserção.

---

-- Copiar para o clipboard do sistema
vim.keymap.set({ 'n', 'v' }, '<C-c>', '"+y', { desc = "Copiar para clipboard" })
-- No modo de inserção, <C-c> já é um atalho padrão do Neovim para sair,
-- então mapeá-lo para copiar pode ser um conflito. Se você realmente precisa copiar
-- no modo de inserção, é melhor usar outro atalho ou considerar se é o melhor fluxo de trabalho.
-- Para manter a funcionalidade original de copiar e voltar para o modo de inserção,
-- uma combinação como <C-v><C-c> pode ser mais segura, mas por simplicidade,
-- para copiar, geralmente se sai do modo inserção, copia, e volta,
-- ou usa uma seleção visual.
-- Se desejar copiar no modo de inserção, pode ser assim (mas repense a usabilidade):
-- vim.keymap.set('i', '<C-c>', '<Esc>"+y', { desc = "Copiar no modo Insert (com saída temporária)" })
-- No entanto, copiar do modo de inserção geralmente não faz sentido, já que você está digitando.
-- O mais comum é sair, selecionar e copiar, ou usar um plugin de autocompleção para snippets.


-- Colar do clipboard do sistema
vim.keymap.set({ 'n', 'v' }, '<C-v>', '"+p', { desc = "Colar do clipboard" })
-- Para colar no modo de inserção e voltar para o modo de inserção:
vim.keymap.set('i', '<C-v>', '<Esc>"+pi', { desc = "Colar do clipboard e voltar para Insert" })


---

-- Desfazer (Undo): Solução para conflito de zoom do Terminator e Desfazer
-- O `g+` é geralmente para `redo` de mudanças no jumplist, não para desfazer/refazer.
-- Se a intenção é `refazer`, use `redo`.
-- Para o conflito do Terminator, é mais comum remapear o atalho do Terminator ou do Neovim
-- para evitar que `Ctrl+Shift+Z` seja interpretado pelo terminal para zoom.
-- O comando `undo` é para desfazer (`<C-z>`), e `redo` (ou `u` no normal mode) é para refazer.
-- `g+` move para frente na lista de alterações, `g-` move para trás.

-- Vamos assumir que você queria refazer, ou ter uma alternativa ao `Ctrl-Shift-Z` do Terminator.
-- Se `Ctrl-Shift-Z` é para o "refazer" do Vim, o padrão é `<C-r>`.
-- Usaremos `<leader>z` para "desfazer" e `<leader>Z` para "refazer" (ou `<C-r>`).

-- Refazer: Como `g+` normalmente move para frente na lista de alterações.
-- Se a intenção é o *redo*, o padrão do Vim é `<C-r>`.
-- Mapeando `<C-S-z>` para o comando de *redo* do Vim.
vim.keymap.set({ 'n', 'v' }, '<C-S-z>', '<C-r>', { desc = "Refazer (Redo)" })
vim.keymap.set('i', '<C-S-z>', '<Esc><C-r>i', { desc = "Refazer (Redo) no modo Insert" })
-- Se o seu terminal ainda capturar <C-S-z> (Ctrl+Shift+Z), você pode precisar
-- reconfigurar o terminal ou escolher um atalho diferente.

---

-- Desfazer: O padrão é 'u' no modo normal.
-- Se você quiser <C-z> para "undo", o Neovim já tem um padrão, mas pode ser remapeado.
vim.keymap.set({ 'n', 'v' }, '<C-z>', ':undo<CR>', { desc = "Desfazer (Undo)" })
vim.keymap.set('i', '<C-z>', '<Esc>:undo<CR>a', { desc = "Desfazer (Undo) no modo Insert" })
-- Use 'a' ou 'l' para voltar para o modo Insert, dependendo se você quer antes ou depois do undo.
-- 'a' (append) para ficar depois, 'i' (insert) para ficar antes.

---

-- Selecionar Tudo
vim.keymap.set({ 'n' }, '<C-a>', 'ggVG', { desc = "Selecionar tudo" })
-- Nota: 'ggVG' funciona apenas no modo normal. No modo visual, 'V' já é seleção de linha.
-- 'ggVG' leva ao início do arquivo (gg), seleciona em modo visual de linha (V),
-- e vai até o final do arquivo (G).



-- BUFFERS --
-- proximo buffer
vim.cmd([[ map <S-Tab> :bnext<CR> ]])
-- deletar buffer
vim.cmd([[ map <A-w> :bdelete<CR> ]])

vim.api.nvim_set_keymap("n", "<A-q>", "<Cmd>q!<CR>", { noremap = true, silent = true, desc = "Fechar aba em foco" })

-- LINHA -----------------------------------------------------------------------

-- Deletar Linha
vim.keymap.set({ 'n', 'v' }, '<A-d>', 'dd', { desc = "Deletar linha" })
-- Para o modo de inserção, o comportamento é um pouco diferente:
-- Você precisa sair do modo inserção, deletar a linha e, opcionalmente, voltar.
-- Usaremos 'i' para voltar ao modo de inserção, posicionando o cursor antes da próxima linha (se houver).
vim.keymap.set('i', '<A-d>', '<Esc>ddi', { desc = "Deletar linha no modo Insert" })
-- Se você quiser que ele delete a linha e permaneça na mesma coluna (o que `dd` faz),
-- 'i' é um bom retorno. Se preferir voltar para o início da linha, use 'I'.

---

-- Indentar
-- O comportamento de indentação é ligeiramente diferente para cada modo.
-- No modo Normal, '>>' e '<<' indentam a linha atual.
-- No modo Visual, '>>' e '<<' indentam a seleção visual.

-- Indentar no modo Normal (linha atual)
vim.keymap.set('n', '.', '>>', { desc = "Indentar linha atual para direita" })
vim.keymap.set('n', ',', '<<', { desc = "Indentar linha atual para esquerda" })

-- Indentar no modo Inserção
-- A lógica aqui é sair do modo inserção, aplicar a indentação, e voltar para o modo inserção
-- na posição correta. Usaremos 'gv' para re-selecionar a última seleção visual
-- se for o caso, ou simplesmente aplicar a indentação na linha atual.
vim.keymap.set('i', '<C-.>', '<Esc>>>a', { desc = "Indentar para direita no modo Insert" }) -- Sai, indenta, volta para Insert (append)
vim.keymap.set('i', '<C-,>', '<Esc><<a', { desc = "Indentar para esquerda no modo Insert" }) -- Sai, indenta, volta para Insert (append)
-- A sequência original usava <Esc><gv ou <Esc>>gv. Isso só faz sentido se houvesse uma seleção visual prévia.
-- Se você apenas quer indentar a linha atual no modo de inserção, use `>>` ou `<<` após sair.
-- O 'a' após o comando garante que você retorne ao modo de inserção e possa continuar digitando.

-- Indentar no modo Visual
-- Aqui, 'gv' re-seleciona a última área visual. No modo visual, < e > já indentam a seleção.
-- Se a intenção é aplicar indentação e **manter a seleção**, é só usar < ou >.
-- Se a intenção é aplicar indentação e **desselecionar**, podemos adicionar <Esc> no final.
vim.keymap.set('v', '.', '>', { desc = "Indentar seleção para direita" }) -- Indenta e permanece selecionado
vim.keymap.set('v', ',', '<', { desc = "Indentar seleção para esquerda" }) -- Indenta e permanece selecionado
-- Se quiser que deselectionem após a indentação:
-- vim.keymap.set('v', '.', '><Esc>', { desc = "Indentar seleção para direita e sair" })
-- vim.keymap.set('v', ',', '<<Esc>', { desc = "Indentar seleção para esquerda e sair" })

---

-- TABS (Navegação entre abas/buffers)
-- Você já usa 'noremap', o que é bom.
-- `tabnext` é para a próxima aba, `tabprev` para a anterior.
vim.keymap.set('n', '<Tab>', ':tabnext<CR>', { desc = "Próxima aba" })
vim.keymap.set('n', '<S-Tab>', ':tabprev<CR>', { desc = "Aba anterior" })
-- Para o modo de inserção, <Tab> é frequentemente usado para autocompletar ou inserir um tab literal.
-- Evite mapear <Tab> sozinho no modo de inserção para navegação de abas, pois isso pode
-- conflitar com funcionalidades de autocompleção (como nvim-cmp ou Luasnip).
-- Se realmente precisar navegar abas no modo de inserção, use uma combinação de teclas diferente,
-- por exemplo, com Alt ou Ctrl.
-- Exemplo (se desejar, mas conflitos são prováveis):
-- vim.keymap.set('i', '<A-Tab>', '<Esc>:tabnext<CR>i', { desc = "Próxima aba no modo Insert" })
-- vim.keymap.set('i', '<A-S-Tab>', '<Esc>:tabprev<CR>i', { desc = "Aba anterior no modo Insert" })

-- =========================≈==========
-- UTILS

-- TRANSFORMAR -> TOGGLE ==> MAIÚSCULA <-> MINÚSCULA
-- Uso: Pressione o atalho com o cursor em uma palavra para alternar seu case.

-- Função para alternar o case de uma palavra
local function toggle_word_case()
  local current_word = vim.fn.expand("<cword>") -- Obtém a palavra sob o cursor
  if current_word == nil or current_word == '' then
    return '<Nop>' -- Não faz nada se não houver palavra
  end

  -- Verifica se a palavra está toda em maiúsculas
  if current_word:upper() == current_word then
    -- Se estiver em maiúsculas, transforma para minúsculas
    return 'viwu' -- Seleciona a palavra e transforma para minúsculas
  else
    -- Caso contrário (minúsculas ou misto), transforma para maiúsculas
    return 'viwU' -- Seleciona a palavra e transforma para maiúsculas
  end
end

-- Mapeamento para o modo Normal
vim.keymap.set('n', '<A-m>', toggle_word_case(), { expr = true, desc = "Alternar case da palavra" })
-- 'expr = true' é crucial aqui, pois o RHS é uma expressão (o retorno da função)
-- 'toggle_word_case()' é chamado quando o atalho é pressionado e o seu retorno
-- (uma sequência de teclas do Vim) é executado.

-- Mapeamento para o modo Inserção
vim.keymap.set('i', '<A-m>', '<Esc>' .. toggle_word_case() .. 'a', { expr = true, desc = "Alternar case da palavra (Insert)" })
-- No modo de inserção, saímos temporariamente, executamos a sequência de toggle_word_case,
-- e voltamos para o modo de inserção com 'a' (append), para continuar digitando.

-- Mapeamento para o modo Visual
-- No modo visual, já temos uma seleção, então podemos usar `U` (maiúscula) e `u` (minúscula) diretamente.
-- Uma função similar poderia ser criada para alternar a seleção.
local function toggle_visual_case()
  local last_visual_mode = vim.v.prevmode -- Salva o último modo visual ('v', 'V', or '<C-v>')
  -- Se for uma seleção visual de caractere ou linha, verificamos o case da seleção.
  -- Para simplificar, vamos alternar para minúsculas se já houver maiúsculas e vice-versa.
  -- Isso é mais complexo em Vimscript puro sem regex avançada no 'rhs'.
  -- Uma abordagem mais simples é expor dois atalhos, um para U e outro para u.
  -- No entanto, para 'toggle', podemos fazer uma suposição básica ou usar uma função Lua mais elaborada.

  -- Vamos usar uma abordagem que verifica o estado da seleção.
  -- Se houver caracteres maiúsculos na seleção, torna tudo minúsculo, senão, tudo maiúsculo.
  -- Isso requer capturar a seleção.
  local selection = vim.api.nvim_get_vvar('register') -- Pega o conteúdo da última seleção visual
  if selection:find('%u') then -- %u verifica por caracteres maiúsculos
      return 'u' -- Se tem maiúscula, transforma para minúsculas
  else
      return 'U' -- Se não tem maiúsculas, transforma para maiúsculas
  end
end
-- Uma vez que estamos no modo visual, `u` ou `U` atuam na seleção.
vim.keymap.set('v', '<A-m>', toggle_visual_case(), { expr = true, desc = "Alternar case da seleção" })


---

-- SUBSTITUIÇÃO DE TODAS OCORRÊNCIAS DIGITADAS
-- Uso: Pressione o atalho, digite o que procurar, Enter, o que substituir, Enter.

-- Modo Normal e Visual (para seleção)
vim.keymap.set('n', '<A-s>', ':%s///g<Left><Left>', { desc = "Substituir todas as ocorrências" })
vim.keymap.set('n', '<A-sc>', ':%s///gc<Left><Left><Left>', { desc = "Substituir todas (confirmar)" })

-- No modo visual/seleção (limitado à seleção)
-- Nota: Para o modo visual, a substituição é com `:s` (sem `%`), e o range `:'<,'>` é implícito.
vim.keymap.set({ 'x', 'v' }, '<A-s>', ':<C-u>s///g<Left><Left>', { desc = "Substituir na seleção" })
vim.keymap.set({ 'x', 'v' }, '<A-sc>', ':<C-u>s///gc<Left><Left><Left>', { desc = "Substituir na seleção (confirmar)" })
-- `<C-u>` limpa o range padrão `:'<,'>` que o vim adiciona automaticamente em `:s`.
-- Isso garante que o comando comece com `s`, e o Vim insira o range correto automaticamente.

-- `vnoremap * y/\V<C-R>=escape(@",'/\')<CR><CR>`
-- Este mapeamento é para buscar a palavra selecionada no modo visual.
-- Vamos refatorá-lo, é muito útil!
vim.keymap.set('v', '*', 'y/\\V<C-R>"<CR>', { desc = "Buscar seleção (visual)" })
-- Explicação: `y` copia a seleção para o registro padrão.
-- `/\V` inicia uma busca literal (non-magic)
-- `<C-R>"` insere o conteúdo do registro padrão (a seleção copiada)
-- `<CR>` executa a busca.

---

-- MOVIMENTAÇÃO DE LINHAS
-- Mover linhas para cima ou para baixo

-- Mover linha/seleção para baixo
vim.keymap.set('n', '<S-down>', ':m .+1<CR>==', { desc = "Mover linha para baixo" })
vim.keymap.set('i', '<S-down>', '<Esc>:m .+1<CR>==gi', { desc = "Mover linha para baixo (Insert)" })
vim.keymap.set('v', '<S-down>', ":m '>+1<CR>gv=gv", { desc = "Mover seleção para baixo" })

-- Mover linha/seleção para cima
vim.keymap.set('n', '<S-up>', ':m .-2<CR>==', { desc = "Mover linha para cima" })
vim.keymap.set('i', '<S-up>', '<Esc>:m .-2<CR>==gi', { desc = "Mover linha para cima (Insert)" })
vim.keymap.set('v', '<S-up>', ":m '<-2<CR>gv=gv", { desc = "Mover seleção para cima" })
-- Nota: O `==` reformata a indentação das linhas movidas. `gi` retorna ao modo de inserção
-- na mesma coluna após a movimentação. `gv=gv` re-seleciona e re-indenta a seleção após a movimentação.

---

-- Redimensionar Janelas (somente no modo Normal)
-- Uso: Redimensionar painel/terminal com Ctrl + Setas.
vim.keymap.set('n', '<C-up>', ':resize -2<CR>', { desc = "Diminuir altura da janela" })
vim.keymap.set('n', '<C-down>', ':resize +2<CR>', { desc = "Aumentar altura da janela" })
vim.keymap.set('n', '<C-left>', ':vertical resize -2<CR>', { desc = "Diminuir largura da janela" })
vim.keymap.set('n', '<C-right>', ':vertical resize +2<CR>', { desc = "Aumentar largura da janela" })
-- Nota: Esses comandos fazem mais sentido no modo normal, pois você está controlando a interface.
-- Eles geralmente não são mapeados no modo de inserção ou visual.



vim.api.nvim_set_keymap("n", "<A-Up>", "<Cmd>0<CR>", { noremap = true, silent = true, desc = "Início do Arquivo" })
vim.api.nvim_set_keymap("n", "<A-Down>", "<Cmd>$<CR>", { noremap = true, silent = true, desc = "Fim do Arquivo" })

vim.api.nvim_set_keymap(
  "n",
  "<A-e>",
  "<Cmd>Ex<CR>",
  { noremap = true, silent = true, desc = "explorer nativo netwr :Ex" }
)

---
