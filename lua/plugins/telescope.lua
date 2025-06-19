-- ~/.config/nvim/lua/plugins/telescope.lua

return {
  -- ...
  opts = {
    pickers = {
      find_files = {
        hidden = false,
        no_ignore = false, -- MUITO IMPORTANTE: Garante que .gitignore e .rgignore/config sejam respeitados
      },
      live_grep = {
        hidden = false,
        no_ignore = false, -- MUITO IMPORTANTE
      },
      live_grep_args = {
        hidden = false,
        no_ignore = false, -- MUITO IMPORTANTE
      },
    },
    -- ...
  },
  -- ...
}