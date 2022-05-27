class LoginPage
  include Capybara::DSL

  def open
    visit "/"
  end

  def with(email, senha)
    find("input[placeholder='Seu email']").set email
    find("input[placeholder='Sua senha secreta']").set senha
    click_on "Entrar"
  end
end

