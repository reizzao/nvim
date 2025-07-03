-- ~/.config/nvim/lua/plugins/cmp_config.lua

return {
  'hrsh7th/nvim-cmp',
  -- Usar 'InsertEnter' ou 'VeryLazy' é uma escolha.
  -- 'InsertEnter' é bom para garantir que o CMP esteja pronto ao entrar no modo de inserção.
  -- 'VeryLazy' é mais geral e pode ser um pouco mais lento no primeiro uso.
  -- Se o erro persistir com 'VeryLazy', tente 'InsertEnter'.
  event = 'InsertEnter', -- Ou 'VeryLazy'
  dependencies = {
    -- Fontes do nvim-cmp
    'hrsh7th/cmp-buffer',
    'hrsh7th/cmp-path',
    'hrsh7th/cmp-nvim-lsp', -- A fonte LSP, crucial para autocompletar com Language Servers.
    'saadparwaiz1/cmp_luasnip', -- Para integração com snippets Luasnip
    'L3MON4D3/LuaSnip',     -- Engine de snippets
    'onsails/lspkind.nvim', -- Para ícones e formatação visual (opcional)
  },
  config = function()
    local cmp = require('cmp')
    local luasnip = require('luasnip')
    local lspkind = require('lspkind')

    cmp.setup({
      -- Configurações gerais do CMP
      documentation = {
        border = { '╭', '─', '╮', '│', '╯', '─', '╰', '│' },
      },
      completion = {
        completeopt = 'menu,menuone,noinsert,noselect',
      },
      window = {
        completion = cmp.config.window.bordered(),
        documentation = cmp.config.window.bordered(),
      },

      -- Mapeamentos de teclas
      mapping = cmp.mapping.preset.insert({
        ['<C-b>'] = cmp.mapping.scroll_docs(-4),
        ['<C-f>'] = cmp.mapping.scroll_docs(4),
        ['<C-Space>'] = cmp.mapping.complete(),
        ['<C-e>'] = cmp.mapping.abort(),
        ['<CR>'] = cmp.mapping.confirm({ select = true }),

        -- Mapeamentos para Snippets
        ['<Tab>'] = cmp.mapping(function(fallback)
          if cmp.visible() then
            cmp.select_next_item()
          elseif luasnip.expand_or_jumpable() then
            luasnip.expand_or_jump()
          else
            fallback()
          end
        end, { 'i', 's' }),
        ['<S-Tab>'] = cmp.mapping(function(fallback)
          if cmp.visible() then
            cmp.select_prev_item()
          elseif luasnip.jumpable(-1) then
            luasnip.jump(-1)
          else
            fallback()
          end
        end, { 'i', 's' }),
      }),

      -- Fontes de autocomplete e ordem de prioridade
      sources = cmp.config.sources({
        { name = 'nvim_lsp' },    -- Sugestões do Language Server
        { name = 'luasnip' },     -- Sugestões de snippets
        { name = 'buffer' },      -- Palavras do buffer atual
        { name = 'path' },        -- Caminhos de arquivo
      }),

      -- Formatação dos itens na lista de autocomplete
      formatting = {
        format = lspkind.cmp_format({
          mode = 'symbol',
          maxwidth = 50,
          ellipsis_char = '...',
          before = function(entry, vim_item)
            vim_item.menu = ({
              buffer = "[Buffer]",
              nvim_lsp = "[LSP]",
              luasnip = "[Snippet]",
              path = "[Path]",
            })[entry.source.name]
            return vim_item
          end
        }),
      },

      -- Critérios de ordenação das sugestões
      sorting = {
        comparators = {
          cmp.config.compare.offset, cmp.config.compare.exact, cmp.config.compare.score,
          cmp.config.compare.recently_used, cmp.config.compare.kind, cmp.config.compare.sort_text,
          cmp.config.compare.length, cmp.config.compare.order,
        },
      },
    })

    -- Configuração para autocompletar na linha de comando
    cmp.setup.cmdline({ '/', '?' }, {
      mapping = cmp.mapping.preset.cmdline(),
      sources = {
        { name = 'buffer' },
      }
    })

    cmp.setup.cmdline(':', {
      mapping = cmp.mapping.preset.cmdline(),
      sources = cmp.config.sources({
        { name = 'path' },
        { name = 'cmdline' },
      })
    })

  end,
}