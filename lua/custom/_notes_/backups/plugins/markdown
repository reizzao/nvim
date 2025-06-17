-- ~/.config/nvim/lua/plugins/markdown.lua

return {
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    config = function(_, opts)
      require("nvim-treesitter.configs").setup(opts)
      -- Garante que o parser de markdown e markdown_inline estão instalados
      -- e habilitados.
      vim.defer_fn(function()
        require("nvim-treesitter.install").update({ with_parsers = { "markdown", "markdown_inline" } })
      end, 0)
    end,
    opts = {
      ensure_installed = {
        "markdown",
        "markdown_inline",
        -- outros parsers que você já tenha:
        -- 'lua', 'vim', 'vimdoc', 'javascript', 'typescript', 'html', 'css', 'json',
      },
      highlight = {
        enable = true,
      },
      indent = { enable = true },
    },
  },
  {
    "iamcco/markdown-preview.nvim",
    build = "cd app && npm install", -- Comando para instalar as dependências necessárias
    ft = "markdown", -- Carrega o plugin apenas para arquivos markdown
    keys = {
      -- editable : keymaps
      { "<leader>mp", "<cmd>MarkdownPreviewToggle<CR>", desc = "Toggle Markdown Preview" },
      { "<leader>mpb", "<cmd>MarkdownPreview<CR>", desc = "Open Markdown Preview" },
      { "<leader>mpk", "<cmd>MarkdownPreviewStop<CR>", desc = "Stop Markdown Preview" },
    },
    config = function()
      -- Configurações para o markdown-preview.nvim
      -- Você pode ajustar a porta, o navegador, etc.
      -- Veja :help markdown-preview.nvim para todas as opções
      vim.g.mkdp_auto_start = 0 -- Não iniciar automaticamente ao abrir um arquivo markdown
      vim.g.mkdp_browser = "google-chrome" -- Exemplo: use Google Chrome. Pode ser 'firefox', 'brave', etc.
      -- Se vazio, usará o padrão do sistema.
      vim.g.mkdp_port = 8888 -- Porta para o servidor local
      vim.g.mkdp_echo_path = 1 -- Exibe o caminho do arquivo no terminal
    end,
  },
  -- Opcional: Se você usa tabelas e quer alinhar facilmente
  {
    "godlygeek/tabular",
    build = "VimEnter", -- Carrega na inicialização
    -- Não precisa de config específica, é uma dependência
  },
}
