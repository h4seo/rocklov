#language: pt

Funcionalidade: Login
    Sendo um usuário cadastrado
    Quero acessar o sistema RockLov
    Para que eu possa anúnciar meus equipamentos musicais


    @login
    Cenario: Login do usuário

        Dado que acesso a página principal
        Quando submeto minhas credenciais com "thiago1@gmail.com" e "123456"
        Então sou redirecionado para o Dashboard.

    @inv
    Esquema do Cenario: Tentativas Inválidas

        Dado que acesso a página princial
        Quando submeto minhas credencias incorretas
            | email       | senha       |
            | <email_inv> | <senha_inv> |
        Então vejo a mensagem de alerta: "<mensagem_sai>"

        Exemplos:
            | email_inv         | senha_inv | mensagem_sai                     |
            | thiago1@gmail.com | 456789    | Usuário e/ou senha inválidos.    |
            | thiago1@gmail.com |           | Oops. Informe sua senha secreta! |
            | thiago1#jg2.com   | 456789    | Oops. Informe um email válido!   |
            |                   | 123456    | Oops. Informe um email válido!   |

