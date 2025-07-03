Objetivo_Uso: uso somente: [ Docker, Shellscript, Kotlin, Dart, (Javascript & TypeScript [Somente com Deno js]), Golang, ]

Nao_uso_Por_enquanto: [ C, C++, Pytjon, Java, ]
---
Conceitos:
 * Instalação do servidor LSP correto para a linguagem.
 * Configuração básica do nvim-lspconfig para esse servidor.
 * Ambiente da linguagem (SDKs, módulos) onde o LSP busca informações.
Solucionando Problemas de LSP e CMP para suas Linguagens (Bash, Go, TS, Kotlin, Dart)
Para cada linguagem, há um servidor LSP específico que o Neovim precisa. O LazyVim já facilita muito a configuração deles, mas os problemas ainda podem surgir se o servidor não estiver no lugar certo ou se houver um conflito.
Aqui está um guia focado nas suas linguagens:
1. Verifique a Instalação dos Servidores LSP e Suas Dependências
Para cada linguagem, o primeiro passo é garantir que o servidor LSP correspondente está instalado e acessível na sua PATH. O LazyVim e o nvim-lspconfig geralmente esperam que você já tenha esses executáveis.
 * Bash (bash-language-server):
   * Instalação (BigLinux/Arch): sudo pacman -S bash-language-server
   * Verificação: bash-language-server --version
   * Dependências: Nenhuma específica além da própria instalação.
 * Go (gopls):
   * Instalação (Go): Você precisa ter o Go SDK instalado (geralmente sudo pacman -S go). Depois, use o comando go para instalar o gopls:
     go install golang.org/x/tools/gopls@latest

   * Verificação: gopls version
   * Dependências: O Go SDK deve estar configurado na sua PATH (export PATH=$PATH:$(go env GOPATH)/bin no seu .bashrc ou .profile).
 * TypeScript/JavaScript (tsserver ou typescript-language-server):
   * Instalação (tsserver é nativo do Node.js): Se você tem Node.js instalado (geralmente sudo pacman -S nodejs npm), o tsserver já vem com ele.
   * Instalação (typescript-language-server): Pode ser instalado via npm se preferir: npm install -g typescript-language-server typescript
   * Verificação: tsserver --version (se estiver usando o nativo) ou typescript-language-server --version
   * Dependências: Node.js e npm.
 * Kotlin (kotlin_language_server ou kotlin-language-server):
   * Instalação (BigLinux/Arch): Pode ser um pouco mais manual ou via AUR. Verifique a documentação oficial do kotlin-language-server no GitHub.
   * Normalmente, você precisa ter o JDK (Java Development Kit) instalado (sudo pacman -S jdk-openjdk ou similar).
   * Baixe o kotlin-language-server de sua página oficial ou via AUR (pamac build kotlin-language-server). Certifique-se de que o executável está na sua PATH.
   * Verificação: kotlin-language-server --version
   * Dependências: JDK e Maven/Gradle (para projetos).
 * Dart (dartls - Dart Language Server):
   * Instalação: Vem com o Dart SDK. Instale o Dart SDK primeiro (geralmente sudo pacman -S dart ou baixe do site oficial e adicione ao PATH).
   * Verificação: dart --version e dart analysis --version
   * Dependências: Dart SDK.
Recomendação: Use nvim-lsp-installer ou mason.nvim (o LazyVim provavelmente já usa mason.nvim por baixo dos panos) para gerenciar a instalação de muitos desses servidores. Rode :Mason no Neovim e instale/atualize os servidores para suas linguagens.
2. Configure nvim-lspconfig no LazyVim (Mínimo e Limpo)
A maior parte da mágica acontece aqui. O LazyVim e o nvim-lspconfig já têm configurações padrão muito boas. O segredo é não complicar demais, a menos que seja estritamente necessário.
Verifique seu arquivo de configuração de LSP no LazyVim (geralmente em ~/.config/nvim/lua/plugins/lsp.lua ou um arquivo similar que esteja carregando). Deve ser algo parecido com isto:
-- Exemplo de ~/.config/nvim/lua/plugins/lsp.lua (ou onde você configura seus LSPs)
return {
  "neovim/nvim-lspconfig",
  opts = {
    servers = {
      -- Apenas liste os servidores que você quer usar.
      -- A chave vazia '{}' significa que o lspconfig usará as configurações padrão.
      bashls = {},
      gopls = {},
      tsserver = {}, -- Para TypeScript/JavaScript
      -- Para Kotlin (pode ter um nome diferente no lspconfig, verifique no :LspInstall ou :LspInfo)
      -- Normalmente é 'kotlin_language_server' ou 'kotlinls'
      kotlin_language_server = {}, -- Ou apenas 'kotlinls' se você está usando um wrapper
      dartls = {},
      -- Se você instalou LSP servers via Mason.nvim, eles geralmente aparecem aqui automaticamente
      -- ou você os define com '{}'.
    },
  },
}

 * Importante: Remova qualquer configuração customizada ou complexa que você possa ter adicionado para esses servidores se não tiver certeza do que fazem. Comece do zero com as configurações padrão.
3. Ambiente da Linguagem e Gerenciamento de Projetos
 * Go: O gopls é excelente, mas ele precisa que seu projeto Go esteja configurado corretamente (com go.mod para módulos, etc.). Certifique-se de que você está abrindo o Neovim na raiz do módulo Go.
 * TypeScript/JavaScript: Para projetos TS/JS, o tsserver depende do seu tsconfig.json (ou jsconfig.json) para entender o projeto. Certifique-se de que esses arquivos estão na raiz do seu projeto e estão configurados corretamente. Problemas de node_modules (se não estiverem instalados) também podem causar erros de LSP.
 * Kotlin/Dart: Da mesma forma, seus projetos Kotlin (Gradle/Maven) e Dart (com pubspec.yaml) precisam ter suas dependências baixadas e estar na estrutura que o servidor LSP espera.
4. Debug Básico de LSP no Neovim
Mesmo sem clangd, as ferramentas de debug do Neovim são universais:
 * :LspInfo: Mostra quais servidores LSP estão ativos no buffer atual e sua configuração. Útil para verificar se o servidor está rodando.
 * :LspLog: Abre o arquivo de log do LSP. Este é o seu melhor amigo. Procure por mensagens de erro (keywords como error, failed, cannot find, no such file) relacionadas ao seu servidor LSP ou à linguagem. O log detalha a comunicação entre o Neovim e o servidor e pode revelar a causa raiz do problema.
 * vim.lsp.set_log_level("debug"): Adicione isso ao seu init.lua (temporariamente) para obter logs ainda mais verbosos.
Por que "vai e volta"?
Se os erros parecem ir e vir, isso pode indicar:
 * Instalação intermitente: O servidor LSP não está sempre na PATH ou tem dependências que às vezes falham.
 * Contexto do projeto: O servidor LSP só funciona bem quando entende a raiz do projeto (ex: go.mod, tsconfig.json). Se você abre o Neovim em um subdiretório, o LSP pode não encontrar os arquivos de configuração.
 * Conflitos de plugins: Raramente, mas pode acontecer de algum plugin estar interferindo com o LSP ou CMP. Se você adicionou muitos plugins recentemente, tente desativar alguns para isolar o problema.
Focar em ter os servidores LSP corretos instalados e acessíveis, e garantir que seu projeto está na estrutura esperada pelo servidor (com os arquivos de configuração de linguagem corretos), resolverá a grande maioria dos seus problemas.
Dê uma olhada nesses pontos, especialmente na instalação dos servidores e nos logs do :LspLog, e me diga o que encontrou!
