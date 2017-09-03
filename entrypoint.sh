#!/bin/sh
cd /app
export SECRET_KEY_BASE=$(bundle exec rails secret)
bundle exec rake db:migrate
bundle exec rails s -b 0.0.0.0 -p 3000
