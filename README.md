# README

[![Build Status](https://travis-ci.org/joshrendek/mblog.svg?branch=master)](https://travis-ci.org/joshrendek/mblog)
[![Code Climate](https://codeclimate.com/github/joshrendek/mblog/badges/gpa.svg)](https://codeclimate.com/github/joshrendek/mblog)

**mblog** is an opinionated blogging system that ensures a few things:

* Markdown editing
* Responsive layout
* Easy to read 2 column layout
* Simple code highlighting using Markdown backticks with line numbers
* Drag-and-drop image upload / easy picture uploads
* A way for users to show appreciation (heart buttons)
* Simple dashboard showing statistics and focus on editing/content
* Simple setup
* Ability to import from Jekyll/Hugo/etc

#### Table of Contents

* [Screenshots](#screenshots)
* [Installation](#first-time-installation)
* [Upgrading](#quick-upgrade)
* [Importing from Jekyll/others](#importing-jekyll--markdown)
* [Backing Up DB](#backing-up-db)
* [Restoring DB](#restoring-db)
* [Local Demo (Vagrant)](#demo-vagrant)

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
ssh root@yourhost
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
echo $(base64 </dev/urandom | tr -dc 'a-zA-Z0-9' | head -c20) > ~/.mblog_pgpass
export PGPASS=$(cat ~/.mblog_pgpass)
docker run --name mblog-postgres -e POSTGRES_PASSWORD=$PGPASS -e POSTGRES_DB=mblog -d postgres
docker run --name mblog -d -p 80:80 --link mblog-postgres:postgres -e DATABASE_URL="postgres://postgres:$PGPASS@postgres/mblog?sslmode=disable" joshrendek/mblog
```

# Demo locally (osx)

``` shell
echo $(base64 </dev/urandom | tr -dc 'a-zA-Z0-9' | head -c20) > ~/.mblog_pgpass
export PGPASS=$(cat ~/.mblog_pgpass)
docker run --name mblog-postgres -e POSTGRES_PASSWORD=$PGPASS -e POSTGRES_DB=mblog -d postgres
docker run -it -u root -p 8080:80 --link mblog-postgres:postgres -e DATABASE_URL="postgres://postgres:$PGPASS@postgres/mblog?sslmode=disable"  mblog sh
```

# Screenshots

#### Homepage
<img src="doc/homepage.png" width="256">

#### Archives
<img src="doc/archives.png" width="256">

#### Admin Login
<img src="doc/admin_login.png" width="256">

#### Admin Dashboard
<img src="doc/admin_dashboard.png" width="256">

#### Admin Menu Editor
<img src="doc/admin_menu_editor.png" width="256">

#### Admin Page Listing
<img src="doc/admin_page_list.png" width="256">

#### Admin Post/Page Editor
<img src="doc/admin_post_editor.png" width="256">

#### Admin Post Listing
<img src="doc/admin_posts_list.png" width="256">

#### Admin Settings
<img src="doc/admin_settings.png" width="256">

#### Admin Sidebar Editor
<img src="doc/admin_sidebar_editor.png" width="256">

#### Admin Sidebar Listing
<img src="doc/admin_sidebar.png" width="256">

#### Admin User Settings
<img src="doc/admin_user_settings.png" width="256">
