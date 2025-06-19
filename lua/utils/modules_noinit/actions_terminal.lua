-- lua/utils/modules_noinit/actions_terminal.lua
--
-- Esse arquivo é dependencia da funcao handle_terminal_click() de links em duplo click no terminal em /utils/modules_noinit
-- Contem modulo para links no terminal Vsplit sejam clicáveis para abrir no navegador, arquivos em uma nova aba do Neovim, ou navegar para o local

-- lua/utils/modules_noinit/actions_terminal.lua

local M = {}

--- Abre URLs, arquivos ou navega para erros a partir do terminal.
--- Esta função será chamada por um mapeamento de clique no terminal.
--- @param client_id number O ID do cliente do terminal.
--- @param mouse_event table Dados do evento do mouse (não totalmente usados aqui, mas úteis para contexto).
function M.handle_terminal_click(client_id, mouse_event)
  -- Certifica-se de que estamos no buffer correto (o do clique)
  vim.api.nvim_set_current_buf(client_id)

  -- Obtém a posição do cursor no momento do clique (ou atual, se não houver mouse_event)
  local row = mouse_event and mouse_event.row or vim.fn.line(".")
  local col = mouse_event and mouse_event.col or vim.fn.col(".")

  -- Obtém a linha completa
  local line_content = vim.api.nvim_buf_get_lines(0, row - 1, row, true)[1]
  if not line_content then
    return
  end

  -- Tenta extrair a "palavra" (token) na posição do clique.
  -- Uma forma mais robusta é obter o caractere na coluna, e expandir a palavra em volta dele.
  local char_at_col = string.sub(line_content, col, col)
  local start_col = col
  local end_col = col

  -- Expandir para a esquerda para encontrar o início da palavra
  while
    start_col > 1 and string.match(string.sub(line_content, start_col - 1, start_col - 1), "[%w%-_./:%%#?=&%(\\]")
  do
    start_col = start_col - 1
  end
  -- Expandir para a direita para encontrar o fim da palavra
  while end_col <= #line_content and string.match(string.sub(line_content, end_col, end_col), "[%w%-_./:%%#?=&%)\\]") do
    end_col = end_col + 1
  end
  local current_word = string.sub(line_content, start_col, end_col - 1)

  -- Debugging:
  -- vim.notify('DEBUG: Linha: ' .. line_content, vim.log.levels.DEBUG)
  -- vim.notify('DEBUG: Palavra identificada: ' .. current_word, vim.log.levels.DEBUG)

  if not current_word or current_word == "" then
    vim.notify("Nenhum link ou palavra identificada na posição do clique.", vim.log.levels.INFO)
    return
  end

  -- Remover aspas simples/duplas que podem vir junto com o caminho
  current_word = current_word:gsub("^['\"]", ""):gsub("['\"]$", "")

  -- Tentar como URL
  if current_word:match("^https?://") then
    vim.notify("Abrindo URL: " .. current_word, vim.log.levels.INFO)
    vim.fn.system({ "xdg-open", current_word })
    return
  end

  -- Tentar como Caminho de Arquivo ou Erro
  -- Regex mais abrangente para caminhos (incluindo Windows paths com \)
  -- e formatos de erro comuns.
  local match_file_line = string.match(current_word, "(.+):(%d+):?(%d*)") -- /path/to/file:line:col
  if not match_file_line then
    match_file_line = string.match(current_word, "([%w%-_./\\]+)%((%d+)%)") -- file(line)
  end

  local file_path, line_num, col_num
  if type(match_file_line) == "table" then -- if string.match returns multiple values, it's a table in Lua
    file_path = match_file_line[1]
    line_num = match_file_line[2]
    col_num = match_file_line[3]
  elseif type(match_file_line) == "string" then -- if it's a simple match for file(line)
    file_path = match_file_line
    line_num = string.match(current_word, "[%w%-_./\\]+%((%d+)%)")
  end

  if file_path and line_num then
    -- Tentar resolver o caminho relativo ao diretório de trabalho atual
    local resolved_path = vim.fn.resolve(file_path)
    if vim.fn.filereadable(resolved_path) == 1 then
      vim.notify(string.format("Navegando para erro: %s:%s", resolved_path, line_num), vim.log.levels.INFO)
      vim.cmd("tabnew " .. resolved_path)
      vim.cmd(string.format("%sgo", line_num))
      if col_num and col_num ~= "" then
        vim.cmd(string.format("%s|", col_num))
      end
      return
    end
  end

  -- Tentar como um caminho de arquivo puro se não for um erro
  local resolved_path_pure = vim.fn.resolve(current_word)
  if vim.fn.filereadable(resolved_path_pure) == 1 then
    vim.notify("Abrindo arquivo em nova aba: " .. resolved_path_pure, vim.log.levels.INFO)
    vim.cmd("tabnew " .. resolved_path_pure)
    return
  end

  vim.notify("Não foi possível identificar um link, arquivo ou erro válido.", vim.log.levels.WARN)
end

return M
