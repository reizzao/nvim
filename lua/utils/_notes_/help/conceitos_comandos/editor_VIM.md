

> Comceito_Lados_do_Teclado :

Perfeito! A filosofia de LHS (Left-Hand Side) e RHS (Right-Hand Side) é o conceito central por trás de como os mapeamentos de teclado funcionam no Neovim (e Vim). É uma forma clara e concisa de descrever a relação de causa e efeito em um atalho.
Vamos destrinchar cada um:
LHS (Left-Hand Side - Lado Esquerdo)
 * O que é: O LHS é a combinação de teclas que você pressiona no teclado. É o "input" que o Neovim está esperando para reconhecer um atalho.
 * Sinônimos: O gatilho, o atalho, a combinação de teclas de entrada.
 * Exemplos:
   * jj
   * <leader>w
   * <C-s>
   * gd
   * <F1>
   * <S-Left>
 * Filosofia: O LHS deve ser memorável, ergonômico e não conflitante.
   * Memorável: Fácil de lembrar o que o atalho faz.
   * Ergonômico: Confortável de digitar, preferencialmente sem esticar demais os dedos ou usar combinações estranhas repetidamente.
   * Não Conflitante: Não deve entrar em conflito com mapeamentos padrão importantes do Vim/Neovim (a menos que você queira sobrescrevê-los intencionalmente). O uso da leader key ajuda muito a criar namespaces de mapeamentos e evitar conflitos.
 * No código (vim.keymap.set(modes, lhs, rhs, opts)): É o segundo argumento lhs.
RHS (Right-Hand Side - Lado Direito)
 * O que é: O RHS é a ação ou sequência de comandos que é executada quando o LHS é pressionado. É o "output" ou o "resultado" do atalho.
 * Sinônimos: A ação, o comando, a função, a sequência de teclas de saída.
 * Exemplos:
   * <Esc> (para sair do modo de inserção)
   * <cmd>w<CR> (para salvar um arquivo)
   * yyP (para duplicar uma linha)
   * <cmd>lua vim.lsp.buf.definition()<CR> (para ir para a definição LSP)
   * b (para mover o cursor para trás uma palavra)
   * <C-o>b (para mover o cursor para trás uma palavra no modo de inserção sem sair dele)
 * Filosofia: O RHS deve ser preciso, eficiente e claro.
   * Preciso: Deve executar exatamente a ação desejada, sem efeitos colaterais indesejados.
   * Eficiente: Se a ação pode ser executada com um comando Vimscript, uma função Lua nativa, ou uma sequência de teclas, geralmente as opções de comando/função são preferíveis por serem mais robustas e menos sujeitas a problemas de remapeamento.
   * Claro: Embora não precise ser humano-legível (para isso temos a desc option), ele deve ser logicamente compreensível para o Neovim.
 * No código (vim.keymap.set(modes, lhs, rhs, opts)): É o terceiro argumento rhs.
A Relação entre LHS e RHS: O Coração dos Mapeamentos
Em sua essência, um mapeamento é uma regra de "se isso, então aquilo":
Se eu pressionar (LHS), então o Neovim deve executar (RHS).
Exemplo Completo:
vim.keymap.set("n", "<leader>w", "<cmd>w<CR>", { desc = "Salvar arquivo" })

 * modes: "n" (Modo Normal) - Contexto onde a regra se aplica.
 * lhs: <leader>w (A combinação de teclas que eu pressiono)
 * rhs: <cmd>w<CR> (O que o Neovim vai executar quando eu pressionar <leader>w)
 * opts: { desc = "Salvar arquivo" } (Metadados sobre o mapeamento)
Por que essa distinção é importante?
 * Clareza e Estrutura: Divide a tarefa de definir um atalho em duas partes lógicas, tornando o processo mais organizado.
 * Manutenção: Facilita a depuração. Se um mapeamento não funciona, você pode verificar se o LHS está sendo reconhecido e se o RHS está executando a ação correta.
 * Flexibilidade: Permite que você mude a ação de um atalho (mudando o RHS) sem mudar o que você pressiona (LHS), ou mude o atalho (LHS) para uma ação (RHS) que já existe.
 * Compreensão Modal: A relação LHS-RHS muda ligeiramente de contexto para contexto (modo para modo), como discutimos anteriormente. O mesmo LHS pode ter um RHS diferente em modos diferentes, e vice-versa.
Em resumo, a filosofia LHS e RHS é a base para a criação e compreensão de todos os seus atalhos personalizados no Neovim, permitindo que você construa um editor que se adapta perfeitamente ao seu fluxo de trabalho.


# MODERNIZACAO : 2025 : VIM para NEOVIM

> Gerenciadores_Plugins: [
  * Ano_2025: Nome: Lazyvim [Link: ](https://www.lazyvim.org/)
]

> Sistema: 
  By_Lazyvim : [
- Arquivos_Editaveus_Sustematicos: [ keymaps, options, plugins], já auto-reconhecidos no init.lua não re-importe.

]

> CUSTOM RZJ

 Padroes de Fabrica
- No diretorio <custom> lua/ vai todas as mudanças do dev.
- por padrao vem vazios em <config/> : [ keymaps, autocmds, options ] (por isso configuro-os em <custom/>)
 
> LINKS
 Temas: [
  * Para_lazyvim: [catppuccin](https://github.com/catppuccin/nvim)
 ]

> TODO
Falta_MyNvim : [
- selecionar linhas. om cursor pra se movimentar igual entre as linhas -- igual feito com ctr+shift+seta no vscode
- atalho selecionar grupo, shift+seta
- atalho mover linhas , shift+seta
- atalho comentar, <leader>cc
- atalho toggler abrir e fechar terminal, leader+t
- atalho fechar kill matar terminal, F12
]





