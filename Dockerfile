FROM ruby:3.1.2

ENV app_path /opt/jenkins/
WORKDIR ${app_path}

COPY Gemfile* ${app_path}

RUN bundle config --global frozen 0

RUN gem install bundler -v 2.4.19

RUN bundle install

RUN gem update --system

COPY . ${app_path}

ENTRYPOINT ["bundle", "exec", "cucumber -p ${BROWSER} -p ${TAG}  --format json -o /opt/jenkins/cucumber.json"]