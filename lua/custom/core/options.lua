-- lua/custom/core/options.lua
vim.opt.nu = true        -- Número de linha
vim.opt.relativenumber = true -- Números relativos
vim.opt.tabstop = 4      -- Tamanho do tab
vim.opt.shiftwidth = 4   -- Espaços para indentação
vim.opt.expandtab = true -- Usa espaços ao invés de tabs
vim.opt.smartindent = true -- Indentação inteligente
vim.opt.wrap = false     -- Não quebra linha
vim.opt.swapfile = false -- Não cria arquivos de swap
vim.opt.undofile = true  -- Persiste o histórico de undo
vim.opt.hlsearch = true  -- Destaca resultados de busca
vim.opt.incsearch = true -- Busca incremental
vim.opt.termguicolors = true -- Cores para o terminal
vim.opt.scrolloff = 8    -- Linhas de contexto ao scrollar
vim.opt.signcolumn = 'yes' -- Sempre mostra a coluna dos sinais (diagnostics)
vim.opt.isfname:append("@-@") -- Caracteres extras para nomes de arquivos
vim.opt.updatetime = 300 -- Tempo para o Neovim esperar antes de escrever swap e disparar eventos
vim.opt.timeoutlen = 500 -- Tempo para mapeamentos parciais

-- Para copiar e colar fora do Neovim
vim.opt.clipboard = 'unnamedplus'