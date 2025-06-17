return {
  "nvim-neo-tree/neo-tree.nvim",
  branch = "v3.x",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-tree/nvim-web-devicons", -- Required for file icons
    "MunifTanjim/nui.nvim",
    -- "3rd/image.nvim", -- Optional, if you want to preview images in Neo-tree
  },
  opts = {
    window = {
      width = 30, -- or whatever width you prefer
      -- Adicione outras opções aqui
    },
    filesystem = {
      filtered_items = {
        visible = true, -- Isso permite que você veja os itens filtrados, mas eles ainda não serão processados
        hide_dotfiles = true,
        hide_git_ignored = true,
        hide_hidden = true, -- hidden files and directories should only be visible when hidden_files is false
        never_show = {
          ".DS_Store",
          "thumbs.db",
        },
      },
    },
    -- Certifique-se que o módulo 'sources' está configurado se você está manipulando-o
    -- sources = { "filesystem", "buffers", "git_status", "diagnostics" },
  },
  -- Isso garante que o Neo-tree seja carregado ao iniciar o Neovim
  config = function(_, opts)
    require("neo-tree").setup(opts)

    -- É aqui que você pode ter um problema se chamar get_state imediatamente aqui
    -- Se você precisar de get_state, geralmente é para uma ação posterior.
    -- Por exemplo, um mapeamento de tecla:
    vim.keymap.set("n", "<leader>nt", function()
      require("neo-tree.command").execute({ toggle = true, dir = vim.fn.getcwd() })
    end, { desc = "Toggle Neo-tree" })
  end,
}
