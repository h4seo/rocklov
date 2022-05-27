module Actions
  def login(email, senha)
    find("input[placeholder='Seu email']").set email
    find("input[placeholder='Sua senha secreta']").set senha
    click_on "Entrar"
  end

  def login_inv(email, senha)
    find("input[placeholder='Seu email']").set user[:email]
    find("input[placeholder='Sua senha secreta']").set user[:senha]
    click_botton "Entrar"
  end
end
