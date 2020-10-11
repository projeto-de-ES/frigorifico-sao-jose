Feature: cadastrar usuario
  As an,usuario nao logado no sistema,
  I want to cadastrar e editar o meu perfil
  so that fique salva no sistema e eu possa logar e acessar as informacoes

  Scenario: cadastrar usuario
    Given Estou na pagina de cadastro de usuario
    When Eu preencho o campo nome 'Josefa' login 'josefa1' senha 'josefa123'
    And Eu clico para cadastrar usuario
    Then Eu vejo a mensagem de 'Usuário criado com sucesso.'

  Scenario: cadastrar usuario invalido devido a falta de caracteres minimos do campo Login
    Given Estou na pagina de cadastro de usuario
    When Eu preencho o campo nome 'Josefa' login 'jose' senha 'josefa123'
    And Eu clico para cadastrar usuario
    Then Eu vejo a mensagem de erro

  Scenario: cadastrar usuario invalido devido o campo obrigatorio Login nao preenchido
    Given Estou na pagina de cadastro de usuario
    When Eu preencho o campo nome 'Josefa' login ' ' senha 'josefa123'
    And Eu clico para cadastrar usuario
    Then Eu vejo a mensagem de erro

  Scenario: cadastrar usuario invalido devido a falta de caracteres minimos do campo Nome
    Given Estou na pagina de cadastro de usuario
    When Eu preencho o campo nome 'Jos' login 'josefa1' senha 'josefa123'
    And Eu clico para cadastrar usuario
    Then Eu vejo a mensagem de erro

  Scenario: cadastrar usuario invalido devido a falta de campos obrigatorios nao preenchidos
    Given Estou na pagina de cadastro de usuario
    When Eu preencho o campo nome ' ' login ' ' senha 'josefa123'
    And Eu clico para cadastrar usuario
    Then Eu vejo a mensagem de erro