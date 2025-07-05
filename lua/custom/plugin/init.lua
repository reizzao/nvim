-- lua/plugins/init.lua

-- Aqui você configuraria seu gerenciador de plugins, ex: lazy.nvim
-- Por enquanto, este arquivo pode estar vazio ou conter anotações sobre
-- como você planeja adicionar plugins no futuro.

-- Exemplo conceitual para um futuro gerenciador de plugins:
-- local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
-- if not vim.loop.fs_stat(lazypath) then
--   vim.fn.system({"git", "clone", "--filter=blob:none",
--                  "https://github.com/folke/lazy.nvim.git",
--                  "--branch=stable", lazypath})
-- end
-- vim.opt.rtp:prepend(lazypath)
--
-- require("lazy").setup({
--   { 'nvim-treesitter/nvim-treesitter', build = ':TSUpdate' },
--   { 'neovim/nvim-lspconfig' },
--   -- Outros plugins aqui
-- })