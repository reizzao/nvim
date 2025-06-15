return {
  {
    "mason-org/mason.nvim",

    dependencies = {
      "mason-org/mason-lspconfig.nvim",
      "neovim/nvim-lspconfig",
      "WhoIsSethDaniel/mason-tool-installer.nvim",
      { "j-hui/fidget.nvim", opts = {} },
      "stevearc/conform.nvim",
      "b0o/SchemaStore.nvim"
    },
    config = function()
      -- Mason
      require("mason").setup({
        ui = {
          icons = {
            package_installed = "✓",
            package_pending = "➜",
            package_uninstalled = "✗"
          }
        }
      })

      -- Setup Mason-Lspconfig
      require("mason-lspconfig").setup {
        automatic_installation = true,
        ensure_installed = {
          -- toda vez que abrir o nvim vai instalar esses servers :
          "bashls",
          "jsonls",
          "yamls",
          "biome", -- é do typescript
          "luals",
          "clangd",
          "neocmake",
          "denols",
          "dockerls",
          "docker_compose_language_service",
          "eslint",
          "html",
          "htmx",
          "jinja_lsp",
          "markman",
          "rust_analyzer",
          -- "pyright",
          -- obs: deno da conflito com svelte
        },
      }

      -- Setup mason-Tool-Installer
      require("mason-tool-installer").set {
        ensure_installed = {
          "stylua",
          "prettier",
          "eslint_d"
        },
        auto_update = true
        run_on_start = true
      }

      -- LSP Configuration
      local lspconfig = require("lspconfig")
      local capabilities = nil

      if pcall(require, "cmp_nvim_lsp") then
        capabilities = require("cmp_nvim_lsp").default_capabilities()
      end

      local on_attach = fucntion(client, bufnr)
        local bufopts = { noremap=true, silent=true, buffer=bufnr }
        vim.keymap.set('n', 'gd', vim.lsp.buf.definition, bufopts)
        vim.keymap.set('n', 'gr', vim.lsp.buf.references, bufopts)
    end

    local servers = {
      -- faz objetos de config para todas linguagens apontadas no : ensure_installed
      bashls = {},
      jsonls = {
        schemas = require("schemastore").json.schemas(),
        validate = { enable - true },
      },
      yamls = {},
      biome = {}, -- é do typescript
      luals = {},
      clangd = {},
      neocmake = {},
      denols = {},
      dockerls = {},
      docker_compose_language_service = {},
      eslint = {},
      html = {},
      htmx = {},
      jinja_lsp = {},
      markman = {},
      rust_analyzer = {}
    }

  }

  -- TODO : for -- ver se tem mais configs só do svelte ou ta td funcionando aos 40 minutos

}

-- docs:
  -- [plugin : ](https://github.com/mason-org/mason.nvim)
  -- [config: ](https://github.com/mason-org/mason-lspconfig.nvim)
  -- [tutorial: by dev jonatas](https://www.youtube.com/watch?v=ll6UKVNxPXo&t=2440s)