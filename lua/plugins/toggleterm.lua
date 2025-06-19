-- ~/.config/nvim/lua/plugins/toggleterm.lua

return {
  "akinsho/toggleterm.nvim",
  version = "*",
  lazy = false, -- Certifique-se de que é FALSE
  cmd = "ToggleTerm",

  opts = {
    size = 70,
    open_mapping = false,
    hide_numbers = true,
    direction = "vertical", -- PADRÃO para Vsplit
    shade_terminals = true,
    shading_factor = 1,
    start_in_insert = true, -- Essencial para entrar em INSERT automaticamente
    insert_mappings = true,
    persist_size = true,
    close_on_exit = true,
    shell = "bash",

    mappings = {
      ttoggle_term = "<C-q>", -- Para sair do modo terminal para o modo Normal
    },
    terminals = {
      lazygit = {
        cmd = "lazygit",
        hidden = true,
        direction = "float",
      },
    },
  },

  config = function(_, opts)
    require("toggleterm").setup(opts)

    -- MAPEAMENTOS CORRIGIDOS E SIMPLIFICADOS
    vim.api.nvim_set_keymap(
      "n",
      "<C-t>",
      "<Cmd>ToggleTerm<CR>",
      { noremap = true, silent = true, desc = "Alternar Terminal (Ctrl+t)" }
    )
    vim.api.nvim_set_keymap(
      "n",
      "<F12>",
      "<Cmd>ToggleTerm<CR>",
      { noremap = true, silent = true, desc = "Alternar Terminal (F12)" }
    )

    -- Mapeamento para MATAR o terminal atual E FECHAR A JANELA
    vim.api.nvim_set_keymap(
      "n",
      "<C-k>",
      "<Cmd>ToggleTermToggleAll<CR><Cmd>ToggleTermKill<CR><Cmd>ToggleTerm<CR>",
      { noremap = true, silent = true, desc = "Matar e Fechar Terminal" }
    )

    -- Mapeamentos para REDIMENSIONAR o Vsplit Terminal (Modo Normal)
    vim.api.nvim_set_keymap(
      "n",
      "<A-Left>",
      "<C-w><",
      { noremap = true, silent = true, desc = "Diminuir Largura da Janela" }
    )
    vim.api.nvim_set_keymap(
      "n",
      "<A-Right>",
      "<C-w>>",
      { noremap = true, silent = true, desc = "Aumentar Largura da Janela" }
    )

    -- Comando para abrir um terminal e esconder, garantindo que o plugin esteja ativo
    -- vim.cmd("term HIDE=1 bash") -- TODO: essa linha da erro - terminal abre ao iniciar trava tudo.
  end,
}
