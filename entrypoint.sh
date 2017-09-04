#!/bin/sh
cd /app
export SECRET_KEY_BASE=$(bundle exec rails secret)
SKIP_SETUP=true bundle exec rake db:migrate
# super weird workaround for editor.md asset loading
mkdir /app/bower_components/assets
ln -s /app/bower_components/editor.md /app/bower_components/assets/editor.md
/usr/bin/supervisord -c supervisord.conf
