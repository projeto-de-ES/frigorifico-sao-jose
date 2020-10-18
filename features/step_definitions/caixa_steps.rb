Given ("Eu encontro-me logado no sistema") do
    visit "usuarios/new"
    fill_in "usuario[nome]", :with => "Victor"
    fill_in "usuario[login]", :with => "victor@gmail.com"
    fill_in "usuario[senha]", :with => "12345678"
    click_button "Salvar"
    fill_in "login", :with => "victor@gmail.com"
    fill_in "senha", :with => "12345678"
    click_button "entrar"
end

And ("Clico em abrir caixa") do
    click_link "abrir-caixa"
end

When ("Preencho o valor inicial com {string}") do |valor|
    fill_in "caixa_valor_inicial",  :with => valor
end

And ("Clico no botao que abre o caixa") do
    click_button "btn-abrir"
end

Then ("Eu vejo a mensagem {string}") do |mensagem|
    expect(page).to have_content(mensagem)
end

And ("Eu abro o caixa com {string} de valor inicial") do |valor|
    step ("Clico em abrir caixa")
    fill_in "caixa_valor_inicial",  :with => valor
    step ("Clico no botao que abre o caixa")
    step ("Eu vejo a mensagem 'Caixa aberto com sucesso.'")
end

And ("Clico em fechar caixa") do
    click_link "fechar-caixa"
end

When ("Eu vejo o valor inicial {string} que coloquei ao abrir, o valor total {string} e o valor arrecado {string}") do |valor_inicial, valor_total, valor_arrecadado|
    expect(page).to have_content(valor_inicial) and expect(page).to have_content(valor_total) and expect(page).to have_content(valor_arrecadado)
end

And ("Clico no botao que fecha o caixa") do
    click_button "btn-fechar"
end

And ("Clico em vendas") do
    click_link "vendas"
end