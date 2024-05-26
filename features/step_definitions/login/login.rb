Dado('que esteja na página de login') do
    @login_page = Pages::TelaLogin.new 
    @login_page.load
end
  
Quando('inserir os dados válidos {string} e {string}') do |email, senha|
    @login_page.login_adm(BackEnd.get(email), BackEnd.get(senha))
end

Quando('inserir os dados inválidos {string} e {string}') do |email, senha|
    @login_page.login_adm(BackEnd.get(email), BackEnd.get(senha))
end

Então('o usuário deverá ser logado') do
    expect(@login_page).to have_current_path("https://front.serverest.dev/admin/home")
end
  
Então('o usuário deverá receber uma {string}') do |string|
    expect(@login_page).to have_content(string)
end