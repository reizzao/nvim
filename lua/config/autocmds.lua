-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
--
-- Add any additional autocmds here
-- with `vim.api.nvim_create_autocmd`
--
-- Or remove existing autocmds by their group name (which is prefixed with `lazyvim_` for the defaults)
-- e.g. vim.api.nvim_del_augroup_by_name("lazyvim_wrap_spell")


-- AREA TRANSFERENCIA NVIM >> LINUX --
vim.cmd([[ set clipboard=unnamedplus ]])
-- compartilhar de área de transferência entre o Vim e o Linux



-- INICIAL -- Cursor DeOndeParou --
-- vim.cmd([[
--   hi! MatchParen cterm=NONE,bold gui=NONE,bold guibg=NONE guifg=#FFFF00
--   if has("autocmd")
--     au BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$") | exe "normal! g`\"" | endif
--   endif
-- ]])