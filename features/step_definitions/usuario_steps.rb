Given ('Estou na pagina de cadastro de usuario') do
  visit 'usuarios/new'
end
When ("Eu preencho o campo nome {string} login {string} senha {string}") do |nome,login,senha|
  fill_in 'usuario[nome]', :with => nome
  fill_in 'usuario[login]', :with => login
  fill_in 'usuario[senha]', :with => senha
end

And ('Eu clico para cadastrar usuario') do
  click_button 'Salvar'
end

Then ("Eu vejo a mensagem de {string}") do |mensagem|
  expect(page).to have_content(mensagem)
end

Then ('Eu vejo a mensagem de erro') do
  assert_selector('div#error_explanation')
end

