#language: pt

Funcionalidade: Remover Anúncio

    Sendo eu um anúnciante que possui um equipamento indesejado
    Quero poder remover esse anúncio
    Para que eu possa manter meu dashboard atualizado


    Contexto: Login
        * Login com "marcinha@gmail.com" e "123456"


    
    Cenario: Remover um anúncio


        Dado que eu tenho um anúncio indesejado:
            | img       | telecaster.jpg |
            | nome      | Telecaster     |
            | categoria | Cordas         |
            | preco     | 75             |
        Quando eu solicito a exclusão desse item
        E confirmo a exclusão
        Então não devo ver mais o ítem na dashboard



@007
    Cenario: Desistir da exclusão

    
        Dado que eu tenho um anúncio indesejado:
            | img       | conga.jpg |
            | nome      | Conga     |
            | categoria | Outros         |
            | preco     | 100             |
        Quando eu solicito a exclusão desse item
        Mas não confirmo a solicitação
        Então o item deve permanecer no Dashboard