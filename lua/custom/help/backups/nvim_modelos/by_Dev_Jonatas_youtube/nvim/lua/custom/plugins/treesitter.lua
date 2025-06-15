-- by sintaxe highlight : treesitter ::
-- separa cores no codigo definidos pela linguagem em uso.

return {
  {
    -- infos do repo da plugin
    "nvim-treesitter/nvim-treesitter",
    branch = "master",
    build = ":TSUpdate",
    event = { "VeryLazy" }, -- ultimo a rodar quando abrir o nvim
    version = false,

    config = function()
      local opts = {}
      opts.ensure_installed = { -- params : todas linguagens de uso #editable
        "css",
        -- "dockfile", -- TODO: deu ruim nao instalou
        -- "golang", -- TODO: deu ruim nao instalou
        "elm",
        "fish",
        "gitcommit",
        "html",
        "http",
        "javascript",
        "typescript",
        "json",
        "lua",
        "python",
        "regex",
        "rust",
        "scss",
        "toml",
        "toml",
        "yaml",
      }

      opts.sync_install = true
      opts.highlight = { enable = true }
      opts.indent = { enable = true }

      require('nvim-treesitter.configs').setup(opts)
    end,
  },
}

-- doc: (https://github.com/nvim-treesitter/nvim-treesitter)