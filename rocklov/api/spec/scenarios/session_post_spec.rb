

describe "POST /sessions" do
  context "login com sucesso" do
    before(:all) do #:all é para todos os its com o mesmo contexto
      payload = { email: "hector@gmail.com", password: "123456" }
      @result = Sessions.new.login(payload)
    end

    it "valida status conde" do
      expect(@result.code).to eql 200
    end

    it "valida id do usuário" do
      expect(@result.parsed_response["_id"].length).to eql 24
    end
  end

  #   exemples = [

  #     {
  #       title: "senha invalida",
  #       payload: { email: "thiago@gmail.com", password: "ajax123" },
  #       code: 401,
  #       error: "Unauthorized",

  #     },

  #     {
  #       title: "usuario inexistente",
  #       payload: { email: "aquele@gmail.com", password: "123456" },
  #       code: 401,
  #       error: "Unauthorized",

  #     },

  #     {
  #       title: "email em branco",
  #       payload: { email: "", password: "123456" },
  #       code: 412,
  #       error: "required email",

  #     },

  #     {
  #       title: "sem email",
  #       payload: { password: "123456" },
  #       code: 412,
  #       error: "required email",

  #     },

  #     {
  #       title: "senha em branco",
  #       payload: { email: "thiago@gmail.com", password: "" },
  #       code: 412,
  #       error: "required password",

  #     },

  #     {
  #       title: "sem senha",
  #       payload: { email: "thiago@gmail.com" },
  #       code: 412,
  #       error: "required password",

  #     },
  #   ]

  exemples = Helpers::get_fixtures("login")

  exemples.each do |e|
    context "#{e[:title]}" do
      before(:all) do #:all é para todos os its com o mesmo contexto
        @result = Sessions.new.login(e[:payload])
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
