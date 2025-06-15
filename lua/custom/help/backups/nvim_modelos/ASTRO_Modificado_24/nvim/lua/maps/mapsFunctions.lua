-- Maps FUNCTIONS  --

-- INICIAL -- Cursor DeOndeParou --
vim.cmd([[
  hi! MatchParen cterm=NONE,bold gui=NONE,bold guibg=NONE guifg=#FFFF00
  if has("autocmd")
    au BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$") | exe "normal! g`\"" | endif
  endif
]])


-- carregar automaticamente o packer e compilar - nao precisa ficar abrindo e fechando a novas instalacaoes. --
vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerCompile
  augroup end
]])

-- BASH - Auto preenche arquivos .sh que não existirem com a SheBang --
vim.cmd([[ autocmd BufNewFile *.sh :call append(0, '#!/usr/bin/env bash') ]])

-- Se não existir o arquivo C++ de extensão .cpp ele preenche da forma abaixo --
-- altere para sua(s) linguagens preferidas --
vim.cmd([[
	function! AutoCpp()
	  call append(0, '#include <iostream>')
	  call append(1, '')
	  call append(2, 'int main( int argc , char **argv ){')
	  call append(3, "  std::cout << \"Hello, World!\" << '\\n';")
	  call append(4, '  return 0;')
	  call append(5, '}')
	  call cursor(4, 17)
	endfunction
        autocmd BufNewFile *.cpp :call AutoCpp()
]])

vim.cmd([[
  function! AutoC()
    call append(0, '#include <stdio.h>')
    call append(1, '')
    call append(2, 'int main( int argc , char **argv ){')
    call append(3, "  printf(\"Hello, World!\\n\");")
    call append(4, '  return 0;')
    call append(5, '}')
    call cursor(4, 17)
  endfunction
  autocmd BufNewFile *.c :call AutoC()
]])

-- SHORT KEY TO COMPILE



