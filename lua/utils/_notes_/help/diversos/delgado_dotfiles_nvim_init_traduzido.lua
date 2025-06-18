--[[

=====================================================================
==================== LEIA ISSO ANTES DE CONTINUAR ===================
=====================================================================
========                                    .-----.          ========
========         .----------------------.   | === |          ========
========         |.-""""""""""""""""""-.|   |-----|          ========
========         ||                    ||   | === |          ========
========         ||   KICKSTART.NVIM   ||   |-----|          ========
========         ||                    ||   | === |          ========
========         ||                    ||   |-----|          ========
========         ||:Tutor              ||   |:::::|          ========
========         |'-..................-'|   |____o|          ========
========         `"")----------------(""`   ___________      ========
========        /::::::::::|  |::::::::::\  \ sem mouse \    ========
========       /:::========|  |==hjkl==:::\  \ necessário \   ========
========      '""""""""""""'  '""""""""""""'  '""""""""""'   ========
========                                                     ========
=====================================================================
=====================================================================

O que é o Kickstart?

  Kickstart.nvim *não* é uma distribuição.

  Kickstart.nvim é um ponto de partida para sua própria configuração.
    O objetivo é que você possa ler cada linha de código, de cima para baixo, entender
    o que sua configuração está fazendo e modificá-la para atender às suas necessidades.

    Depois de fazer isso, você pode começar a explorar, configurar e ajustar para
    tornar o Neovim seu! Isso pode significar deixar o Kickstart como está por um tempo
    ou dividi-lo imediatamente em peças modulares. Depende de você!

    Se você não sabe nada sobre Lua, recomendo dedicar um tempo para ler
    um guia. Um exemplo possível que levará apenas de 10 a 15 minutos:
      - https://learnxinyminutes.com/docs/lua/

    Depois de entender um pouco mais sobre Lua, você pode usar `:help lua-guide` como
    referência sobre como o Neovim integra o Lua.
    - :help lua-guide
    - (ou versão HTML): https://neovim.io/doc/user/lua-guide.html

Guia do Kickstart:

  TODO: A primeira coisa que você deve fazer é executar o comando `:Tutor` no Neovim.

    Se você não sabe o que isso significa, digite o seguinte:
      - <tecla escape>
      - :
      - Tutor
      - <tecla enter>

    (Se você já conhece os conceitos básicos do Neovim, você pode pular esta etapa.)

  Depois de concluir isso, você pode continuar trabalhando **E LENDO** o restante
  do kickstart init.lua.

  Em seguida, execute E LEIA `:help`.
    Isso abrirá uma janela de ajuda com algumas informações básicas
    sobre como ler, navegar e pesquisar a documentação de ajuda embutida.

    Este deve ser o primeiro lugar onde você procura quando está travado ou confuso
    com algo. É uma das minhas funcionalidades favoritas do Neovim.

    MAIS IMPORTANTE, fornecemos um atalho de teclado "<space>sh" para [p]esquisar a [a]juda (help),
    o que é muito útil quando você não tem certeza do que está procurando.

  Deixei vários comentários `:help X` por todo o init.lua
    Essas são dicas sobre onde encontrar mais informações sobre as configurações,
    plugins ou funcionalidades do Neovim relevantes usadas no Kickstart.

   NOTA: Procure por linhas como esta

    Ao longo do arquivo. Estas são para você, o leitor, para ajudá-lo a entender o que está acontecendo.
    Sinta-se à vontade para excluí-las assim que souber o que está fazendo, mas elas devem servir como um guia
    para quando você está encontrando pela primeira vez algumas construções diferentes em sua configuração do Neovim.

Se você tiver algum erro ao tentar instalar o kickstart, execute `:checkhealth` para mais informações.

Espero que você aproveite sua jornada no Neovim,
- TJ

P.S. Você também pode excluir isso quando terminar. Agora é sua configuração! :)
--]]

-- Define <space> como a tecla líder
-- Veja `:help mapleader`
--  NOTA: Deve acontecer antes que os plugins sejam carregados (caso contrário, o líder errado será usado)
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Define como true se você tiver uma Nerd Font instalada e selecionada no terminal
vim.g.have_nerd_font = true

-- [[ Definindo opções ]]
-- Veja `:help vim.opt`
-- NOTA: Você pode mudar essas opções como desejar!
--  Para mais opções, você pode ver `:help option-list`

-- Torna os números de linha padrão
vim.opt.number = true
-- Você também pode adicionar números de linha relativos, para ajudar com saltos.
--  Experimente para ver se você gosta!
vim.opt.relativenumber = true

-- Habilita o modo mouse, pode ser útil para redimensionar divisões, por exemplo!
vim.opt.mouse = "a"

-- Não mostra o modo, pois já está na linha de status
vim.opt.showmode = false

-- Sincroniza a área de transferência entre o SO e o Neovim.
--  Remova esta opção se você quiser que a área de transferência do seu SO permaneça independente.
--  Veja `:help 'clipboard'`
vim.opt.clipboard = "unnamedplus"

-- Habilita o recuo de quebra
vim.opt.breakindent = true

-- Salva o histórico de desfazer
vim.opt.undofile = true

-- Pesquisa sem distinção entre maiúsculas e minúsculas, A MENOS QUE \C ou uma ou mais letras maiúsculas no termo de pesquisa
vim.opt.ignorecase = true
vim.opt.smartcase = true

-- Mantém a signcolumn ativada por padrão
vim.opt.signcolumn = "yes"

-- Diminui o tempo de atualização
vim.opt.updatetime = 250

-- Diminui o tempo de espera da sequência mapeada
-- Exibe o pop-up do which-key mais cedo
vim.opt.timeoutlen = 300

-- Configura como as novas divisões devem ser abertas
vim.opt.splitright = true
vim.opt.splitbelow = true

-- Define como o Neovim exibirá certos caracteres de espaço em branco no editor.
--  Veja `:help 'list'`
--  e `:help 'listchars'`
vim.opt.list = true
vim.opt.listchars = { tab = "» ", trail = "·", nbsp = "␣" }

-- Visualiza substituições ao vivo, enquanto você digita!
vim.opt.inccommand = "split"

-- Mostra em qual linha seu cursor está
vim.opt.cursorline = true

-- Número mínimo de linhas na tela para manter acima e abaixo do cursor.
vim.opt.scrolloff = 10

-- [[ Mapeamentos de Teclas Básicos ]]
--  Veja `:help vim.keymap.set()`

-- Define destaque na pesquisa, mas limpa ao pressionar <Esc> no modo normal
vim.opt.hlsearch = true
vim.keymap.set("n", "<Esc>", "<cmd>nohlsearch<CR>")

-- Mapeamentos de teclas de diagnóstico
vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, { desc = "Ir para a mensagem de [D]iagnóstico anterior" })
vim.keymap.set("n", "]d", vim.diagnostic.goto_next, { desc = "Ir para a mensagem de [D]iagnóstico seguinte" })
vim.keymap.set("n", "<leader>e", vim.diagnostic.open_float, { desc = "Mostrar mensagens de [E]rro de diagnóstico" })
vim.keymap.set("n", "<leader>q", vim.diagnostic.setloclist, { desc = "Abrir lista [Q]uickfix de diagnóstico" })

-- Sair do modo de terminal no terminal embutido com um atalho que é um pouco mais fácil
-- para as pessoas descobrirem. Caso contrário, você normalmente precisa pressionar <C-\><C-n>, o que
-- não é o que alguém adivinharia sem um pouco mais de experiência.
--
-- NOTA: Isso não funcionará em todos os emuladores de terminal/tmux/etc. Tente seu próprio mapeamento
-- ou apenas use <C-\><C-n> para sair do modo de terminal
vim.keymap.set("t", "<Esc><Esc>", "<C-\\><C-n>", { desc = "Sair do modo de terminal" })

-- DICA: Desativar as setas no modo normal
-- vim.keymap.set('n', '<left>', '<cmd>echo "Use h para mover!!"<CR>')
-- vim.keymap.set('n', '<right>', '<cmd>echo "Use l para mover!!"<CR>')
-- vim.keymap.set('n', '<up>', '<cmd>echo "Use k para mover!!"<CR>')
-- vim.keymap.set('n', '<down>', '<cmd>echo "Use j para mover!!"<CR>')

-- Atalhos para facilitar a navegação dividida.
--  Use CTRL+<hjkl> para alternar entre as janelas
--
--  Veja `:help wincmd` para uma lista de todos os comandos de janela
vim.keymap.set("n", "<C-h>", "<C-w><C-h>", { desc = "Mover foco para a janela esquerda" })
vim.keymap.set("n", "<C-l>", "<C-w><C-l>", { desc = "Mover foco para a janela direita" })
vim.keymap.set("n", "<C-j>", "<C-w><C-j>", { desc = "Mover foco para a janela inferior" })
vim.keymap.set("n", "<C-k>", "<C-w><C-k>", { desc = "Mover foco para a janela superior" })

-- [[ Autocomandos Básicos ]]
--  Veja `:help lua-guide-autocommands`

-- Destacar ao puxar (copiar) texto
--  Experimente com `yap` no modo normal
--  Veja `:help vim.highlight.on_yank()`
vim.api.nvim_create_autocmd("TextYankPost", {
	desc = "Destacar ao puxar (copiar) texto",
	group = vim.api.nvim_create_augroup("kickstart-highlight-yank", { clear = true }),
	callback = function()
		vim.highlight.on_yank()
	end,
})

-- [[ Instalar o gerenciador de plugins `lazy.nvim` ]]
--    Veja `:help lazy.nvim.txt` ou https://github.com/folke/lazy.nvim para mais informações
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
	local lazyrepo = "https://github.com/folke/lazy.nvim.git"
	vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
end ---@diagnostic disable-next-line: undefined-field
vim.opt.rtp:prepend(lazypath)

-- [[ Configurar e instalar plugins ]]
--
--  Para verificar o status atual dos seus plugins, execute
--    :Lazy
--
--  Você pode pressionar `?` neste menu para obter ajuda. Use `:q` para fechar a janela
--
--  Para atualizar os plugins, você pode executar
--    :Lazy update
--
-- NOTA: Aqui é onde você instala seus plugins.
require("lazy").setup({
	-- NOTA: Plugins podem ser adicionados com um link (ou para um repositório github: link 'owner/repo').
	"tpope/vim-sleuth", -- Detecta tabstop e shiftwidth automaticamente
	"norcalli/nvim-colorizer.lua",

	-- NOTA: Plugins também podem ser adicionados usando uma tabela,
	-- sendo o primeiro argumento o link e as chaves seguintes
	-- podem ser usadas para configurar o comportamento/carregamento do plugin/etc.
	--
	-- Use `opts = {}` para forçar o carregamento de um plugin.
	--
	--  Isso é equivalente a:
	--    require('Comment').setup({})

	-- "gc" para comentar regiões/linhas visuais
	{ "numToStr/Comment.nvim", opts = {} },

	-- Aqui está um exemplo mais avançado onde passamos opções de configuração
	-- para `gitsigns.nvim`. Isso é equivalente ao seguinte Lua:
	--    require('gitsigns').setup({ ... })
	--
	-- Veja `:help gitsigns` para entender o que as chaves de configuração fazem
	{ -- Adiciona sinais relacionados ao git na gutter, bem como utilitários para gerenciar alterações
		"lewis6991/gitsigns.nvim",
		opts = {
			signs = {
				add = { text = "+" },
				change = { text = "~" },
				delete = { text = "_" },
				topdelete = { text = "‾" },
				changedelete = { text = "~" },
			},
		},
	},

	-- NOTA: Plugins também podem ser configurados para executar código Lua quando são carregados.
	--
	-- Isso é frequentemente muito útil tanto para agrupar a configuração, quanto para lidar com
	-- o carregamento preguiçoso de plugins que não precisam ser carregados imediatamente na inicialização.
	--
	-- Por exemplo, na seguinte configuração, usamos:
	--  event = 'VimEnter'
	--
	-- que carrega o which-key antes que todos os elementos da UI sejam carregados. Os eventos podem ser
	-- eventos de autocomandos normais (`:help autocmd-events`).
	--
	-- Então, porque usamos a chave `config`, a configuração só é executada
	-- depois que o plugin foi carregado:
	--  config = function() ... end

	{ -- Plugin útil para mostrar os atalhos de teclado pendentes.
		"folke/which-key.nvim",
		event = "VimEnter", -- Define o evento de carregamento para 'VimEnter'
		config = function() -- Esta é a função que é executada, DEPOIS de carregar
			require("which-key").setup()

			-- Documenta as cadeias de teclas existentes
			require("which-key").add({
				{ "<leader>c", group = "[C]ódigo" },
				{ "<leader>d", group = "[D]ocumento" },
				{ "<leader>r", group = "[R]enomear" },
				{ "<leader>s", group = "[P]esquisar" },
				{ "<leader>w", group = "[Á]rea de trabalho" },
				{ "<leader>t", group = "[A]lt./Desalt." }, -- "Toggle" -> Alternar/Desalternar
				{ "<leader>h", group = "Git [H]unk", mode = { "n", "v" } },
			})
		end,
	},

	-- NOTA: Plugins podem especificar dependências.
	--
	-- As dependências são especificações de plugin adequadas também - qualquer coisa
	-- que você faça para um plugin no nível superior, você pode fazer para uma dependência.
	--
	-- Use a chave `dependencies` para especificar as dependências de um plugin em particular

	{ -- Localizador Fuzzy (arquivos, lsp, etc)
		"nvim-telescope/telescope.nvim",
		event = "VimEnter",
		branch = "0.1.x",
		dependencies = {
			"nvim-lua/plenary.nvim",
			{ -- Se encontrar erros, veja o README do telescope-fzf-native para instruções de instalação
				"nvim-telescope/telescope-fzf-native.nvim",

				-- `build` é usado para executar algum comando quando o plugin é instalado/atualizado.
				-- Isso é executado apenas então, não toda vez que o Neovim inicia.
				build = "make",

				-- `cond` é uma condição usada para determinar se este plugin deve ser
				-- instalado e carregado.
				cond = function()
					return vim.fn.executable("make") == 1
				end,
			},
			{ "nvim-telescope/telescope-ui-select.nvim" },

			-- Útil para obter ícones bonitos, mas requer uma Nerd Font.
			{ "nvim-tree/nvim-web-devicons", enabled = vim.g.have_nerd_font },
		},
		config = function()
			-- Telescope é um localizador fuzzy que vem com muitas coisas diferentes que
			-- ele pode localizar! É mais do que apenas um "localizador de arquivos", ele pode pesquisar
			-- muitos aspectos diferentes do Neovim, seu espaço de trabalho, LSP e muito mais!
			--
			-- A maneira mais fácil de usar o Telescope é começar fazendo algo como:
			--  :Telescope help_tags
			--
			-- Depois de executar este comando, uma janela será aberta e você poderá
			-- digitar na janela de prompt. Você verá uma lista de opções `help_tags` e
			-- uma pré-visualização correspondente da ajuda.
			--
			-- Duas teclas importantes para usar no Telescope são:
			--  - Modo de Inserção: <c-/>
			--  - Modo Normal: ?
			--
			-- Isso abre uma janela que mostra todos os atalhos para o selecionador
			-- atual do Telescope. Isso é realmente útil para descobrir o que o Telescope pode
			-- fazer e como realmente fazer!

			-- [[ Configurar Telescope ]]
			-- Veja `:help telescope` e `:help telescope.setup()`
			require("telescope").setup({
				-- Você pode colocar seus mapeamentos padrão / atualizações / etc. aqui
				--  Todas as informações que você procura estão em `:help telescope.setup()`
				--
				-- defaults = {
				--   mappings = {
				--     i = { ['<c-enter>'] = 'to_fuzzy_refine' },
				--   },
				-- },
				-- pickers = {}
				extensions = {
					["ui-select"] = {
						require("telescope.themes").get_dropdown(),
					},
				},
			})

			-- Habilita as extensões do Telescope se estiverem instaladas
			pcall(require("telescope").load_extension, "fzf")
			pcall(require("telescope").load_extension, "ui-select")

			-- Veja `:help telescope.builtin`
			local builtin = require("telescope.builtin")
			vim.keymap.set("n", "<leader>sh", builtin.help_tags, { desc = "[P]esquisar [A]juda" }) -- Search Help
			vim.keymap.set("n", "<leader>sk", builtin.keymaps, { desc = "[P]esquisar [A]talhos" }) -- Search Keymaps
			vim.keymap.set("n", "<leader>sf", builtin.find_files, { desc = "[P]esquisar [A]rquivos" }) -- Search Files
			vim.keymap.set("n", "<leader>ss", builtin.builtin, { desc = "[P]esquisar [S]elecionar Telescope" })
			vim.keymap.set("n", "<leader>sw", builtin.grep_string, { desc = "[P]esquisar a [P]alavra atual" }) -- Search Word
			vim.keymap.set("n", "<leader>sg", builtin.live_grep, { desc = "[P]esquisar por [G]rep" }) -- Search Grep
			vim.keymap.set("n", "<leader>sd", builtin.diagnostics, { desc = "[P]esquisar [D]iagnósticos" }) -- Search Diagnostics
			vim.keymap.set("n", "<leader>sr", builtin.resume, { desc = "[P]esquisar [R]esumir" }) -- Search Resume
			vim.keymap.set("n", "<leader>s.", builtin.oldfiles, { desc = '[P]esquisar Arquivos [R]ecentes ("." para repetir)' }) -- Search Recent Files
			vim.keymap.set("n", "<leader><leader>", builtin.buffers, { desc = "[ ] Encontrar buffers existentes" })

			-- Exemplo ligeiramente avançado de substituição de comportamento padrão e tema
			vim.keymap.set("n", "<leader>/", function()
				-- Você pode passar configurações adicionais para o Telescope para mudar o tema, layout, etc.
				builtin.current_buffer_fuzzy_find(require("telescope.themes").get_dropdown({
					winblend = 10,
					previewer = false,
				}))
			end, { desc = "[/] Pesquisa fuzzy no buffer atual" })

			-- Também é possível passar opções de configuração adicionais.
			--  Veja `:help telescope.builtin.live_grep()` para informações sobre chaves específicas
			vim.keymap.set("n", "<leader>s/", function()
				builtin.live_grep({
					grep_open_files = true,
					prompt_title = "Live Grep em Arquivos Abertos",
				})
			end, { desc = "[P]esquisar [/] em Arquivos Abertos" })

			-- Atalho para pesquisar seus arquivos de configuração do Neovim
			vim.keymap.set("n", "<leader>sn", function()
				builtin.find_files({ cwd = vim.fn.stdpath("config") })
			end, { desc = "[P]esquisar arquivos do [N]eovim" })
		end,
	},

	{ -- Configuração e Plugins LSP
		"neovim/nvim-lspconfig",
		dependencies = {
			-- Instala automaticamente LSPs e ferramentas relacionadas para stdpath para Neovim
			{ "williamboman/mason.nvim", config = true }, -- NOTA: Deve ser carregado antes dos dependentes
			"williamboman/mason-lspconfig.nvim",
			"WhoIsSethDaniel/mason-tool-installer.nvim",

			-- Atualizações de status úteis para LSP.
			-- NOTA: `opts = {}` é o mesmo que chamar `require('fidget').setup({})`
			{ "j-hui/fidget.nvim", opts = {} },

			-- `neodev` configura o Lua LSP para sua configuração, tempo de execução e plugins do Neovim
			-- usado para conclusão, anotações e assinaturas de APIs do Neovim
			{ "folke/neodev.nvim", opts = {} },
		},
		config = function()
			-- Breve parêntese: **O que é LSP?**
			--
			-- LSP é um acrônimo que você provavelmente já ouviu, mas talvez não entenda o que é.
			--
			-- LSP significa Language Server Protocol (Protocolo de Servidor de Linguagem). É um protocolo que ajuda editores
			-- e ferramentas de linguagem a se comunicarem de forma padronizada.
			--
			-- Em geral, você tem um "servidor" que é alguma ferramenta construída para entender uma linguagem particular
			-- (como `gopls`, `lua_ls`, `rust_analyzer`, etc.). Esses Language Servers
			-- (às vezes chamados de servidores LSP, mas isso é como dizer Máquina ATM) são
			-- processos autônomos que se comunicam com algum "cliente" - neste caso, o Neovim!
			--
			-- O LSP fornece ao Neovim recursos como:
			--  - Ir para a definição
			--  - Encontrar referências
			--  - Autocompletar
			--  - Pesquisa de Símbolos
			--  - e muito mais!
			--
			-- Assim, os Language Servers são ferramentas externas que devem ser instaladas separadamente do
			-- Neovim. É aqui que `mason` e plugins relacionados entram em jogo.
			--
			-- Se você está se perguntando sobre lsp vs treesitter, você pode consultar a seção de ajuda
			-- maravilhosamente e elegantemente composta, `:help lsp-vs-treesitter`

			--  Esta função é executada quando um LSP se anexa a um buffer específico.
			--    Ou seja, toda vez que um novo arquivo é aberto que está associado a
			--    um lsp (por exemplo, abrir `main.rs` está associado a `rust_analyzer`) esta
			--    função será executada para configurar o buffer atual
			vim.api.nvim_create_autocmd("LspAttach", {
				group = vim.api.nvim_create_augroup("kickstart-lsp-attach", { clear = true }),
				callback = function(event)
					-- NOTA: Lembre-se de que Lua é uma linguagem de programação real, e como tal é possível
					-- definir pequenas funções auxiliares e de utilidade para que você não precise se repetir.
					--
					-- Neste caso, criamos uma função que nos permite definir mapeamentos mais facilmente
					-- específicos para itens relacionados ao LSP. Ela define o modo, o buffer e a descrição para nós a cada vez.
					local map = function(keys, func, desc)
						vim.keymap.set("n", keys, func, { buffer = event.buf, desc = "LSP: " .. desc })
					end

					-- Pular para a definição da palavra sob o seu cursor.
					--  É onde uma variável foi declarada pela primeira vez, ou onde uma função é definida, etc.
					--  Para voltar, pressione <C-t>.
					map("gd", require("telescope.builtin").lsp_definitions, "[I]r para [D]efinição")

					-- Encontrar referências para a palavra sob o seu cursor.
					map("gr", require("telescope.builtin").lsp_references, "[I]r para [R]eferências")

					-- Pular para a implementação da palavra sob o seu cursor.
					--  Útil quando sua linguagem tem maneiras de declarar tipos sem uma implementação real.
					map("gI", require("telescope.builtin").lsp_implementations, "[I]r para [I]mplementação")

					-- Pular para o tipo da palavra sob o seu cursor.
					--  Útil quando você não tem certeza do tipo de uma variável e quer ver
					--  a definição de seu *tipo*, não onde foi *definido*.
					map("<leader>D", require("telescope.builtin").lsp_type_definitions, "[D]efinição de [T]ipo")

					-- Localizar fuzzy todos os símbolos no seu documento atual.
					--  Símbolos são coisas como variáveis, funções, tipos, etc.
					map("<leader>ds", require("telescope.builtin").lsp_document_symbols, "[S]ímbolos do [D]ocumento")

					-- Localizar fuzzy todos os símbolos no seu espaço de trabalho atual.
					--  Semelhante aos símbolos do documento, exceto que pesquisa em todo o seu projeto.
					map(
						"<leader>ws",
						require("telescope.builtin").lsp_dynamic_workspace_symbols,
						"[S]ímbolos do [E]spaço de [T]rabalho"
					)

					-- Renomeia a variável sob o seu cursor.
					--  A maioria dos Language Servers suporta renomeação entre arquivos, etc.
					map("<leader>rn", vim.lsp.buf.rename, "[R]e[n]omear")

					-- Executa uma ação de código, geralmente seu cursor precisa estar sobre um erro
					-- ou uma sugestão do seu LSP para que isso seja ativado.
					map("<leader>ca", vim.lsp.buf.code_action, "[A]ção de [C]ódigo")

					-- Abre um pop-up que exibe a documentação sobre a palavra sob o seu cursor
					--  Veja `:help K` para entender o porquê deste mapeamento de tecla.
					map("K", vim.lsp.buf.hover, "Documentação ao Passar o Mouse")

					-- ATENÇÃO: Isso não é "Ir para Definição", isso é "Ir para Declaração".
					--  Por exemplo, em C isso o levaria ao cabeçalho.
					map("gD", vim.lsp.buf.declaration, "[I]r para [D]eclaração")

					-- Os dois autocomandos a seguir são usados para destacar referências da
					-- palavra sob o seu cursor quando o cursor permanece lá por um tempo.
					--    Veja `:help CursorHold` para informações sobre quando isso é executado
					--
					-- Quando você move o cursor, os destaques serão limpos (o segundo autocomando).
					local client = vim.lsp.get_client_by_id(event.data.client_id)
					if client and client.server_capabilities.documentHighlightProvider then
						local highlight_augroup =
							vim.api.nvim_create_augroup("kickstart-lsp-highlight", { clear = false })
						vim.api.nvim_create_autocmd({ "CursorHold", "CursorHoldI" }, {
							buffer = event.buf,
							group = highlight_augroup,
							callback = vim.lsp.buf.document_highlight,
						})

						vim.api.nvim_create_autocmd({ "CursorMoved", "CursorMovedI" }, {
							buffer = event.buf,
							group = highlight_augroup,
							callback = vim.lsp.buf.clear_references,
						})

						vim.api.nvim_create_autocmd("LspDetach", {
							group = vim.api.nvim_create_augroup("kickstart-lsp-detach", { clear = true }),
							callback = function(event2)
								vim.lsp.buf.clear_references()
								vim.api.nvim_clear_autocmds({ group = "kickstart-lsp-highlight", buffer = event2.buf })
							end,
						})
					end

					-- O autocomando a seguir é usado para habilitar dicas embutidas em seu
					-- código, se o servidor de linguagem que você está usando as suportar
					--
					-- Isso pode ser indesejado, pois deslocam parte do seu código
					if client and client.server_capabilities.inlayHintProvider and vim.lsp.inlay_hint then
						map("<leader>th", function()
							vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled())
						end, "[A]lt./Desalt. [D]icas Embutidas")
					end
				end,
			})

			-- Servidores e clientes LSP são capazes de comunicar entre si quais recursos eles suportam.
			--  Por padrão, o Neovim não suporta tudo que está na especificação LSP.
			--  Quando você adiciona nvim-cmp, luasnip, etc., o Neovim agora tem *mais* capacidades.
			--  Então, criamos novas capacidades com nvim cmp e, em seguida, as transmitimos aos servidores.
			local capabilities = vim.lsp.protocol.make_client_capabilities()
			capabilities = vim.tbl_deep_extend("force", capabilities, require("cmp_nvim_lsp").default_capabilities())

			-- Habilita os seguintes servidores de linguagem
			--  Sinta-se à vontade para adicionar/remover quaisquer LSPs que você desejar aqui. Eles serão instalados automaticamente.
			--
			--  Adicione qualquer configuração de substituição adicional nas tabelas a seguir. As chaves disponíveis são:
			--  - cmd (tabela): Substitui o comando padrão usado para iniciar o servidor
			--  - filetypes (tabela): Substitui a lista padrão de tipos de arquivo associados ao servidor
			--  - capabilities (tabela): Substitui campos em capabilities. Pode ser usado para desabilitar certas funcionalidades LSP.
			--  - settings (tabela): Substitui as configurações padrão passadas ao inicializar o servidor.
			--        Por exemplo, para ver as opções para `lua_ls`, você pode ir para: https://luals.github.io/wiki/settings/
			local servers = {
				-- clangd = {},
				gopls = {},
				pyright = {},
				terraformls = {},
				-- rust_analyzer = {},
				-- ... etc. Veja `:help lspconfig-all` para uma lista de todos os LSPs pré-configurados
				--
				-- Algumas linguagens (como typescript) possuem plugins de linguagem inteiros que podem ser úteis:
				--    https://github.com/pmizio/typescript-tools.nvim
				--
				-- Mas para muitas configurações, o LSP (`tsserver`) funcionará muito bem
				-- tsserver = {},
				--

				lua_ls = {
					-- cmd = {...},
					-- filetypes = { ...},
					-- capabilities = {},
					settings = {
						Lua = {
							completion = {
								callSnippet = "Replace",
							},
							-- Você pode alternar abaixo para ignorar os avisos barulhentos de `missing-fields` do Lua_LS
							-- diagnostics = { disable = { 'missing-fields' } },
						},
					},
				},
			}

			-- Garante que os servidores e ferramentas acima sejam instalados
			--  Para verificar o status atual das ferramentas instaladas e/ou instalar manualmente
			--  outras ferramentas, você pode executar
			--    :Mason
			--
			--  Você pode pressionar `g?` para obter ajuda neste menu.
			require("mason").setup()

			-- Você pode adicionar outras ferramentas aqui que você deseja que o Mason instale
			-- para você, para que estejam disponíveis dentro do Neovim.
			local ensure_installed = vim.tbl_keys(servers or {})
			vim.list_extend(ensure_installed, {
				"stylua", -- Usado para formatar código Lua
			})
			require("mason-tool-installer").setup({ ensure_installed = ensure_installed })

			require("mason-lspconfig").setup({
				handlers = {
					function(server_name)
						local server = servers[server_name] or {}
						-- Isso lida com a substituição apenas dos valores passados explicitamente
						-- pela configuração do servidor acima. Útil ao desabilitar
						-- certas funcionalidades de um LSP (por exemplo, desativar a formatação para tsserver)
						server.capabilities = vim.tbl_deep_extend("force", {}, capabilities, server.capabilities or {})
						require("lspconfig")[server_name].setup(server)
					end,
				},
			})
		end,
	},

	{ -- Autoformatação
		"stevearc/conform.nvim",
		lazy = false,
		keys = {
			{
				"<leader>f",
				function()
					require("conform").format({ async = true, lsp_fallback = true })
				end,
				mode = "",
				desc = "[F]ormatar buffer",
			},
		},
		opts = {
			notify_on_error = false,
			format_on_save = function(bufnr)
				-- Desativa "format_on_save lsp_fallback" para linguagens que não
				-- possuem um estilo de codificação bem padronizado. Você pode adicionar
				-- linguagens adicionais aqui ou reabilitá-lo para as desabilitadas.
				local disable_filetypes = { c = true, cpp = true }
				return {
					timeout_ms = 500,
					lsp_fallback = not disable_filetypes[vim.bo[bufnr].filetype],
				}
			end,
			formatters_by_ft = {
				lua = { "stylua" },
				-- O Conform também pode executar vários formatadores sequencialmente
				-- python = { "isort", "black" },
				--
				-- Você pode usar uma sub-lista para dizer ao conform para executar *até* que um formatador
				-- seja encontrado.
				-- javascript = { { "prettierd", "prettier" } },
			},
		},
	},

	{ -- Autocompletar
		"hrsh7th/nvim-cmp",
		event = "InsertEnter",
		dependencies = {
			-- Motor de Snippets e sua fonte nvim-cmp associada
			{
				"L3MON4D3/LuaSnip",
				build = (function()
					-- A etapa de construção é necessária para suporte a regex em snippets.
					-- Esta etapa não é suportada em muitos ambientes Windows.
					-- Remova a condição abaixo para reabilitar no Windows.
					if vim.fn.has("win32") == 1 or vim.fn.executable("make") == 0 then
						return
					end
					return "make install_jsregexp"
				end)(),
				dependencies = {
					-- `friendly-snippets` contém uma variedade de snippets pré-fabricados.
					--    Veja o README sobre snippets de linguagem/framework/plugin individuais:
					--    https://github.com/rafamadriz/friendly-snippets
					-- {
					--   'rafamadriz/friendly-snippets',
					--   config = function()
					--     require('luasnip.loaders.from_vscode').lazy_load()
					--   end,
					-- },
				},
			},
			"saadparwaiz1/cmp_luasnip",

			-- Adiciona outras capacidades de conclusão.
			--  O nvim-cmp não vem com todas as fontes por padrão. Elas são divididas
			--  em vários repositórios para fins de manutenção.
			"hrsh7th/cmp-nvim-lsp",
			"hrsh7th/cmp-path",
		},
		config = function()
			-- Veja `:help cmp`
			local cmp = require("cmp")
			local luasnip = require("luasnip")
			luasnip.config.setup({})

			cmp.setup({
				snippet = {
					expand = function(args)
						luasnip.lsp_expand(args.body)
					end,
				},
				completion = { completeopt = "menu,menuone,noinsert" },

				-- Para entender por que esses mapeamentos foram
				-- escolhidos, você precisará ler `:help ins-completion`
				--
				-- Não, mas sério. Por favor, leia `:help ins-completion`, é muito bom!
				mapping = cmp.mapping.preset.insert({
					-- Seleciona o [p]róximo item
					["<C-n>"] = cmp.mapping.select_next_item(),
					-- Seleciona o item [a]nterior
					["<C-p>"] = cmp.mapping.select_prev_item(),

					-- Rola a janela de documentação para [trás] / para [frente]
					["<C-b>"] = cmp.mapping.scroll_docs(-4),
					["<C-f>"] = cmp.mapping.scroll_docs(4),

					-- Aceita ([s]im) a conclusão.
					--  Isso fará a importação automática se o seu LSP suportar.
					--  Isso expandirá snippets se o LSP enviou um snippet.
					["<C-y>"] = cmp.mapping.confirm({ select = true }),

					-- Se você preferir mapeamentos de teclas de conclusão mais tradicionais,
					-- você pode descomentar as seguintes linhas
					--['<CR>'] = cmp.mapping.confirm { select = true },
					--['<Tab>'] = cmp.mapping.select_next_item(),
					--['<S-Tab>'] = cmp.mapping.select_prev_item(),

					-- Aciona manualmente uma conclusão do nvim-cmp.
					--  Geralmente você não precisa disso, porque o nvim-cmp exibirá
					--  conclusões sempre que tiver opções de conclusão disponíveis.
					["<C-Space>"] = cmp.mapping.complete({}),

					-- Pense em <c-l> como mover-se para a direita da sua expansão de snippet.
					--  Então, se você tem um snippet que é tipo:
					--  function $name($args)
					--    $body
					--  end
					--
					-- <c-l> o moverá para a direita de cada um dos locais de expansão.
					-- <c-h> é semelhante, exceto que o move para trás.
					["<C-l>"] = cmp.mapping(function()
						if luasnip.expand_or_locally_jumpable() then
							luasnip.expand_or_jump()
						end
					end, { "i", "s" }),
					["<C-h>"] = cmp.mapping(function()
						if luasnip.locally_jumpable(-1) then
							luasnip.jump(-1)
						end
					end, { "i", "s" }),

					-- Para mapeamentos de teclas LuaSnip mais avançados (por exemplo, seleção de nós de escolha, expansão) veja:
					--    https://github.com/L3MON4D3/LuaSnip?tab=readme-ov-file#keymaps
				}),
				sources = {
					{ name = "nvim_lsp" },
					{ name = "luasnip" },
					{ name = "path" },
				},
			})
		end,
	},

	{ -- Você pode facilmente mudar para um esquema de cores diferente.
		-- Mude o nome do plugin do esquema de cores abaixo e, em seguida,
		-- mude o comando na configuração para qualquer que seja o nome desse esquema de cores.
		--
		-- Se você quiser ver quais esquemas de cores já estão instalados, você pode usar `:Telescope colorscheme`.
		"folke/tokyonight.nvim",
		priority = 1000, -- Certifique-se de carregar isso antes de todos os outros plugins de inicialização.
		init = function()
			-- Carrega o esquema de cores aqui.
			-- Como muitos outros temas, este tem estilos diferentes, e você poderia carregar
			-- qualquer outro, como 'tokyonight-storm', 'tokyonight-moon' ou 'tokyonight-day'.
			vim.cmd.colorscheme("tokyonight-night")

			-- Você pode configurar destaques fazendo algo como:
			vim.cmd.hi("Comment gui=none")
		end,
	},

	-- Destacar todo, notes, etc. em comentários
	{
		"folke/todo-comments.nvim",
		event = "VimEnter",
		dependencies = { "nvim-lua/plenary.nvim" },
		opts = { signs = false },
	},

	{ -- Coleção de vários pequenos plugins/módulos independentes
		"echasnovski/mini.nvim",
		config = function()
			-- Melhor Aro (provávelmente um corte, talvez "Better Arrows" ou "Better Auto...")
