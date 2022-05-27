Então("sou redirecionado para o Dashboard.") do
  expect(@dash_page.on_dash?).to be true
end

Então("vejo a mensagem de alerta: {string}") do |alerta|
  #alert = find(".alert-dark")
  #expect(alert.text).to eql alerta
  expect(@alert.dark).to eql alerta
end
