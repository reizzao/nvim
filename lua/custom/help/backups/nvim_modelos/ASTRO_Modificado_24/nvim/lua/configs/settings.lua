-- Rz funcionando

-- SETTINGS --

vim.cmd([[ syntax on ]])
-- ajudar na syntaxe das linguagens

vim.cmd([[ syntax enable  ]])
-- Habilitar syntax highlighing

-- AutoSave - TODO NAO FUNCIONANDO --
vim.cmd([[ set autowriteall ]])

vim.cmd([[ let extension = expand('%:e') ]])
vim.cmd([[ let filenamev = expand('%:t') ]])

-- SET MAPLEADER -> TODO

vim.cmd([[ set noswapfile ]])
-- desabilita criação de arquivo  backup .swp

vim.cmd([[ confirm ]])
-- pede confirmações antes de ação

vim.cmd([[ set title ]])
-- mostra titulo ???

-- DESIGNS --

-- CURSOR --
vim.cmd([[ set guicursor= ]])
-- definir cursor como nada assume o I-Beam se tiver configurado no terminal.

vim.cmd([[ set nowrap ]])
-- Exibir linhas longas como apenas uma linha : Display long lines as just one line

vim.cmd([[ set encoding=utf-8  ]])
-- A codificação exibida : The encoding displayed

vim.cmd([[ set pumheight=10 ]])
-- Makes popup menu smaller : tornar menu popup menor

vim.cmd([[ set fileencoding=utf-8  ]])
-- A codificação gravada no arquivo : The encoding written to file :

vim.cmd([[ set cmdheight=1 ]])
-- Mais espaço para exibição de mensagens : More space for displaying messages

vim.cmd([[ set iskeyword+=- ]])
-- tratar palavras separadas por travessão como um objeto de texto de palavra : treat dash separated words as a word text object

vim.cmd([[ set mouse=a ]])
-- Habilita mouse : Enable your mouse

vim.cmd([[ set splitbelow ]])
-- As divisões horizontais estarão automaticamente abaixo : Horizontal splits will automatically be below

vim.cmd([[ set splitright  ]])
-- Vertical splits will automatically be to the right

vim.cmd([[ set t_Co=256 ]])
-- Suporta 256 cores : Support 256 colors

vim.cmd([[ set conceallevel=0 ]])

-- Para que eu possa ver  em arquivos markdown : So that I can see in markdown files

-- IDENTACAO
vim.cmd([[ set tabstop=4 ]])
-- Insert 2 spaces for a tab

vim.cmd([[ set shiftwidth=2 ]])
-- Alterar o número de caracteres de espaço inseridos para recuo : Change the number of space characters inserted for indentation

vim.cmd([[ set smarttab ]])
-- Torna a tabulação mais inteligente e perceberá que você tem 2 contra 4 : Makes tabbing smarter will realize you have 2 vs 4

vim.cmd([[ set expandtab ]])
-- Converte tabulações em espaços  : Converts tabs to spaces

vim.cmd([[ set smartindent ]])
-- Torna o recuo inteligente : Makes indenting smart

vim.cmd([[ set autoindent ]])
-- Bom recuo automatico : Good auto indent

vim.cmd([[ set laststatus=0 ]])
-- Sempre exibir a linha de status : Always display the status line

vim.cmd([[ set ruler ]])
-- Mostrar a posição do cursor o tempo todo: Show the cursor position all the time

-- LINHAS
vim.cmd([[ set number  ]])
-- mostrar numero das linhas : Show line numbers

vim.cmd([[ set showtabline=1 ]])
-- Sempre mostrar guias e a quantidade de tabs : Always show tabs

-- AREA TRANSFERENCIA NVIM >> LINUX --
vim.cmd([[ set clipboard=unnamedplus ]])
-- compartilhar de área de transferência entre o Vim e o Linux


