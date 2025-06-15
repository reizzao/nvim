
require("custom.core.command")
require("custom.core.keymaps.main") -- all keymaps

-- 1 - Configura o caminho PATH do lazyvim, Testa se existe o lazyvim ele vai baixar
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = "https://github.com/folke/lazy.nvim.git"
  local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
  if vim.v.shell_error ~= 0 then
    vim.api.nvim_echo({
      { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
      { out, "WarningMsg" },
      { "\nPress any key to exit..." },
    }, true, {})
    vim.fn.getchar()
    os.exit(1)
  end
end
vim.opt.rtp:prepend(lazypath)

-- 2- [ Recebe Valores para uso e Configura como vai usar esses valores.
-- está recebendo o configurador de < Plugins_Master > chamado <lazy> e dps vai configura-lo
-- a dinâmica é essa recebe o objeto importando-o e abrindo seu método setup( <onde recebe objeto pra definir suas configurações que quer usar. > )

require("lazy").setup({

  spec = {
    { import = "custom.plugins" }
     -- recebe array de hashs , que são todos arquivos desta pasta
  },

  checker = { enabled = true }

})

-- Temporarios :: aqui no init porque nao funcionou em outros lugares
vim.cmd.colorscheme("catppuccin")   -- Tema: mesmo add o plugin só funciona o tema escolhido se informar aqui na api vim.
