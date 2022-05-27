class SignupPage
  include Capybara::DSL

  def open
    visit "/signup"
  end

  def create(user)
    find("#fullName").set user[:nome]
    find("#email").set user[:email] #Faker::Internet.free_email #email dinâmico
    find("#password").set user[:senha]

    click_on "Cadastrar"
  end
end
