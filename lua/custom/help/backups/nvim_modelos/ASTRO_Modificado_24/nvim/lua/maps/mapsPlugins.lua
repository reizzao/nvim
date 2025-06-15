-- Maps PLUGINS --

-- Comentario --
vim.cmd([[ filetype plugin on ]])
-- ativa os plug-ins de tipo de arquivo - Essencial para comentario
-- NERDCo

vim.cmd([[
  map cc <plug>NERDCommenterToggle
  nmap cc <plug>NERDCommenterToggle
  inoremap cc <C-o>:call NERDComment(0,"toggle")<C-m>
]]) -- maps comentario NERDCommenter

-- EXPLORER
-- explorer Float -> NeoTreeFloatToggle
vim.cmd([[ nnoremap <A-e> :NeoTreeFloatToggle<CR> ]])
vim.cmd([[ inoremap <A-e> :NeoTreeFloatToggle<CR> ]])
vim.cmd([[ vnoremap <A-e> :NeoTreeFloatToggle<CR> ]])

-- FIND FLOAT
-- Find -> Telescope -- TODO -- ESTA DANDO ERRO - PARECE QUE O PROBLEMA ESTA NO PROPRIO TELESCOPE
-- Find com telescope
vim.cmd([[ nnoremap <A-f> :Telescope find_files<CR> ]])
vim.cmd([[ inoremap <A-f> :Telescope find_files<CR> ]])
vim.cmd([[ vnoremap <A-f> :Telescope find_files<CR> ]])
-- Find buffers com -> telescope
vim.cmd([[ nnoremap <A-b> :Telescope buffers<CR> ]])
vim.cmd([[ inoremap <A-b> :Telescope buffers<CR> ]])
vim.cmd([[ vnoremap <A-b> :Telescope buffers<CR> ]])

-- Telescope - procurar com grep
vim.cmd([[ nnoremap <C-k> :lua require('telescope.builtin').grep_string({ search = vim.fn.input("Grep For > ") })<CR>
]])

-- by VIM_AIRLINE :
vim.cmd([[
  let g:airline_left_sep = ''
  " powerline symbols
  let g:airline_left_sep = ''
  let g:airline_left_alt_sep = ''
  let g:airline_right_sep = ''
  let g:airline_right_alt_sep = ''
]])
-- definir o tema em uso do vim airline
vim.cmd([[
  let g:airline_theme='violet'
]])