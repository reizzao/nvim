-- ~/.config/nvim/lua/plugins/treesitter.lua

return {
  'nvim-treesitter/nvim-treesitter',
  build = ':TSUpdate', -- Garante que os parsers estejam atualizados
  opts = {
    ensure_installed = {
      -- ... (seus outros parsers aqui, ex: 'lua', 'python', 'javascript')
      'markdown', -- Garanta que markdown e markdown_inline estejam aqui
      'markdown_inline',
    },
    highlight = { enable = true },
    indent = { enable = true },
    -- Habilita o folding com Treesitter
    folding = {
      enable = true,
      -- Por padrão, 'auto' usa o Treesitter para dobrar.
      -- Se você tiver problemas, pode tentar 'manual' e definir foldexpr.
      -- Mas 'auto' geralmente funciona bem.
      -- keymaps = { -- Opcional: Define keymaps específicos para folding aqui se quiser sobrescrever os padrões
      --   -- 'za': Toggle fold
      --   -- 'zc': Close fold
      --   -- 'zo': Open fold
      --   -- 'zr': Open all folds in window
      --   -- 'zm': Close all folds in window
      -- }
    },
  },
  config = function(_, opts)
    require('nvim-treesitter.configs').setup(opts)

    -- Comando para fechar todos os folds de comentários ao abrir um arquivo
    vim.api.nvim_create_autocmd("BufReadPost", {
      group = vim.api.nvim_create_augroup("LazyVimFoldComments", { clear = true }),
      pattern = "*", -- Aplica para todos os arquivos
      callback = function()
        -- Define o foldmethod para 'expr' e foldexpr para Treesitter
        vim.opt.foldmethod = 'expr'
        vim.opt.foldexpr = 'v:lua.vim.treesitter.get_node_end_line()' -- Ou 'v:lua.vim.treesitter.foldtext()'

        -- Fecha todos os folds por padrão ao abrir o arquivo
        -- `zM` fecha todos os folds na janela atual.
        -- O `vim.defer_fn` evita problemas de race condition no startup.
        vim.defer_fn(function()
          vim.cmd('normal! zM')
        end, 100) -- Pequeno atraso para garantir que o treesitter carregou
      end,
    })

    -- Garante que o parser de markdown e markdown_inline estão instalados
    vim.defer_fn(function()
      require("nvim-treesitter.install").update({ with_parsers = { "markdown", "markdown_inline" } })
    end, 0)
  end,
}

-- =======================================================
-- 2. Mapeamentos de Teclas para o Folding
-- Os mapeamentos para folding são comandos nativos do Vim/Neovim. Eles são muito intuitivos:

-- Atalho	Ação	Descrição
-- za	zc + zo	Alterna o estado do fold sob o cursor (abre/fecha).
-- zc	foldclose	Fecha o fold sob o cursor.
-- zo	foldopen	Abre o fold sob o cursor.
-- zC	foldclose!	Fecha o fold sob o cursor e todos os seus sub-folds.
-- zO	foldopen!	Abre o fold sob o cursor e todos os seus sub-folds.
-- zM	foldclose! para todos os folds	Fecha todos os folds na janela atual. (Útil para esconder tudo).
-- zR	foldopen! para todos os folds	Abre todos os folds na janela atual. (Útil para revelar tudo).
-- zd	zdelete	Deleta o fold sob o cursor (se for um fold manual).
-- zf	zf (cria fold manual com seleção)	Cria um fold manual a partir de uma seleção visual.
-- zi	foldenable/folddisable	Alterna entre habilitar/desabilitar o folding na janela.
-- =======================================================


-- -- plugins/treesitter.lua

-- return {
--   -- Treesitter (para highlight avançado)
--   {
--     "nvim-treesitter/nvim-treesitter",
--     build = ":TSUpdate",
--     config = function()
--       require("nvim-treesitter.configs").setup({
--         ensure_installed = { "bash", "lua", "vimdoc", "javascript", "html", "css" }, -- Adicione as linguagens do seu projeto
--         highlight = {
--           enable = true, -- Ativa o highlight
--         },
--       })
--     end,
--   },
-- }
