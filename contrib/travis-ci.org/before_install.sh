#!/bin/bash

git fetch --unshallow

case "${DB}" in
  mysql)
    mysql -u root -e "CREATE USER 'some_user'@'localhost' IDENTIFIED BY 'some_pass';"
    mysql -u root -e "GRANT ALL PRIVILEGES ON *.* TO 'some_user'@'localhost';"
    ;;
  postgresql)
    psql -c 'create database zammad_test;' -U postgres
    ;;
esac

cp "config/database.yml.test-${DB}" config/database.yml
export RAILS_ENV=test
export ZAMMAD_VERSION=$(git describe --tags | sed -e 's/-[a-z0-9]\{8,\}.*//g')
