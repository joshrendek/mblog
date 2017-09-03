#!/bin/sh
cd /app
export SECRET_KEY_BASE=$(bundle exec rails secret)
bundle exec rails s -b 0.0.0.0 -p 3000
