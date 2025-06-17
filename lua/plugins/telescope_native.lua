-- plugins/telescope_native

return {
  -- (Opcional) Telescope FZF Native para performance
  {
    "nvim-telescope/telescope-fzf-native.nvim",
    build = "make",
    cond = function()
      return vim.fn.executable("make")
    end,
  },
}
