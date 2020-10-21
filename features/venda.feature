Feature: Realizar e atualizar venda de produtos
  As a Usuario do sistema
  I want to realizar e atualizar uma venda
  So that Eu nao tenha que fazer manualmente

  Scenario: Nova venda
    Given Eu estou logado
    And Eu abri o caixa com o valor inicial de '20.00' reais
    And Eu clico em vendas
    And Eu clico em adicionar produto
    When Eu preencho o produto com o nome 'coxao mole' e quantidade com '13.5'
    And Eu clico em adicionar
    And Eu clico em finalizar venda
    Then Eu vejo uma mensagem 'Venda finalizada com sucesso.'

  Scenario: Cadastrar venda com caixa com valor nao preenchido
    Given Eu estou logado
    When Eu abri o caixa com o valor inicial de '' reais
    Then Eu vejo mensagem de erro

  Scenario: Nova venda com quantidade de produto excedida do estoque
    Given Eu estou logado
    And Eu abri o caixa com o valor inicial de '20.00' reais
    And Eu clico em vendas
    And Eu clico em adicionar produto
    When Eu preencho o produto com o nome 'coxao mole' e quantidade com '25'
    And Eu clico em adicionar
    Then Eu vejo uma mensagem 'Quantidade de produto excede a quantidade em estoque.'

  Scenario: Realizar venda com quantidade do produto nao preenchido
    Given Eu estou logado
    And Eu abri o caixa com o valor inicial de '20.00' reais
    And Eu clico em vendas
    And Eu clico em adicionar produto
    When Eu preencho o produto com o nome 'coxao mole' e quantidade com ' '
    And Eu clico em adicionar
    Then Eu vejo uma mensagem 'Campo quantidade de produtos deve ser preenchido.'

  Scenario: Cancelar venda
    Given Eu estou logado
    And Eu abri o caixa com o valor inicial de '20.00' reais
    And Eu clico em vendas
    And Eu clico em adicionar produto
    When Eu preencho o produto com o nome 'coxao mole' e quantidade com '15'
    And Eu clico em adicionar
    And Eu clico em cancelar venda
    Then Eu vejo uma mensagem 'Venda cancelada com sucesso.'
