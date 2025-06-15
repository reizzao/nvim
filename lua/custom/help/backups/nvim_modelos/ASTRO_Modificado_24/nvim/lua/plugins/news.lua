-- TreeSitter
require'nvim-treesitter.configs'.setup {
  ensure_installed = { "c", "lua", "cpp", "java", "bash", "javascript" },
  sync_install = false,

  highlight = {
    enable = true,
    disable = { "c", "bash", "markdown" },
    additional_vim_regex_highlighting = false,
  },
}


--if filenamel == nil then
if filenamel == "" then
  --print("Empty variable!")
  require("notify")("Bem-vindo(a) ao NvimRZ!")
end
