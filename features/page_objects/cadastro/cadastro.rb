module Pages
    class TelaCadastro < SitePrism::Page
       set_url "/cadastrarusuarios"
 
       element :input_nome, "input[name='nome']"
       element :input_email, "input[name='email']"
       element :input_senha, "input[name='password']"
       element :check_adm, "div[class='form-check']"
       element :btn_cadastrar, "button[type='submit']"
 
       def cadastrar_adm(nome,email,senha)
          input_nome.click
          input_nome.set nome
          input_email.click
          input_email.set email
          input_senha.click
          input_senha.set senha
          check_adm.click
          btn_cadastrar.click
       end
 
       def cadastro_default(nome,email,senha)
          input_nome.click
          input_nome.set nome
          input_email.click
          input_email.set email
          input_senha.click
          input_senha.set senha
          btn_cadastrar.click
 
       end
 
    end
 end
 
 # bundle exec cucumber -p default -t@cadastro_sucess
 # bundle exec cucumber -p default -t@cadastro_error
 # bundle exec cucumber -p default -t@cadastro_default