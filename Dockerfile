FROM ruby:2.5

MAINTAINER Edward Chou

WORKDIR /app

ADD Gemfile /app/Gemfile
ADD Gemfile.lock /app/Gemfile.lock
RUN bundle install --jobs 8

ADD . /app

VOLUME ['output/']

CMD ["bin/run"]
