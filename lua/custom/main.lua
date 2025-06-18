-- lua/custom/main.lua
-- KEYMAPS BASE

vim.g.guicursor = "" -- Reseta o cursor para o padrão do terminal (IBeam).
vim.opt.mouse = "a" -- Habilita o mouse em todos os modos.

-- Para tornar a foldcolumn visível (se já não estiver): Em sua configuração de opções
vim.opt.foldcolumn = "1" -- Mostra uma coluna de 1 caractere para os sinais de fold
-- Ou '2' para 2 caracteres, etc.
-- Comandos:
-- zM: Este comando fecha todos os folds na janela atual. Isso significa que, se o Treesitter identificou blocos de comentários como "dobráveis", eles serão fechados por padrão, dando a você a experiência de "comentários invisíveis" ao abrir o arquivo.
-- Toggle com za: Para ver os comentários (ou qualquer outra seção dobrada), basta mover o cursor para uma linha dentro ou perto de um fold e pressionar za. Isso alternará o estado do fold. Pressione za novamente para escondê-lo.
-- Revelar/Esconder Tudo: Use zR para abrir todos os folds e zM para fechar todos os folds na janela atual.

-- Leaders
vim.g.mapleader = " " -- Define <Space> como a tecla líder principal.
vim.g.maplocalleader = "<Esc>" -- Define <Esc> como a tecla líder local (permitindo Alt).

-- Copiar para o Clipboard do Sistema
vim.opt.clipboard = "unnamedplus" -- Garante que 'y', 'd', 'p' usem o clipboard do sistema.

-- Mapeamentos base para copiar/colar linha inteira
vim.keymap.set("n", "Y", "yy", { desc = "Copiar linha inteira para o clipboard do sistema" }) -- Copia a linha atual para o clipboard.
vim.keymap.set("n", "<LocalLeader>y", '"+y', { desc = "Copiar para o clipboard do sistema" }) -- Copia seleção/movimento para o clipboard.
vim.keymap.set("n", "<LocalLeader>p", '"+p', { desc = "Colar do clipboard do sistema" }) -- Cola do clipboard.
