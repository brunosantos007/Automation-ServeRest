FROM ruby:3.1.2

MAINTAINER Felipe Rodrigues <felipe_rodriguesx@hotmail.com>

ENV app_path /opt/jenkins/
WORKDIR ${app_path}

COPY Gemfile* ${app_path}

RUN gem install bundler -v 2.4.19

RUN bundle install

COPY . ${app_path}

ENTRYPOINT ["bundle", "exec", "cucumber -p ${BROWSER} -p ${TAG}  --format json -o /opt/jenkins/cucumber.json"]