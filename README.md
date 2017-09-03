# README

[![Build Status](https://travis-ci.org/joshrendek/mblog.svg?branch=master)](https://travis-ci.org/joshrendek/mblog)
[![Code Climate](https://codeclimate.com/github/joshrendek/mblog/badges/gpa.svg)](https://codeclimate.com/github/joshrendek/mblog)

# Demo (locally)

``` shell
vagrant up
sudo su
export PGPASS=$(cat /dev/urandom | tr -dc 'a-zA-Z0-9' | fold -w 32 | head -n 1)
docker run --name mblog-postgres -e POSTGRES_PASSWORD=$PGPASS -e POSTGRES_DB=mblog -d postgres
docker run --name mblog -d -p 3000:3000 --link mblog-postgres:postgres -e DATABASE_URL="postgres://postgres:$PGPASS@postgres/mblog?sslmode=disable" joshrendek/mblog
```
