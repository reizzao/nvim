-- lua/utils/loader.lua
local M = {} -- Tabela para o módulo (boas práticas em Lua)

--- Carrega todos os módulos Lua de um diretório especificado.
-- @param path_from_lua string O caminho do diretório, relativo à pasta 'lua/' do seu Neovim.
--                              Ex: 'plugins', 'keymaps', 'core/settings'
function M.load_directory(path_from_lua)
    local full_path = vim.fn.stdpath('config') .. '/lua/' .. path_from_lua
    local success, files = pcall(vim.fn.readdir, full_path)

    if not success or not files then
        print(string.format("Nenhum arquivo encontrado ou erro ao ler o diretório: %s", full_path))
        return
    end

    table.sort(files) -- Opcional: Garante uma ordem de carregamento consistente

    for _, filename in ipairs(files) do
        -- Ignora diretórios e arquivos que não terminam com .lua
        if filename:match("%.lua$") and vim.fn.filereadable(full_path .. '/' .. filename) == 1 then
            local module_name = path_from_lua:gsub("/", ".") .. "." .. filename:gsub("%.lua$", "")
            local ok, err = pcall(require, module_name)
            if not ok then
                -- Imprime um erro no caso de um problema no módulo
                vim.api.nvim_err_writeln(string.format("Erro ao carregar %s: %s", module_name, err))
            end
        end
    end
end

return M