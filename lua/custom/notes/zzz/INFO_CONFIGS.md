# INFO_CONFIGS

After_Installation:
- run: :`LazyHealth` -- check installation health


### LSP
Configs Iniciais
- Tem que ter o clangd instalado
- confere :`LspInfo` erro: not editor comand
- Instalar o Lsp: `LspInstall` escolhe clangd 
- o notify tem que dar mensagem que instalou com sucesso 

obs_na_instalacao_mason_lsp: tem ls no fim do nome, ou language_server ou só o nome da linguagem, mas precisa ser só os definidos no plugins/lspconfig.lua #crucial

my_lsps: [
  em ordem alfabética:

bashls
cssls
dartls
denols
gopls
html
jsonls
kotlin_language_server
lua_ls
marksman
vimls
yaml_language_server
]

FORMA DE ANALISAR E INSERIR OS LSP
apos o reset_nvim()

"Instale os Language Servers (LSPs) e Parsers (Treesitter).

No Neovim, digite :`Mason` e pressione Enter.

Instale SOMENTE os itens que são Language Servers da lista ensure_installed do seu lspconfig.lua 
(ex: denols, gopls, bashls, kotlin_language_server, dartls, html, cssls, lua_ls, vimls, marksman, yaml_language_server, jsonls).

Não se preocupe em instalar shfmt, stylua, markdownlint, jsonlint, golangci-lint diretamente pelo Mason para nvim-lspconfig. Eles são ferramentas CLI. Se você quiser integrá-los como formatadores/linters, você precisaria de um plugin como nvimtools/none-ls.nvim ou stevearc/conform.nvim (mencionado no dependencies do lspconfig.lua no exemplo acima, mas comentado).
Execute :TSUpdate para os parsers do Treesitter.

Reinicie o Neovim (feche e abra novamente).


- Essas pastas tem que existir se nao existir crie-as
  - Se alguma dessas pastas não existir, ou estiver vazia/com problemas, você precisará reinstalá-las.
`
ls ~/.local/share/nvim/lazy/mason.nvim
ls ~/.local/share/nvim/lazy/mason-lspconfig.nvim
` 
- 
- Limpe o cache do LazyVim para os plugins LSP problemáticos:
`
rm -rf ~/.local/share/nvim/lazy/mason.nvim && rm -rf ~/.local/share/nvim/lazy/mason-lspconfig.nvim
`
- crie plugin cmp
- limpe cmp: `rm -rf ~/.local/share/nvim/lazy/nvim-cmp && rm -rf ~/.local/share/nvim/lazy/cmp-nvim-lsp`

- eu: depois do reset -> tudo certo nenhum erro na reinstalacao e nem ao reabrir o editor,

só ainda não esta funcionando o linter ele ainda permite escrever comandos errados e salav o arquivo o que o linter nao devia permitir mas vamos por partes os erros sumiram e o realce e auto complete voltou ..e ainda não sei qual config do lsp to usando se é o clangd  e quando quiser acrescentar e fazer o linter funcionar nas linguagens? 

Lsps_disponiveis_no_mason : [
  Installed
    ◍ shfmt
    ◍ stylua

  Available
    ◍ actionlint
    ◍ ada-language-server
    ◍ aiken
    ◍ air
    ◍ alejandra
    ◍ alex
    ◍ angular-language-server
    ◍ ansible-language-server
    ◍ ansible-lint
    ◍ antlers-language-server
    ◍ apex-language-server
    ◍ api-linter
    ◍ arduino-language-server
    ◍ asm-lsp
    ◍ asmfmt
    ◍ ast-grep
    ◍ astro-language-server
    ◍ autoflake
    ◍ autopep8
    ◍ autotools-language-server
    ◍ awk-language-server
    ◍ azure-pipelines-language-server
    ◍ bacon
    ◍ bacon-ls
    ◍ bandit
    ◍ basedpyright
    ◍ bash-debug-adapter
    ◍ bash-language-server
    ◍ basics-language-server
    ◍ bazelrc-lsp
    ◍ beancount-language-server
    ◍ beanhub-cli
    ◍ beautysh
    ◍ bibtex-tidy
    ◍ bicep-lsp
    ◍ biome
    ◍ black
    ◍ blackd-client
    ◍ blade-formatter
    ◍ blue
    ◍ brighterscript
    ◍ brighterscript-formatter
    ◍ brunette
    ◍ bsl-language-server
    ◍ bslint
    ◍ buf
    ◍ buf-language-server deprecated
    ◍ buildifier
    ◍ bzl
    ◍ c3-lsp
    ◍ cairo-language-server
    ◍ cbfmt
    ◍ cds-lsp
    ◍ cfn-lint
    ◍ checkmake
    ◍ checkstyle
    ◍ chrome-debug-adapter
    ◍ circleci-yaml-language-server
    ◍ circom-lsp
    ◍ clang-format
    ◍ clangd
    ◍ clarinet
    ◍ clarity-lsp deprecated
    ◍ clj-kondo
    ◍ cljfmt
    ◍ clojure-lsp
    ◍ cmake-language-server
    ◍ cmakelang
    ◍ cmakelint
    ◍ cobol-language-support
    ◍ codelldb
    ◍ codeql
    ◍ codespell
    ◍ coffeesense-language-server
    ◍ colorgen-nvim
    ◍ commitlint
    ◍ contextive
    ◍ copilot-language-server
    ◍ coq-lsp
    ◍ cortex-debug
    ◍ cpplint
    ◍ cpptools
    ◍ cql-language-server
    ◍ crlfmt
    ◍ crystalline
    ◍ csharp-language-server
    ◍ csharpier
    ◍ cspell
    ◍ css-lsp
    ◍ css-variables-language-server
    ◍ cssmodules-language-server
    ◍ cucumber-language-server
    ◍ cueimports
    ◍ cuelsp
    ◍ cuepls deprecated
    ◍ curlylint
    ◍ custom-elements-languageserver
    ◍ cypher-language-server
    ◍ darker
    ◍ dart-debug-adapter
    ◍ dcm
    ◍ debugpy
    ◍ delve
    ◍ deno
    ◍ detekt
    ◍ dhall-lsp
    ◍ diagnostic-languageserver
    ◍ digestif
    ◍ django-template-lsp
    ◍ djlint
    ◍ docformatter
    ◍ docker-compose-language-service
    ◍ dockerfile-language-server
    ◍ doctoc
    ◍ dot-language-server
    ◍ dotenv-linter
    ◍ dprint
    ◍ drools-lsp
    ◍ duster
    ◍ earthlyls
    ◍ easy-coding-standard
    ◍ editorconfig-checker
    ◍ efm
    ◍ elixir-ls
    ◍ elm-format
    ◍ elm-language-server
    ◍ elp
    ◍ ember-language-server
    ◍ emmet-language-server
    ◍ emmet-ls
    ◍ emmylua_ls
    ◍ erb-formatter
    ◍ erb-lint
    ◍ erg
    ◍ erg-language-server
    ◍ erlang-debugger
    ◍ erlang-ls
    ◍ esbonio
    ◍ eslint-lsp
    ◍ eslint_d
    ◍ eugene
    ◍ facility-language-server
    ◍ fantomas
    ◍ fennel-language-server
    ◍ fennel-ls
    ◍ findent
    ◍ firefox-debug-adapter
    ◍ fish-lsp
    ◍ fixjson
    ◍ flake8
    ◍ flakeheaven
    ◍ flux-lsp
    ◍ foam-language-server
    ◍ fortls
    ◍ fourmolu
    ◍ fprettify
    ◍ fsautocomplete
    ◍ gci
    ◍ gdtoolkit
    ◍ gersemi
    ◍ gh
    ◍ gh-actions-language-server
    ◍ ginko_ls
    ◍ gitlab-ci-ls
    ◍ gitleaks
    ◍ gitlint
    ◍ gitui
    ◍ glint
    ◍ glow
    ◍ glsl_analyzer
    ◍ glslls
    ◍ go-debug-adapter
    ◍ gofumpt
    ◍ goimports
    ◍ goimports-reviser
    ◍ golangci-lint
    ◍ golangci-lint-langserver
    ◍ golines
    ◍ gomodifytags
    ◍ google-java-format
    ◍ gopls
    ◍ gospel
    ◍ gotests
    ◍ gotestsum
    ◍ gradle-language-server
    ◍ grammarly-languageserver
    ◍ graphql-language-service-cli
    ◍ groovy-language-server
    ◍ hadolint
    ◍ haml-lint
    ◍ harper-ls
    ◍ haskell-debug-adapter
    ◍ haskell-language-server
    ◍ haxe-language-server
    ◍ hclfmt
    ◍ hdl-checker
    ◍ helm-ls
    ◍ hlint
    ◍ hoon-language-server
    ◍ html-lsp
    ◍ htmlbeautifier
    ◍ htmlhint
    ◍ htmx-lsp
    ◍ hydra-lsp
    ◍ hyprls
    ◍ iferr
    ◍ impl
    ◍ intelephense
    ◍ isort
    ◍ java-debug-adapter
    ◍ java-language-server
    ◍ java-test
    ◍ jayvee-language-server
    ◍ jdtls
    ◍ jedi-language-server
    ◍ jinja-lsp
    ◍ joker
    ◍ jq
    ◍ jq-lsp
    ◍ js-debug-adapter
    ◍ json-lsp
    ◍ json-to-struct
    ◍ jsonld-lsp
    ◍ jsonlint
    ◍ jsonnet-language-server
    ◍ jsonnetfmt
    ◍ julia-lsp
    ◍ jupytext
    ◍ just-lsp
    ◍ kcl
    ◍ kotlin-debug-adapter
    ◍ kotlin-language-server
    ◍ kotlin-lsp
    ◍ ktfmt
    ◍ ktlint
    ◍ kube-linter
    ◍ kulala-fmt
    ◍ language-server-bitbake
    ◍ latexindent
    ◍ lean-language-server
    ◍ lelwel
    ◍ lemminx
    ◍ lemmy-help
    ◍ lemonade
    ◍ lexical
    ◍ llm-ls
    ◍ local-lua-debugger-vscode
    ◍ ltex-ls
    ◍ ltex-ls-plus
    ◍ lua-language-server
    ◍ luacheck
    ◍ luaformatter
    ◍ luau-lsp
    ◍ lwc-language-server
    ◍ m68k-lsp-server
    ◍ markdown-oxide
    ◍ markdown-toc
    ◍ markdownlint
    ◍ markdownlint-cli2
    ◍ markmap-cli
    ◍ marksman
    ◍ markuplint
    ◍ matlab-language-server
    ◍ mdformat
    ◍ mdsf
    ◍ mdslw
    ◍ mdx-analyzer
    ◍ mesonlsp
    ◍ metamath-zero-lsp
    ◍ millet
    ◍ misspell
    ◍ mmdc
    ◍ mockdebug
    ◍ motoko-lsp
    ◍ move-analyzer
    ◍ mutt-language-server
    ◍ mypy
    ◍ neocmakelsp
    ◍ netcoredbg
    ◍ nextflow-language-server
    ◍ nextls
    ◍ nginx-config-formatter
    ◍ nginx-language-server
    ◍ nickel-lang-lsp
    ◍ nil
    ◍ nilaway
    ◍ nimlangserver
    ◍ nimlsp
    ◍ nixfmt
    ◍ nixpkgs-fmt
    ◍ node-debug2-adapter
    ◍ nomicfoundation-solidity-language-server
    ◍ npm-groovy-lint
    ◍ ntt
    ◍ nxls
    ◍ ocaml-lsp
    ◍ ocamlearlybird
    ◍ ocamlformat
    ◍ oelint-adv
    ◍ ols
    ◍ omnisharp
    ◍ omnisharp-mono
    ◍ opa
    ◍ opencl-language-server
    ◍ openedge-language-server
    ◍ openscad-language-server
    ◍ openscad-lsp
    ◍ ormolu
    ◍ oxlint
    ◍ pbls
    ◍ perl-debug-adapter
    ◍ perlnavigator
    ◍ pest-language-server
    ◍ pgformatter
    ◍ php-cs-fixer
    ◍ php-debug-adapter
    ◍ phpactor
    ◍ phpcbf
    ◍ phpcs
    ◍ phpmd
    ◍ phpstan
    ◍ pico8-ls
    ◍ pint
    ◍ pkgbuild-language-server deprecated
    ◍ pkl-lsp
    ◍ postgrestools
    ◍ powershell-editor-services
    ◍ prettier
    ◍ prettierd
    ◍ pretty-php
    ◍ prettydiff
    ◍ prettypst
    ◍ prisma-language-server
    ◍ proselint
    ◍ prosemd-lsp
    ◍ protolint
    ◍ protols
    ◍ psalm
    ◍ puppet-editor-services
    ◍ purescript-language-server
    ◍ purescript-tidy
    ◍ pydocstyle
    ◍ pyflakes
    ◍ pyink
    ◍ pylama
    ◍ pylint
    ◍ pylyzer
    ◍ pymarkdownlnt
    ◍ pyment
    ◍ pyproject-flake8
    ◍ pyproject-fmt
    ◍ pyre
    ◍ pyrefly
    ◍ pyright
    ◍ python-lsp-server
    ◍ quick-lint-js
    ◍ r-languageserver
    ◍ raku-navigator
    ◍ reason-language-server
    ◍ reformat-gherkin
    ◍ refurb
    ◍ regal
    ◍ regols
    ◍ remark-cli
    ◍ remark-language-server
    ◍ reorder-python-imports
    ◍ rescript-language-server
    ◍ rescript-lsp deprecated
    ◍ revive
    ◍ ripper-tags
    ◍ rnix-lsp
    ◍ robotcode
    ◍ robotframework-lsp
    ◍ rome deprecated
    ◍ rpmlint
    ◍ rstcheck
    ◍ rubocop
    ◍ ruby-lsp
    ◍ rubyfmt
    ◍ ruff
    ◍ ruff-lsp deprecated
    ◍ rufo
    ◍ rust-analyzer
    ◍ rust_hdl
    ◍ rustfmt deprecated
    ◍ rustywind
    ◍ salt-lint
    ◍ salt-lsp
    ◍ selene
    ◍ semgrep
    ◍ serve-d
    ◍ shellcheck
    ◍ shellharden
    ◍ shopify-cli
    ◍ shopify-theme-check deprecated
    ◍ sith-language-server
    ◍ slang
    ◍ sleek
    ◍ slint-lsp
    ◍ smithy-language-server
    ◍ snakefmt
    ◍ snakeskin-cli
    ◍ snyk
    ◍ snyk-ls
    ◍ solang
    ◍ solang-llvm
    ◍ solargraph
    ◍ solhint
    ◍ solidity
    ◍ solidity-ls
    ◍ some-sass-language-server
    ◍ sonarlint-language-server
    ◍ sorbet
    ◍ sourcery
    ◍ spectral-language-server
    ◍ sphinx-lint
    ◍ spyglassmc-language-server
    ◍ sql-formatter
    ◍ sqlfluff
    ◍ sqlfmt
    ◍ sqlls
    ◍ sqls
    ◍ sqruff
    ◍ standardjs
    ◍ standardrb
    ◍ starlark-rust
    ◍ starpls
    ◍ staticcheck
    ◍ steep
    ◍ stimulus-language-server
    ◍ stree
    ◍ stylelint
    ◍ stylelint-lsp
    ◍ superhtml
    ◍ svelte-language-server
    ◍ svlangserver
    ◍ svls
    ◍ swift-mesonlsp deprecated
    ◍ swiftlint
    ◍ systemd-language-server
    ◍ systemdlint
    ◍ tabby-agent
    ◍ tailwindcss-language-server
    ◍ taplo
    ◍ teal-language-server
    ◍ tectonic
    ◍ templ
    ◍ termux-language-server
    ◍ terraform
    ◍ terraform-ls
    ◍ tex-fmt
    ◍ texlab
    ◍ textlint
    ◍ textlsp
    ◍ tflint
    ◍ tfsec
    ◍ thriftls
    ◍ tilt
    ◍ tinymist
    ◍ tlint
    ◍ tofu-ls
    ◍ tree-sitter-cli
    ◍ trivy
    ◍ trufflehog
    ◍ ts-standard
    ◍ ts_query_ls
    ◍ tsp-server
    ◍ twig-cs-fixer
    ◍ twigcs
    ◍ twiggy-language-server
    ◍ ty
    ◍ typescript-language-server
    ◍ typos
    ◍ typos-lsp
    ◍ typst-lsp deprecated
    ◍ typstfmt deprecated
    ◍ typstyle
    ◍ unocss-language-server
    ◍ usort
    ◍ v-analyzer
    ◍ vacuum
    ◍ vala-language-server
    ◍ vale
    ◍ vale-ls
    ◍ verible
    ◍ veryl-ls
    ◍ vetur-vls
    ◍ vhdl-style-guide
    ◍ vim-language-server
    ◍ vint
    ◍ visualforce-language-server
    ◍ vls
    ◍ vscode-java-decompiler
    ◍ vscode-solidity-server
    ◍ vscode-spring-boot-tools
    ◍ vsg
    ◍ vtsls
    ◍ vue-language-server
    ◍ vulture
    ◍ wasm-language-tools
    ◍ wgsl-analyzer
    ◍ woke
    ◍ write-good
    ◍ xcbeautify
    ◍ xmlformatter
    ◍ xo deprecated
    ◍ yaml-language-server
    ◍ yamlfix
    ◍ yamlfmt
    ◍ yamllint
    ◍ yapf
    ◍ yls-yara
    ◍ yq
    ◍ zeek-language-server
    ◍ zk
    ◍ zls
    ◍ zprint
    ◍ zprint-clj


]