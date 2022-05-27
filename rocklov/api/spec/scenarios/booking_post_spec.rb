describe "POST /equipos/{equipo_id}/bookings" do
  before(:all) do
    payload = { email: "gato@gmail.com", password: "123456" }
    result = Sessions.new.login(payload)
    @gato_id = result.parsed_response["_id"]
  end

  context "solicitar locacao" do
    before(:all) do

      #dado que o "Casa" tem uma "Fender Strato" para locação

      result = Sessions.new.login({ email: "casa@gmail.com", password: "123456" })
      @casa_id = result.parsed_response["_id"]

      fender = {
        thumbnail: Helpers::get_thumb("fender-sb.jpg"),
        name: "Fender Strato",
        category: "Cordas",
        price: 150,
      }
      MongoDB.new.remove_equip(fender[:name], @casa_id)

      result = Equipos.new.create(fender, @casa_id)
      fender_id = result.parsed_response["_id"]

      #quando solicito a locação da fender de Casa

      @result = Equipos.new.booking(fender_id, @gato_id)
    end

    it "deve retornar 200" do
      expect(@result.code).to eql 200
    end
  end
end
