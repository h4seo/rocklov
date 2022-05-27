Dado("que acesso a página de cadastro") do
  @signup_page.open
end

Quando("submeto o seguinte formulário de cadastro:") do |table|
  user = table.hashes.first

  MongoDB.new.delorean(user[:email])

  @signup_page.create(user)
end