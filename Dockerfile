FROM ruby:3.1.2

MAINTAINER Bruno Santos <brunogsantoss@outlook.com>

# Instalar dependências adicionais, se necessário
RUN apt-get update -qq && apt-get install -y build-essential libpq-dev nodejs

# Criar um usuário e grupo com IDs específicos
RUN groupadd -r -g 1000 appuser && \
    useradd -r -m -u 1000 -g appuser appuser

# Configurar o diretório de trabalho
WORKDIR /opt/jenkins

# Copiar Gemfile e Gemfile.lock
COPY Gemfile Gemfile.lock ./

# Instalar Bundler
RUN gem install bundler -v 2.4.19

# Ajustar permissões para o usuário 'appuser' antes de instalar as gems
RUN chown -R appuser:appuser /opt/jenkins && \
    chmod +w /opt/jenkins/Gemfile.lock

# Trocar para o usuário 'appuser'
USER appuser

# Instalar as gems
RUN bundle install

# Copiar o restante dos arquivos após a instalação das gems
COPY . .

# Ajustar permissões para o usuário 'appuser' após copiar todos os arquivos
USER root
RUN chown -R appuser:appuser /opt/jenkins

USER appuser

# Configurar o entrypoint para executar o Cucumber
ENTRYPOINT ["sh", "-c", "bundle exec cucumber -p ${BROWSER} -p ${TAG} --format json -o /opt/jenkins/cucumber.json"]
