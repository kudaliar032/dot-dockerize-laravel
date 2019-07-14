#!/bin/bash
case $1 in
  build) docker-compose up --no-start;;
  clear) docker-compose down;;
  start) docker-compose start;;
  stop) docker-compose stop;;
  webapp|database|redis) docker-compose exec $@;;
  help)
    echo "dot-docker build - build all container services"
    echo "dot-docker clear - stop and delete all container services"
    echo "dot-docker start - start all services"
    echo "dot-docker stop - stop all services without delete container"
    echo "dot-docker [SERVICE] [COMMAND] - run bash command in a service"
  ;;
  *) echo "dot-docker help, command list help";;
esac
