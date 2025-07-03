-- ~/.config/nvim/lua/custom/keymaps.move.lua 
-- MOVIMENTACOES 

-- Mover Linhas
vim.keymap.set("n", "<S-down>", ":m .+1<CR>==", { desc = "Mover linha/seleção para baixo" }) -- Move a linha/seleção para baixo.
vim.keymap.set("n", "<S-up>", ":m .-2<CR>==", { desc = "Mover linha/seleção para cima" }) -- Move a linha/seleção para cima.
vim.keymap.set("i", "<S-down>", "<Esc>:m .+1<CR>==gi", { desc = "Mover linha para baixo (Insert)" }) -- Move a linha para baixo no modo Inserção e retorna.
vim.keymap.set("i", "<S-up>", "<Esc>:m .-2<CR>==gi", { desc = "Mover linha para cima (Insert)" }) -- Move a linha para cima no modo Inserção e retorna.
vim.keymap.set("v", "<S-down>", ":m '>+1<CR>gv=gv", { desc = "Mover seleção para baixo" }) -- Move a seleção para baixo.
vim.keymap.set("v", "<S-up>", ":m '<-2<CR>gv=gv", { desc = "Mover seleção para cima" }) -- Move a seleção para cima.

-- Redimensionar Janelas
vim.keymap.set("n", "<C-up>", ":resize -2<CR>", { desc = "Diminuir altura da janela" }) -- Diminui a altura da janela atual.
vim.keymap.set("n", "<C-down>", ":resize +2<CR>", { desc = "Aumentar altura da janela" }) -- Aumenta a altura da janela atual.
vim.keymap.set("n", "<C-left>", ":vertical resize -2<CR>", { desc = "Diminuir largura da janela" }) -- Diminui a largura da janela atual.
vim.keymap.set("n", "<C-right>", ":vertical resize +2<CR>", { desc = "Aumentar largura da janela" }) -- Aumenta a largura da janela atual.

-- Navegação de Abas (Tabs)
-- Removido o mapeamento duplicado de <Tab> para tabnext (já coberto em Buffers para <S-Tab>)
-- Se você ainda quer <Tab> puro para next tab, pode ser assim, mas pode conflitar com autocomplete.
-- vim.keymap.set("n", "<Tab>", ":tabnext<CR>", { desc = "Próxima aba" })

-- Movimento de Cursor (Básico, se plugins anularem)
vim.keymap.set("n", "<Home>", "^", { desc = "Início da linha (primeiro caractere não-branco)" }) -- Vai para o primeiro caractere não-branco da linha.
vim.keymap.set("n", "0", "0", { desc = "Início absoluto da linha" }) -- Vai para o início absoluto da linha.
vim.keymap.set("n", "<End>", "$", { desc = "Fim da linha" }) -- Vai para o fim da linha.
vim.keymap.set("n", "b", "b", { desc = "Voltar uma palavra" }) -- Move o cursor para o início da palavra anterior.
vim.keymap.set("n", "w", "w", { desc = "Próxima palavra" }) -- Move o cursor para o início da próxima palavra.

-- Início e Fim do Arquivo
vim.keymap.set("n", "<A-Up>", "gg", { desc = "Início do arquivo" }) -- Vai para o início do arquivo.
vim.keymap.set("n", "<A-Down>", "G", { desc = "Fim do arquivo" }) -- Vai para o fim do arquivo.
-- Nota: Use 'gg' e 'G' diretamente, são mais idiomáticos que ':0' e ':$'.
