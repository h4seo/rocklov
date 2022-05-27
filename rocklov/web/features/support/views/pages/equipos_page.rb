class EquiposPage
  include Capybara::DSL

  def create(equipo)
    #expect(page).to have_css "#equipoForm"
    #checkpont com timeout
    page.has_css?("#equipoForm")

    upload(equipo[:img]) if equipo[:img].length > 0

    find("input[id='name']").set equipo[:nome]
    #regra de verificação quando X for preenchido
    #X = opção
    select_cat(equipo[:categoria]) if equipo[:categoria].length > 0
    find("input[placeholder^=Valor]").set equipo[:preco]

    click_on "Cadastrar"
  end

  def upload(nome_arquivo)
    anexo = Dir.pwd + "/features/support/fixtures/images/" + nome_arquivo

    find("#thumbnail input[type=file]", visible: false).set anexo
  end

  def select_cat(cat)
    find("#category").find("option", text: cat).select_option
  end
end
