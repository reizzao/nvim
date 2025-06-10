-- Os mapas de teclas são carregados automaticamente no evento VeryLazy
-- Mapas de teclas padrão que são sempre definidos: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Adicione quaisquer mapas de teclas adicionais aqui

---@class LazyVim.KeymapOpts
---@field desc string
---@field silent boolean
---@field noremap boolean
---@field override boolean
---@field buffer? number
---@field nowait? boolean

-- Opções de Mapeamento Padrão
-- silent: Suprime mensagens na linha de comando
-- noremap: Garante que o lado direito do mapeamento não seja remapeado
-- override: Garante que este mapeamento tenha precedência sobre outros
local default_map_opts = { silent = true, noremap = true, override = true }

-- Função auxiliar para simplificar a definição de mapeamentos
-- Combina 'default_map_opts' com opções específicas fornecidas
---@param modes string|string[]
---@param lhs string
---@param rhs string
---@param desc string
local function set_keymap(modes, lhs, rhs, desc)
  local opts = vim.deepcopy(default_map_opts) -- Copia as opções padrão
  opts.desc = desc -- Adiciona a descrição
  vim.keymap.set(modes, lhs, rhs, opts)
end

---
--- # 1. Ações de Sair e Salvar
---

-- Ação: Salvar
-- Atalho: <C-s> (Ctrl + s)
set_keymap("n", "<C-s>", "<cmd>w<CR>", "Salvar arquivo")

-- Ação: Sair sem salvar (forçado)
set_keymap("n", "<leader>qq", "<cmd>qa!<CR>", "Sair sem salvar (forçado)")

-- Ação: Sair salvando
-- Atalho: <leader>wq (Space + w + q)
set_keymap("n", "<leader>wq", "<cmd>wq<CR>", "Salvar e sair")

---
--- # 2. Ações de Copiar e Colar
---

-- Ação: Copiar (yank)
-- Atalho: <leader>y (Space + y)
-- Mapeado em modo normal e visual para consistência.
set_keymap({ "n", "v" }, "<leader>y", "y", "Copiar seleção/linha")

-- Ação: Colar (paste)
-- Atalho: <leader>p (Space + p)
set_keymap("n", "<leader>p", "p", "Colar após o cursor/seleção")
-- Em inserção, <C-r>" cola o conteúdo do registro padrão.
set_keymap("i", "<leader>p", "<C-r>\"", "Colar no modo de inserção")

-- Ação: Copiar e já colar (duplicar linha)
-- Atalho: <leader>dd (Space + d + d) - Duplica a linha atual
set_keymap("n", "<leader>dd", "yyP", "Duplicar linha atual")

-- Ação: Copiar e já colar (duplicar seleção)
-- Atalho: <leader>dv (Space + d + v) - Duplica a seleção visual
set_keymap({ "v", "x" }, "<leader>dv", "ygvP", "Duplicar seleção")
-- 'y': yank (copiar)
-- 'gV': re-seleciona a última seleção visual
-- 'P': paste (colar) antes da seleção/cursor (geralmente mais útil para duplicação)

---
--- # 3. Ações de Refazer e Desfazer
---

-- Ação: Desfazer (undo)
-- Atalho: u (Padrão do Vim, mantido por ser familiar)
set_keymap("n", "u", "u", "Desfazer")

-- Ação: Refazer (redo)
-- Atalho: <C-r> (Padrão do Vim, mantido por ser familiar)
set_keymap("n", "<C-r>", "<C-r>", "Refazer")

---
--- # 4. Ações de Deletar
---

-- Ação: Deletar linha
-- Atalho: <leader>dl (Space + d + l) - (Delete Line)
-- Ou você pode simplesmente usar 'dd' que é o padrão do Vim.
set_keymap("n", "<leader>dl", "dd", "Deletar linha atual")

-- Ação: Deletar seleção
-- Atalho: d (Padrão do Vim para deletar seleção visual, mantido por ser familiar)
set_keymap({ "v", "x" }, "d", "d", "Deletar seleção")

---
--- # 5. Multi-Cursor com Setas (Simulação de Navegação)
--- NOTA: O Neovim não tem multi-cursor nativo como VSCode.
--- Isso é uma simulação via mapeamentos de movimento.
--- Para multi-cursor verdadeiro, use plugins como 'nvim-next'.

-- Ação: Pular palavra por palavra para trás
-- Atalho: <S-Left> (Shift + Seta para Esquerda)
set_keymap({ "n", "v", "x" }, "<S-Left>", "b", "Pular palavra anterior")
set_keymap("i", "<S-Left>", "<C-o>b", "Pular palavra anterior (modo inserção)")

-- Ação: Pular palavra por palavra para frente
-- Atalho: <S-Right> (Shift + Seta para Direita)
set_keymap({ "n", "v", "x" }, "<S-Right>", "e", "Pular para o fim da palavra")
set_keymap("i", "<S-Right>", "<C-o>e", "Pular para o fim da palavra (modo inserção)")

-- Ação: Ir para o início da linha (primeiro caractere)
-- Atalho: <S-Home> (Shift + Home)
set_keymap({ "n", "v", "x" }, "<S-Home>", "0", "Ir para o início da linha")
set_keymap("i", "<S-Home>", "<C-o>0", "Ir para o início da linha (modo inserção)")

-- Ação: Ir para o fim da linha
-- Atalho: <S-End> (Shift + End)
set_keymap({ "n", "v", "x" }, "<S-End>", "$", "Ir para o fim da linha")
set_keymap("i", "<S-End>", "<C-o>$", "Ir para o fim da linha (modo inserção)")

-- Ação: Pular parágrafo/bloco para cima
-- Atalho: <S-Up> (Shift + Seta para Cima)
set_keymap({ "n", "v", "x" }, "<S-Up>", "{", "Pular parágrafo/bloco para cima")
set_keymap("i", "<S-Up>", "<C-o>{", "Pular parágrafo/bloco para cima (modo inserção)")

-- Ação: Pular parágrafo/bloco para baixo
-- Atalho: <S-Down> (Shift + Seta para Baixo)
set_keymap({ "n", "v", "x" }, "<S-Down>", "}", "Pular parágrafo/bloco para baixo")
set_keymap("i", "<S-Down>", "<C-o>}", "Pular parágrafo/bloco para baixo (modo inserção)")

---
--- # 6. Selecionar Tudo
---

-- Ação: Selecionar tudo
-- Atalho: <C-a> (Ctrl + a)
-- Funciona em modo normal, visual e de inserção.
-- Em modo de inserção, primeiro sai para o modo normal (<C-o>), depois executa ggVG.
set_keymap("n", "<C-a>", "ggVG", "Selecionar tudo")
set_keymap("v", "<C-a>", "ggVG", "Selecionar tudo") -- No modo visual, expande a seleção
set_keymap("i", "<C-a>", "<C-o>ggVG", "Selecionar tudo (modo inserção)")