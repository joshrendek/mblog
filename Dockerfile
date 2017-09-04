FROM ruby:2.4.1-alpine
MAINTAINER Josh Rendek <josh@joshrendek.com>
RUN adduser -D -h /app -s /bin/sh app
ENV RAILS_LOG_TO_STDOUT=true
ENV RAILS_ENV=production
ENV RAILS_SERVE_STATIC_FILES=true
RUN apk update && \
    apk add curl ca-certificates alpine-sdk nginx nodejs libpq postgresql-dev supervisor && \
    mkdir -p /etc/ssl/certs/ && \
    update-ca-certificates && \
    rm -rf /var/cache/apk/*
ADD Gemfile /tmp/Gemfile
ADD Gemfile.lock /tmp/Gemfile.lock
RUN npm install -g bower
RUN npm install -g yarn
WORKDIR /tmp
COPY nginx.conf /etc/nginx/nginx.conf
USER app
RUN bundle install --without development test
COPY . /app
WORKDIR /app
USER root
RUN chown -R app.app /app
RUN bundle exec rake assets:clean
USER app
ADD entrypoint.sh /entrypoint.sh
RUN bundle install --without development test
RUN bower install editor.md
WORKDIR /app
RUN bundle exec rake assets:precompile
EXPOSE 3000
WORKDIR /
USER root
CMD ["./entrypoint.sh"]
