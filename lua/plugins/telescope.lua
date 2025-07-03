-- ~/.config/nvim/lua/plugins/telescope.lua (ou o arquivo onde você customiza o Telescope)

return {
  "nvim-telescope/telescope.nvim",
  opts = {
    defaults = {
      -- Opções padrão para todos os pickers
      hidden = false,    -- Não mostra arquivos/diretórios ocultos por padrão
      no_ignore = false, -- Respeita .gitignore por padrão
    },
    pickers = {
      -- Você pode sobrescrever aqui para pickers específicos se quiser
      find_files = {
        -- hidden = true, -- Exemplo: se quisesse mostrar ocultos SÓ para find_files
      },
      live_grep = {
        -- hidden = true, -- Exemplo: se quisesse mostrar ocultos SÓ para live_grep
      },
    },
    -- ... outras opções do Telescope ...
  },
}