FROM ruby:2.4.1-alpine
MAINTAINER Josh Rendek <josh@joshrendek.com>
ENV RAILS_LOG_TO_STDOUT=true
ENV RAILS_ENV=production
RUN apk update && \
    apk add curl ca-certificates alpine-sdk nodejs libpq postgresql-dev && \
    mkdir -p /etc/ssl/certs/ && \
    update-ca-certificates && \
    rm -rf /var/cache/apk/*
ADD Gemfile /tmp/Gemfile
ADD Gemfile.lock /tmp/Gemfile.lock
WORKDIR /tmp
RUN bundle install --without development test
RUN npm install -g bower
RUN npm install -g yarn
COPY . /app
WORKDIR /app
ADD entrypoint.sh /entrypoint.sh
RUN bundle install --without development test
RUN bundle exec rake assets:clean
RUN cd node_modules && bower install editor.md
RUN bundle exec rake assets:precompile
EXPOSE 3000
WORKDIR /
CMD ["./entrypoint.sh"]
