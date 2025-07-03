-- ~/.config/nvim/lua/utils/loader.lua

local M = {}

--- Carrega todos os módulos Lua de um diretório específico.
--- @param dir_path string O caminho completo do diretório a ser carregado (e.g., vim.fn.stdpath('config') .. '/lua/custom').
--- @param base_module_name string O prefixo do módulo Lua para 'require()' (e.g., 'custom').
---        Nota: Não inclua o ponto final final, ele será adicionado automaticamente.
function M.load_directory(dir_path, base_module_name)
    -- Assegura que o base_module_name tenha um ponto final se não estiver vazio
    local full_prefix = base_module_name
    if #full_prefix > 0 and string.sub(full_prefix, -1) ~= '.' then
        full_prefix = full_prefix .. '.'
    end

    local success, entries = pcall(vim.fn.readdir, dir_path)
    if not success or not entries then
        vim.notify(
            string.format('Loader: Erro ou diretório vazio/inexistente em "%s": %s', dir_path, entries or "Unknown error"),
            vim.log.levels.ERROR,
            { title = "Custom Loader" }
        )
        return
    end

    for _, entry_name in ipairs(entries) do
        local entry_path = dir_path .. '/' .. entry_name
        local stat = vim.loop.fs_stat(entry_path) -- Verifica se é arquivo ou diretório

        if stat and stat.type == 'file' and entry_name:match('%.lua$') then
            -- Remove a extensão .lua
            local file_base_name = entry_name:gsub('%.lua$', '')
            
            -- Evita carregar "init.lua" explicitamente se ele for apenas o carregador do subdiretório
            if file_base_name == "init" then
                -- Se você quiser carregar 'init.lua' de subdiretórios específicos,
                -- sua lógica de recursão precisaria ser mais sofisticada.
                -- Por enquanto, pulamos o 'init.lua' no diretório raiz.
                goto continue_loop
            end

            local module_to_require = full_prefix .. file_base_name

            local ok, err_or_module = pcall(require, module_to_require)
            if not ok then
                vim.notify(
                    string.format("Loader: Falha ao carregar '%s': %s", module_to_require, err_or_module),
                    vim.log.levels.ERROR,
                    { title = "Custom Loader" }
                )
            else
                -- Opcional: Notifique apenas se DEBUG estiver ativado para evitar spam
                -- if vim.log.levels.DEBUG >= (vim.log.level or vim.log.levels.INFO) then
                --     vim.notify(string.format("Loader: '%s' carregado.", module_to_require), vim.log.levels.DEBUG, { title = "Custom Loader" })
                -- end
            end
        elseif stat and stat.type == 'directory' then
            -- Opcional: Para carregar recursivamente subdiretórios
            -- Descomente e ajuste se quiser carregar modules em /custom/ui/ e.g.
            -- M.load_directory(entry_path, full_prefix .. entry_name)
        end
        ::continue_loop::
    end
end

return M