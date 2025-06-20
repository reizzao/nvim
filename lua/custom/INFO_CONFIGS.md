# INFO_CONFIGS

### LSP
Configs Iniciais
- Tem que ter o clangd instalado
- confere :`LspInfo` erro: not editor comand
- Instalar o Lsp: `LspInstall` escolhe clangd 
- o notify tem que dar mensagem que instalou com sucesso 

- Essas pastas tem que existir se nao existir crie-as
  - Se alguma dessas pastas não existir, ou estiver vazia/com problemas, você precisará reinstalá-las.
`
ls ~/.local/share/nvim/lazy/mason.nvim
ls ~/.local/share/nvim/lazy/mason-lspconfig.nvim
` 
- 
- Limpe o cache do LazyVim para os plugins LSP problemáticos:
`
rm -rf ~/.local/share/nvim/lazy/mason.nvim && rm -rf ~/.local/share/nvim/lazy/mason-lspconfig.nvim
`
- crie plugin cmp
- limpe cmp: `rm -rf ~/.local/share/nvim/lazy/nvim-cmp && rm -rf ~/.local/share/nvim/lazy/cmp-nvim-lsp`

- eu: depois do reset -> tudo certo nenhum erro na reinstalacao e nem ao reabrir o editor,

só ainda não esta funcionando o linter ele ainda permite escrever comandos errados e salav o arquivo o que o linter nao devia permitir mas vamos por partes os erros sumiram e o realce e auto complete voltou ..e ainda não sei qual config do lsp to usando se é o clangd  e quando quiser acrescentar e fazer o linter funcionar nas linguagens? 