# README

[![Build Status](https://travis-ci.org/joshrendek/mblog.svg?branch=master)](https://travis-ci.org/joshrendek/mblog)
[![Code Climate](https://codeclimate.com/github/joshrendek/mblog/badges/gpa.svg)](https://codeclimate.com/github/joshrendek/mblog)

# Administration

## Backing up

``` shell
docker exec -t mblog-postgres pg_dumpall -c -U postgres > dump_`date +%d-%m-%Y"_"%H_%M_%S`.sql
```

## Restoring

``` shell
cat dump.sql | docker exec -i mblog-postgres psql -U postgres

```

# Demo (Vagrant)

``` shell
vagrant up
vagrant ssh
sudo su
export PGPASS=$(base64 </dev/urandom | tr -dc 'a-zA-Z0-9' | head -c20)
docker run --name mblog-postgres -e POSTGRES_PASSWORD=$PGPASS -e POSTGRES_DB=mblog -d postgres
docker run --name mblog -d -p 80:80 --link mblog-postgres:postgres -e DATABASE_URL="postgres://postgres:$PGPASS@postgres/mblog?sslmode=disable" joshrendek/mblog
```

# Demo locally (osx)

``` shell
export PGPASS=$(base64 </dev/urandom | tr -dc 'a-zA-Z0-9' | head -c20)
docker run --name mblog-postgres -e POSTGRES_PASSWORD=$PGPASS -e POSTGRES_DB=mblog -d postgres
docker run -it -u root -p 8080:80 --link mblog-postgres:postgres -e DATABASE_URL="postgres://postgres:$PGPASS@postgres/mblog?sslmode=disable"  mblog sh
```
