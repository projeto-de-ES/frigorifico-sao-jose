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

When('Eu preencho o nome com {string}, seleciono a categoria {string}, quantidade em estoque com {string} e preço com {string}') do |nome, categoria, qtd_estoque, preco|
  fill_in "produto[nome]", :with => nome
  select categoria, from: "produto[categoria]"
  fill_in "produto[qtd_estoque]", :with => qtd_estoque
  fill_in "produto[preco]", :with => preco
end

And ("Eu clico em salvar") do
  click_button "Salvar"
end

Then("Eu vejo uma mensagem {string}") do |mensagem|
  expect(page).to have_content(mensagem)
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

When('Eu clico na opcao de editar um produto com nome {string}') do |nome|
  click_link "e-#{nome}"
end


