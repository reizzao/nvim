-- plugins/telescope

return {
  -- Telescope (para busca e navegação)
  {
    "nvim-telescope/telescope.nvim",
    branch = "0.1.x", -- ou master, dependendo da sua preferência
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function()
      local builtin = require("telescope.builtin")
      vim.keymap.set("n", "<leader>ff", builtin.find_files, { desc = "Find Files" })
      vim.keymap.set("n", "<leader>fg", builtin.live_grep, { desc = "Live Grep" }) -- Pesquisa em tempo real com ripgrep
      vim.keymap.set("n", "<leader>fb", builtin.buffers, { desc = "Find Buffers" })
      vim.keymap.set("n", "<leader>fh", builtin.help_tags, { desc = "Help Tags" })
    end,
  },
}
