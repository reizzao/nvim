-- Maps TERMINAL --

-- terminal float
vim.cmd([[ nnoremap <S-t> :FloatermNew<CR> ]])
vim.cmd([[ inoremap <S-t> <Esc>:FloatermNew<CR>l ]])
vim.cmd([[ vnoremap <S-t> <Esc>:FloatermNew<CR> ]])


-- TERMINAL Vsplit Vertical --
vim.cmd([[ nmap tt :vsplit term://bash<CR> ]])

vim.cmd [[
  autocmd TermOpen * setlocal listchars= nonumber norelativenumber nocursorline
  autocmd TermOpen * startinsert
  autocmd BufLeave term://* stopinsert
]]

-- test test bla bla tt ooott t ooooo t
-- escolher bash do vsplit terminal : mudar entre [ bash || zsh]

-- vim.cmd([[ noremap <C-l> :let @/=<CR>]]) -- Limpa Clean  --> TODO

-- FUNÇÃO -> ABRE TERMINAL VSPLIT
-- vim.cmd([[
-- function! Run()
--   :echo 'Compiling...'
--   :terminal make
--   :bwipeout
-- endfunction

-- nnoremap <C-t> :call Run()<CR>
-- inoremap <C-t> :call Run()<CR>
-- vnoremap <C-t> :call Run()<CR>
-- ]])
