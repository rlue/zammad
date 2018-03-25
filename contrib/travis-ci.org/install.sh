#!/bin/bash

case "${DB}" in
  mysql)
    bundle install --without postgres ;;
  postgresql)
    bundle install ;;
esac
