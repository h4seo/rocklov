#language: pt

Funcionalidade: Cadastro

    Sendo um músico que possui equipamentos musicais
    Quero fazer o meu cadastro no RockLov
    Para que eu possa disponibilizá-los para locação
    @tent
    Esquema do Cenario: Tentativas

        Dado que acesso a página de cadastro
        Quando submeto o seguinte formulário de cadastro:
            | nome      | email      | senha      |
            | <nome_in> | <email_in> | <senha_in> |
        Então vejo a mensagem de alerta: "<mensagem_out>"

        Exemplos:
            | nome_in         | email_in         | senha_in | mensagem_out                     |
            |                 | thiago@gmail.com | 123456   | Oops. Informe seu nome completo! |
            | Thiago Ferreira |                  | 123456   | Oops. Informe um email válido!   |
            | Thiago Ferreira | thiago$gmail.com | 123456   | Oops. Informe um email válido!   |
            | Thiago Ferreira | thiago@gmail.com |          | Oops. Informe sua senha secreta! |

    @teste
    Cenario: Fazer cadastro

        Dado que acesso a página de cadastro
        Quando submeto o seguinte formulário de cadastro:
            | nome            | email            | senha  |
            | Thiago Ferreira | thiago@gmail.com | 123456 |
        Então sou redirecionado para o Dashboard.