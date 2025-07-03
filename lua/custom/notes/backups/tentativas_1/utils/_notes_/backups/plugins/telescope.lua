-- -- ~/.config/nvim/lua/config/keymaps.lua

-- -- Requer o módulo Telescope
-- local telescope_builtin = require('telescope.builtin')

-- -- Mapeamento para abrir Telescope na pasta atual (já vimos isso)
-- vim.keymap.set('n', '<leader>ff', telescope_builtin.find_files, { desc = 'Telescope: Find Files' })

-- -- Mapeamento para Live Grep (pesquisar conteúdo nos arquivos)
-- vim.keymap.set('n', '<leader>fg', telescope_builtin.live_grep, { desc = 'Telescope: Live Grep' })

-- -- Mapeamento para alternar entre buffers
-- vim.keymap.set('n', '<leader>fb', telescope_builtin.buffers, { desc = 'Telescope: Buffers' })

-- -- Mapeamento para buscar por histórico de comandos
-- vim.keymap.set('n', '<leader>fc', telescope_builtin.command_history, { desc = 'Telescope: Command History' })

-- -- Você pode criar wrappers se precisar de lógica extra
-- vim.keymap.set('n', '<leader>fP', function()
--     telescope_builtin.find_files({
--         prompt_title = "Arquivos do Projeto",
--         cwd = vim.fn.getcwd(), -- Garante que a busca seja no diretório atual
--         hidden = true,
--         no_ignore = false, -- Respeitar .gitignore
--     })
-- end, { desc = 'Telescope: Find Project Files' })

-- -- Integração Git (se você tiver o plugin telescope-git-nvim)
-- -- Mapeamento para buscar por arquivos git modificados
-- vim.keymap.set('n', '<leader>gs', function()
--     require('telescope').extensions.git_files.git_files()
-- end, { desc = 'Telescope Git: Status Files' })

-- -- Navegar por arquivos Git que foram stageados
-- vim.keymap.set('n', '<leader>ga', function()
--     require('telescope').extensions.git_files.git_staged()
-- end, { desc = 'Telescope Git: Staged Files' })

-- -- Mapeamento para mudar o diretório de trabalho para o diretório de um arquivo escolhido
-- vim.keymap.set('n', '<leader>cd', function()
--     telescope_builtin.find_files({
--         prompt_title = "Mudar de Diretório para...",
--         cwd_only = true, -- Apenas diretórios
--         results_title = "Diretórios",
--         layout_strategy = "vertical",
--         previewer = false,
--         actions = {
--             -- Ação para mudar o diretório de trabalho
--             -- Esta ação usa a API do Telescope para adicionar uma nova ação de teclado.
--             -- Pressione <C-c> quando o picker estiver ativo para chamar esta ação.
--             ["<C-c>"] = function(prompt_bufnr)
--                 local selection = require('telescope.actions.state').get_current_picker(prompt_bufnr):get_selection()
--                 if selection and selection.path then
--                     vim.cmd('cd ' .. selection.path)
--                     vim.cmd('pwd') -- Exibe o novo diretório de trabalho
--                     require('telescope.actions').close(prompt_bufnr) -- Fecha o Telescope
--                 end
--             end,
--         },
--     })
-- end, { desc = 'Telescope: Change Directory' })