# vim: foldmethod=marker foldlevel=0 foldenable
FROM alpine:latest
MAINTAINER Łukasz Niemier <lukasz@niemier.pl>

ENV RAILS_ENV production

# Base {{{
RUN apk update && apk upgrade
RUN apk add \
  tzdata \
  build-base \
  linux-headers \
  ruby-dev=2.2.2-r0 \
  ruby-io-console \
  libxml2-dev \
  libxslt-dev \
  nodejs \
  postgresql-dev

RUN rm -rf /var/cache/apk/*

RUN gem install bundler --no-doc
# }}}

RUN mkdir /usr/app
WORKDIR /usr/app

COPY Gemfile /usr/app
COPY Gemfile.lock /usr/app
RUN bundle config build.nokogiri --use-system-libraries
RUN bundle install --deployment --without="doc development test"

EXPOSE 5000

COPY . /usr/app

RUN ./bin/rake assets:precompile

CMD ["bundle", "exec", "unicorn", "-c", "config/unicorn.rb"]
