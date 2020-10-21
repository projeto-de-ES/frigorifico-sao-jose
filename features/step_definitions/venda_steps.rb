And ("Eu abri o caixa com o valor inicial de {string} reais") do |valor_inicial|
  visit "usuarios/1/caixa/abrir"
  fill_in "caixa[valor_inicial]", :with => valor_inicial
  click_button "Abrir"
end

And("Eu clico em vendas") do
  visit "/produtos/new"
  fill_in "produto[nome]", :with => "coxao mole"
  select "Bovino", from:'produto[categoria]'
  fill_in "produto[qtd_estoque]", :with => "20"
  fill_in "produto[preco]", :with => "15.00"
  click_button "Salvar"
  visit "vendas/new"
  click_button "salvar"
end

And ("Eu clico em adicionar produto") do
  click_link "addProduto"
end

When("Eu preencho o produto com o nome {string} e quantidade com {string}") do |nome,qtd_produtos|
  select nome, from:'produto_venda[produto_id]'
  fill_in "produto_venda[qtd_produtos]", :with => qtd_produtos
end
And("Eu clico em adicionar") do
  click_button "Adicionar"
end

And("Eu clico em finalizar venda") do
  click_link "finalizar"
end

Then ("Eu vejo mensagem de erro") do
  assert_selector('div#error_explanation', text:"")
end

And("Eu clico em cancelar venda") do
  click_link "cancelar"
end