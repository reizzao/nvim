return {
  'nvim-treesitter/nvim-treesitter',
  build = ':TSUpdate',
  opts = {
    ensure_installed = { 'lua', 'javascript', 'typescript', 'tsx', 'json', 'yaml', 'markdown', 'markdown_inline' },
    highlight = { enable = true },
    indent = { enable = true },
    folding = { enable = true },
  },
  config = function(_, opts)
    require('nvim-treesitter.configs').setup(opts)
    -- ... seus autocomandos e defer_fns
  end,
}