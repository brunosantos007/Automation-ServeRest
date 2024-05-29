FROM ruby:3.1.2

# Definir um usuário Docker
RUN groupadd -r -g 1000 appuser && \
useradd -r -m -u 1000 -g appuser appuser

ENV app_path /opt/jenkins/
WORKDIR ${app_path}

COPY Gemfile* ${app_path}

RUN gem install bundler -v 2.4.19

RUN bundle install

COPY . ${app_path}

RUN chown -R appuser:appuser ${app_path} && \
chmod +w ${app_path}/Gemfile.lock

USER appuser

ENTRYPOINT ["bundle", "exec", "cucumber -p ${BROWSER} -p ${TAG}  --format json -o /opt/jenkins/cucumber.json"]