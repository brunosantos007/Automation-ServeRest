#language: pt

Funcionalidade: Logar
    Como usuário do ServeRest
    Quero realizar um login
    Para verificar o funcionamento

Contexto: Estar na página de login
    Dado que esteja na página de login

# @logado_user
# Cenário: Usuário existente
#     Quando inserir os dados válidos <email> e <senha>
#     Então o usuário deverá ser logado

#     Exemplos:
#     | email              | senha          |
#     | "email_valido"     | "senha_valida" |                             
@e2e
@error_login
Cenário: Usuário inexistente
    Quando inserir os dados inválidos <email> e <senha>
    Então o usuário deverá receber uma <mensagem>

    Exemplos:
    | email              | senha            | mensagem                            |
    | "email_vazio"      | "senha_vazia"    | "Email é obrigatório"               |
    | "email_valido"     | "senha_vazia"    | "Password não pode ficar em branco" |
    | "email_invalido"   | "senha_valida"   | "Email deve ser um email válido"    |
    | "email_invalido2"  | "senha_invalida" | "Email e/ou senha inválidos"        |