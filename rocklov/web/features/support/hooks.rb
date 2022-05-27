Before do
  page.current_window.resize_to(1440, 900)
  @alert = Alert.new
  @login_page = LoginPage.new
  @signup_page = SignupPage.new
  @dash_page = DashPage.new
  @equipos_page = EquiposPage.new
end

After do
  shot = page.save_screenshot("logs/temp_shot.png")

  Allure.add_attachment(
    name: "Screenshot",
    type: Allure::ContentType::PNG,
    source: File.open(shot),

  )
end
