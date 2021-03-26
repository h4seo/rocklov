require_relative "routes/signup"
require_relative "libs/mongo"

describe "POST /signup" do
  context "novo usuario" do
    before(:all) do
      payload = { name: "Osmar", email: "osmar@gmail.com", password: "123456" }
      MongoDB.new.delorean(payload[:email])

      @result = Signup.new.create(payload)
    end

    it "valida status conde" do
      expect(@result.code).to eql 200
    end

    it "valida id do usuário" do
      expect(@result.parsed_response["_id"].length).to eql 24
    end
  end

  context "usuario ja existe" do
    before(:all) do
      #dado que que eu tenha um novo usuário
      payload = { name: "João", email: "joao@gmail.com", password: "123456" }
      MongoDB.new.delorean(payload[:email])
      # e o email ja foi cadastrado
      Signup.new.create(payload)
      #quando faço uma request para a rota
      @result = Signup.new.create(payload)
    end

    it "valida status conde 409" do
      #então devo ver 409
      expect(@result.code).to eql 409
    end
    it "deve retornar mensagem" do
      expect(@result.parsed_response["error"]).to eql "Email already exists :("
    end

    exemples = Helpers::get_fixtures("signup")

    exemples.each do |e|
      context "#{e[:title]}" do
        before(:all) do #:all é para todos os its com o mesmo contexto
          @result = Signup.new.create(e[:payload])
        end

        it "valida status conde #{e[:code]}" do
          expect(@result.code).to eql e[:code]
        end

        it "valida id do usuário" do
          expect(@result.parsed_response["error"]).to eql e[:error]
        end
      end
    end
  end
end
