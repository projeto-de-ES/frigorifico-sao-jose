Given ('Estou na pagina de cadastro de usuario') do
  visit 'usuarios/new'
end
When ("Eu preencho o campo nome {string} login {string} senha {string}") do |string,string2,string3|
  fill_in 'usuario[nome]', :with => string
  fill_in 'usuario[login]', :with => string2
  fill_in 'usuario[senha]', :with => string3
end

And ('Eu clico para cadastrar usuario') do
  click_button 'Salvar'
end

Then ("Eu vejo a mensagem de {string}") do |string|
  expect(page).to have_content(string)
end

Then ('Eu vejo a mensagem de erro') do
  assert_selector('div#error_explanation')
end

