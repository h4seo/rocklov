#language: pt

Funcionalidade: Cadastro de Anúncios
    Sendo usuário cadastrado no Rocklov que possui equipamentos musicais
    Quero cadastrar meus equipamentos
    Para que eu possa disponibilizar para locação


    Contexto: Login
        * Login com "thiago@gmail.com" e "123456"


    @1
    Cenario: Novo equip
        Dado que acesso o formulario de cadastro de anúncios
            E que eu tenho o seguinte equip:
            | img       | fender-sb.jpg |
            | nome      | Fender        |
            | categoria | Cordas        |
            | preco     | 200           |
        Quando submeto o cadastro desse item
        Então devo ver esse item no meu Dashboard


    @2
    Esquema do Cenario: Tentativa de cadastro anúncios
        Dado que acesso o formulario de cadastro de anúncios
            E que eu tenho o seguinte equip:
            | img       | <img>       |
            | nome      | <nome>      |
            | categoria | <categoria> |
            | preco     | <preco>     |
        Quando submeto o cadastro desse item
        Então deve conter a mensagem de alerta: "<saida>"


        Exemplos:
            | img           | nome         | categoria | preco  | saida                                |
            |               | violão nylon | Cordas    | 120    | Adicione uma foto no seu anúncio!    |
            | clarinete.jpg |              | Outros    | 250    | Informe a descrição do anúncio!      |
            | clarinete.jpg | Clarinete    |           | 250    | Informe a categoria                  |
            | mic.jpg       | Microfone    | Outros    | aquele | O valor da diária deve ser numérico! |
            | mic.jpg       | Microfone    | Outros    | 100A   | O valor da diária deve ser numérico! |