Dado("que acesso a página princial") do
  visit "/"
end

Quando("submeto minhas credencias incorretas") do |table|
  user = table.hashes.first

  find("input[placeholder='Seu email']").set user[:email]
  find("input[placeholder='Sua senha secreta']").set user[:senha]
  click_on "Entrar"
end

Dado("que acesso a página principal") do
  @login_page.open
end

Quando("submeto minhas credenciais com {string} e {string}") do |email, senha|
  @login_page.with(email, senha)
end
