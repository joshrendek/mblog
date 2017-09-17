# README

[![Build Status](https://travis-ci.org/joshrendek/mblog.svg?branch=master)](https://travis-ci.org/joshrendek/mblog)
[![Code Climate](https://codeclimate.com/github/joshrendek/mblog/badges/gpa.svg)](https://codeclimate.com/github/joshrendek/mblog)

# First Time Installation

``` shell
apt-get update
curl https://get.docker.com/ | sudo bash
echo $(base64 </dev/urandom | tr -dc 'a-zA-Z0-9' | head -c20) > ~/.mblog_pgpass
export PGPASS=$(cat ~/.mblog_pgpass)
docker pull postgres:9.6
docker pull joshrendek/mblog
docker stop mblog
docker rm mblog
docker run --name mblog -v /mblog:/mblog -d -p 80:80 --link mblog-postgres:postgres -e DATABASE_URL="postgres://postgres:$PGPASS@postgres/mblog?sslmode=disable" joshrendek/mblog
```

# Quick Upgrade

``` shell
export PGPASS=$(cat ~/.mblog_pgpass)
docker pull joshrendek/mblog
docker stop mblog
docker rm mblog
docker run --name mblog -v /mblog:/mblog -d -p 80:80 --link mblog-postgres:postgres -e DATABASE_URL="postgres://postgres:$PGPASS@postgres/mblog?sslmode=disable" joshrendek/mblog
```

# Importing Jekyll / Markdown

``` shell
scp -r path_to_blog/_posts/ root@yourhost:~/
docker rm mblog-import
docker run -it --name mblog-import -v ~/_posts:/posts -v /mblog:/mblog --link mblog-postgres:postgres -e DATABASE_URL="postgres://postgres:$PGPASS@postgres/mblog?sslmode=disable" joshrendek/mblog '/app/import.sh'
```

# Administration

## Backing Up DB

``` shell
docker exec -t mblog-postgres pg_dumpall -c -U postgres > dump_`date +%d-%m-%Y"_"%H_%M_%S`.sql
```

## Restoring DB

``` shell
cat dump.sql | docker exec -i mblog-postgres psql -U postgres

```

## Backing up Attachments/Uploads

``` shell
tar czvf mblog.tar.gz /mblog
```

## Restoring Attachments/Uploads

``` shell
tar xzvf mblog.tar.gz
mv mblog /
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
