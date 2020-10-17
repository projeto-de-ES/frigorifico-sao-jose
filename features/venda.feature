Feature: Realizar e atualizar venda de produtos
  As a Usuario do sistema
  I want to realizar e atualizar uma venda
  So that Eu nao tenha que fazer manualmente

  Scenario: Nova venda
    Given Eu estou logado
    And Eu abri o caixa
    When Eu preencho o produto com o nome 'Coxao mole', quantidade com '13.5' e preço com '12.3'
    And Eu clico em salvar
    Then Eu vejo uma mensagem 'Produto criado com sucesso'

  Scenario: Novo produto invalido(campo nome vazio)
    Given Eu estou logado
    And Eu estou na pagina de Novo produto
    When Eu preencho o nome com '', seleciono a categoria 'Suino', quantidade em estoque com '13.5' e preço com '12.3'
    And Eu clico em salvar
    Then Eu vejo uma mensagem de erro

  Scenario: Novo produto invalido(campo preço com uma letra)
    Given Eu estou logado
    And Eu estou na pagina de Novo produto
    When Eu preencho o nome com 'bisteca', seleciono a categoria 'Bovino', quantidade em estoque com '13.5' e preço com 'g'
    And Eu clico em salvar
    Then Eu vejo uma mensagem de erro

  Scenario: Atualizar um produto(editando o preço)
    Given Eu estou logado
    And Eu estou na pagina de produtos
    When Eu clico na opcao de editar um produto com nome 'Lombo'
    And Eu preencho o nome com 'Lombo', seleciono a categoria 'Suino', quantidade em estoque com '10.0' e preço com '20.0'
    And Eu clico em salvar
    Then Eu vejo uma mensagem 'Produto editado com sucesso.'

  Scenario: Atualizar um produto invalido(campo nome vazio)
    Given Eu estou logado
    And Eu estou na pagina de produtos
    When Eu clico na opcao de editar um produto com nome 'Lombo'
    And Eu preencho o nome com '', seleciono a categoria 'Suino', quantidade em estoque com '10.0' e preço com '20.0'
    And Eu clico em salvar
    Then Eu vejo uma mensagem de erro