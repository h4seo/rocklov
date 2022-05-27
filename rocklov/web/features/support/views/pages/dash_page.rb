class DashPage
  include Capybara::DSL

  def on_dash?
    return page.has_css?(".dashboard")
  end

  def goto_equipo
    click_button "Criar anúncio"
  end

  def equipo_list
    return find(".equipo-list")
  end

  def has_no_equipo?(nome)
    return page.has_no_css?(".equipo-list li", text: nome)
  end

  def request_removal(nome)
    equipo = find(".equipo-list li", text: nome)
    equipo.find(".delete-icon").click
  end

  def confirm_removal
    click_on "Sim"
  end

  def cancel_removal
    click_on "Não"
  end

  def order
    return find(".notifications p")
  end

  def order_actions(name)
    return page.has_css?(".notifications button", text: name)
  end
end
