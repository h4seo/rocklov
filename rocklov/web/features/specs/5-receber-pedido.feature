#language:pt


Funcionalidade: Receber pedido de locação
    Sendo um anúnciante que possi um equipamento cadastrado
    Desejo receber pedidos de locação
    Para que eu possa decidir se quero aprova-los ou rejeita-los
    @pedido
    Cenario: Receber pedido

        Dado que meu perfil de anunciante é "ca@gmail.com" e "123456"
            E que eu tenho o seguinte equipamento cadastrado:
            | img       | trompete.jpg |
            | nome      | Trompete     |
            | categoria | Outros       |
            | preco     | 200          |
            E acesso o meu dashboard
        Quando "ml@gmail.com" e "123456" solicita a locação desse equipamento
        Então devo ver a seguinte mensagem:
            """
            ml@gmail.com deseja alugar o equipamento: Trompete em: DATA_ATUAL
            """
            E devo ver os links: "ACEITAR" e "REJEITAR" no pedido