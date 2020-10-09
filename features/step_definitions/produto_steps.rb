Given ('Eu estou logado') do
  visit "usuarios/new"
  fill_in "usuario[nome]", :with => "Victor"
  fill_in "usuario[login]", :with => "victor@gmail.com"
  fill_in "usuario[senha]", :with => "12345678"
  click_button "Salvar"
  fill_in "loginlogin", :with => "victor@gmail.com"
  fill_in "senhalogin", :with => "12345678"
  click_button "entrar"
end