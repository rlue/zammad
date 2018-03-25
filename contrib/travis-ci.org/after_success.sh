#!/bin/bash

CURRENT_PATH="$( cd "$(dirname "$0")" ; pwd -P )"

if [ "${DB}" = "mysql" ]; then
  "${CURRENT_PATH}/after_success/trigger-docker-build.sh"
  "${CURRENT_PATH}/after_success/trigger-docker-compose-build.sh"
  "${CURRENT_PATH}/after_success/trigger-docker-univention-build.sh"
fi
