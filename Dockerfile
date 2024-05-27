FROM ruby:2.7

# MAINTAINER Felipe Rodrigues <felipe_rodriguesx@hotmail.com>

ENV app_path /opt/jenkins/
WORKDIR ${app_path}

COPY Gemfile* ${app_path}

RUN gem install bundler -v 2.3.26

RUN bundle install

COPY . ${app_path}

ENTRYPOINT ["bundle", "exec", "cucumber -p ${BROWSER} -p ${TAG}  --format json -o /opt/jenkins/cucumber.json"]