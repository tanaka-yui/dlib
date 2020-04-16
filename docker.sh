#!/bin/bash

PROJECT_DIR=$(cd $(dirname $0); pwd)
COMMAND=${1:-""}

pull() {
  docker pull ubuntu:18.04
}

exec() {
  docker exec -it ubuntu1804 /bin/bash
}

run() {
  docker run -v $PROJECT_DIR:/mnt/shared -it -d --name ubuntu1804 ubuntu:18.04
}

case "${COMMAND}" in
  pull) pull ;;
  exec) exec ;;
  run) run ;;
esac
