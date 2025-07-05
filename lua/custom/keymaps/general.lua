-- lua/custom/keymaps/general.lua

-- Mapeamento para salvar (Ctrl+S)
vim.keymap.set('n', '<C-s>', ':w<CR>', { desc = 'Salvar arquivo' })
vim.keymap.set('i', '<C-s>', '<Esc>:w<CR>a', { desc = 'Salvar arquivo (modo inserção)' })

-- Mapeamento para sair (Ctrl+Q)
vim.keymap.set('n', '<C-q>', ':q<CR>', { desc = 'Sair do buffer atual' })

-- Navegação entre janelas (Ctrl+h,j,k,l)
vim.keymap.set('n', '<C-h>', '<C-w>h', { desc = 'Mover para janela esquerda' })
vim.keymap.set('n', '<C-l>', '<C-w>l', { desc = 'Mover para janela direita' })
vim.keymap.set('n', '<C-j>', '<C-w>j', { desc = 'Mover para janela abaixo' })
vim.keymap.set('n', '<C-k>', '<C-w>k', { desc = 'Mover para janela acima' })

-- Limpar destaque de busca (Ctrl+N)
vim.keymap.set('n', '<C-n>', ':noh<CR>', { desc = 'Limpar destaque de busca' })