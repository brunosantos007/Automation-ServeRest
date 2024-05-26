module Pages
    class TelaLogin < SitePrism::Page
        set_url "/login"

        element :input_email, "input[name='email']"
        element :input_senha, "input[name='password']"
        element :btn_login, "button[class='btn btn-primary']"
        
        def login_adm(email,senha)
            input_email.click
            input_email.set email
            input_senha.click
            input_senha.set senha
            btn_login.click
        end

        def login_default(email,senha)
            input_email.click
            input_email.set email
            input_senha.click
            input_senha.set senha
            btn_login.click
        end

    end
end

# bundle exec cucumber -p default -t@logado_user
# bundle exec cucumber -p default -t@error_login
# bundle exec cucumber -p default -t@search_product
# bundle exec cucumber -p default -t@add_product_list
# bundle exec cucumber -p default -t@new_user
# bundle exec cucumber -p default -t@new_product