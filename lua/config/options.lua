-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

vim.g.guicursor = ""          -- depois $`reset` no terminal para assumir o cursor fininho : < IBeam > configurado no terminal.
vim.g.mapleader = " "         -- Define a tecla 'leader' (geralmente configurado em um local anterior, como init.lua do LazyVim)

-- AREA TRANSFERENCIA NVIM >> LINUX --
vim.cmd([[ set clipboard=unnamedplus ]])   -- compartilhar de área de transferência entre o Vim e o Linux



-