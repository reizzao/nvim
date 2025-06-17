-- lua/custom/main.lua
-- KEYMAPS BASE

vim.g.guicursor = "" -- Reseta o cursor para o padrão do terminal (IBeam).

-- Leaders
vim.g.mapleader = " " -- Define <Space> como a tecla líder principal.
vim.g.maplocalleader = "<Esc>" -- Define <Esc> como a tecla líder local (permitindo Alt).

-- Copiar para o Clipboard do Sistema
vim.opt.clipboard = "unnamedplus" -- Garante que 'y', 'd', 'p' usem o clipboard do sistema.

-- Mapeamentos base para copiar/colar linha inteira
vim.keymap.set("n", "Y", "yy", { desc = "Copiar linha inteira para o clipboard do sistema" }) -- Copia a linha atual para o clipboard.
vim.keymap.set("n", "<LocalLeader>y", '"+y', { desc = "Copiar para o clipboard do sistema" }) -- Copia seleção/movimento para o clipboard.
vim.keymap.set("n", "<LocalLeader>p", '"+p', { desc = "Colar do clipboard do sistema" }) -- Cola do clipboard.
