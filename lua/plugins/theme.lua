-- OBS: APÓS CONFIGURAR AQUI O TEMA , NO EDITOR >> se nao auto-instalar , execute >> :Lazy sync

return {
  'dracula/vim',
  name = 'dracula', -- Garante que o nome do plugin é 'dracula'

  config = function()
    vim.cmd.colorscheme('dracula') -- Define o colorscheme #IMPORTANT
    
    -- Configurações adicionais do Dracula (opcional)
    vim.g.dracula_bold = 1          -- Habilita negrito
    vim.g.dracula_italic = 1        -- Habilita itálico
    vim.g.dracula_undercurl = 1     -- Habilita undercurl
    -- Mais opções em: https://github.com/dracula/vim
  end,
}


-- MODELO PLUGIN SETADO NO OPTS DO LAZYVIM ::
--[[ 
return {
  -- add gruvbox
  { "ellisonleao/gruvbox.nvim" },

  -- Configure LazyVim to load gruvbox
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "gruvbox",
    },
    
  }, ]]