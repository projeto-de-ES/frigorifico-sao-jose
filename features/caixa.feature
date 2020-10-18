Feature: Abrir e fechar caixa
    As a Usuario do sistema
    I want to abrir e fechar o caixa
    So that Eu não precise somar manualmente

    Scenario: Abrir o caixa
        Given Eu encontro-me logado no sistema
        And Clico em abrir caixa
        When Preencho o valor inicial com '200'
        And Clico no botao que abre o caixa
        Then Eu vejo a mensagem 'Caixa aberto com sucesso.'

    Scenario: Fechar o caixa
        Given Eu encontro-me logado no sistema
        And Eu abro o caixa com '100' de valor inicial
        And Clico em fechar caixa
        When Eu vejo o valor inicial '100.0' que coloquei ao abrir, o valor total '100.0' e o valor arrecado '0.0'
        And Clico no botao que fecha o caixa
        Then Eu vejo a mensagem 'Caixa fechado com sucesso.'

    Scenario: Abrir o caixa com o caixa ja aberto
        Given Eu encontro-me logado no sistema
        And Eu abro o caixa com '100' de valor inicial
        And Clico em abrir caixa
        Then Eu vejo a mensagem 'Já existe um caixa aberto.'
    
    Scenario: Fechar o caixa com nenhum caixa ja aberto
        Given Eu encontro-me logado no sistema
        And Clico em fechar caixa
        Then Eu vejo a mensagem 'Não existe nenhum caixa aberto.'

    Scenario: Realizar uma venda com nenhum caixa ja aberto
        Given Eu encontro-me logado no sistema
        And Clico em vendas
        Then Eu vejo a mensagem 'Caixa fechado, para efetuar uma venda abra o caixa.'