return {
  "hrsh7th/nvim-cmp",
  event = "InsertEnter",
  dependencies = {
    "hrsh7th/cmp-nvim-lsp", -- Garanta que este esteja aqui
    "hrsh7th/cmp-buffer",
    "hrsh7th/cmp-path",
    -- ... outras fontes de cmp
  },
  opts = function(_, opts)
    local cmp = require('cmp')
    opts.sources = cmp.config.sources({ { name = 'nvim_lsp' }, { name = 'buffer' }, { name = 'path' }, })
    -- ... outras configurações do cmp
  end,
}