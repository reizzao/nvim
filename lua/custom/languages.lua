-- ~/.config/nvim/lua/custom/languages.lua

return {
  -- Deno
  {
    "LazyVim/LazyVim",
    opts = {
      -- Configurações específicas para Deno
      colorscheme = "tokyonight", -- Exemplo: use seu colorscheme preferido
    },
    -- Adiciona o Deno ao TSServer, se necessário, ou configura o próprio LSP do Deno
    -- LazyVim já tem suporte para Deno, geralmente basta instalar o LSP.
    -- Se precisar de plugins adicionais, adicione-os aqui.
  },

  -- Shell Script
  {
    "LazyVim/LazyVim",
    opts = {
      -- LazyVim geralmente já tem um bom suporte para shell script
      -- através do LSP `bashls`. Se precisar de plugins específicos, adicione-os.
    },
  },

  -- Golang
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        gopls = {}, -- Habilita o LSP para Go
      },
    },
  },
  {
    "fatih/vim-go", -- Plugin popular para Go, fornece atalhos, ferramentas, etc.
    ft = "go",
  },

  -- Kotlin
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        -- LSP para Kotlin, por exemplo, o kotlin_language_server
        -- Você pode precisar instalar o LSP separadamente (ex: usando mason.nvim ou manualmente)
        kotlin_language_server = {},
      },
    },
  },
  {
    "mfussenegger/nvim-jdtls", -- Se você usa Kotlin com o ecossistema JVM/Maven/Gradle
    ft = "kotlin",
  },
}