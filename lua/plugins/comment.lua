-- ~/.config/nvim/lua/plugins/comment.lua
--  mapeados: atalhos : Comentario em linha : <leader>cc , Comentario em Bloco: <leader>cb

return {
  "numToStr/Comment.nvim",
  dependencies = {
    "nvim-treesitter/nvim-treesitter", -- Comment.nvim geralmente depende de treesitter
  },
  event = "VeryLazy", -- Carrega o plugin o mais tarde possível para otimizar o startup
  config = function()
    require("Comment").setup({
      -- Você pode opcionalmente definir os toggler e opler aqui para usar seus atalhos
      -- Mas, definir os keymaps diretamente no `keys` da spec do plugin
      -- é a maneira recomendada pelo LazyVim para melhor integração e visibilidade.
      -- No entanto, se você quiser que o Comment.nvim remapeie automaticamente
      -- seus operadores (como gc, gb), você pode usar isto:
      toggler = {
        line = "<leader>cc",
        block = "<leader>cb",
      },
      opleader = {
        line = "<leader>cc",
        block = "<leader>cb",
      },
    })
  end,
  -- Aqui é onde você define os atalhos (keymaps)
  keys = {
    -- Comentário de Linha (<leader>cc)
    {
      "<leader>cc",
      function()
        require("Comment.api").toggle.current_line()
      end,
      mode = "n", -- Modo Normal
      desc = "Comment: Toggle current line",
    },
    {
      "<leader>cc",
      function()
        require("Comment.api").toggle.linewise_visual()
      end,
      mode = "v", -- Modo Visual (seleção de linha)
      desc = "Comment: Toggle linewise (Visual)",
    },

    -- Comentário de Bloco (<leader>cb)
    {
      "<leader>cb",
      function()
        require("Comment.api").toggle.blockwise.current()
      end,
      mode = "n", -- Modo Normal
      desc = "Comment: Toggle current block",
    },
    {
      "<leader>cb",
      function()
        require("Comment.api").toggle.blockwise.visual()
      end,
      mode = "v", -- Modo Visual (seleção de bloco)
      desc = "Comment: Toggle blockwise (Visual)",
    },

    -- Embora você tenha pedido "para todos os modos",
    -- o Neovim geralmente não tem atalhos de comentário no modo Insert ('i')
    -- porque você estaria digitando. Os modos mais relevantes são Normal e Visual.
    -- Se você tiver alguma necessidade específica para o modo Insert, por favor, me avise.
  },
}
