Given ("Eu estou logado") do
  visit "usuarios/new"
  fill_in "usuario[nome]", :with => "Victor"
  fill_in "usuario[login]", :with => "victor@gmail.com"
  fill_in "usuario[senha]", :with => "12345678"
  click_button "Salvar"
  fill_in "login", :with => "victor@gmail.com"
  fill_in "senha", :with => "12345678"
  click_button "entrar"
end

And ("Eu estou na pagina de Novo produto") do
  visit "produtos/new"
end

When('Eu preencho o nome com {string}, seleciono a categoria {string}, quantidade em estoque com {string} e preço com {string}') do |string, string2, string3, string4|
  fill_in "produto[nome]", :with => string
  select string2, from: "produto[categoria]"
  fill_in "produto[qtd_estoque]", :with => string3
  fill_in "produto[preco]", :with => string4
end

And ("Eu clico em salvar") do
  click_button "Salvar"
end

Then("Eu vejo uma mensagem {string}") do |string|
  expect(page).to have_content(string)
end

Then ("Eu vejo uma mensagem de erro") do
  assert_selector('div#error_explanation', text:"")
end

And ("Eu estou na pagina de produtos") do
  visit "produtos/new"
  fill_in "produto[nome]", :with => "Lombo"
  select "Suino", from: "produto[categoria]"
  fill_in "produto[qtd_estoque]", :with => "10.0"
  fill_in "produto[preco]", :with => "22.6"
  click_button "Salvar"
  visit "/produtos"
end

When('Eu clico na opcao de editar um produto com nome {string}') do |string|
  click_link "e-#{string}"
end


