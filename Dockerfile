FROM ruby:2.5.1
MAINTAINER johnson <johnson@5xruby.tw>
RUN apt-get update && apt-get install -y build-essential libpq-dev nodejs vim postgis imagemagick
RUN mkdir /app
WORKDIR /app
COPY Gemfile /app/Gemfile
COPY Gemfile.lock /app/Gemfile.lock
ENV RAILS_ENV production
RUN bundle install
COPY . /app
CMD rake db:migrate assets:precompile && puma -C config/puma.rb
