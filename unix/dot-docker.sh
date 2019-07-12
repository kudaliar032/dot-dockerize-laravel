#!/bin/bash
case $1 in
	build)
		docker-compose up --no-start
		;;
	clean)
		docker-compose down
		;;
	start)
		docker-compose start
		;;
	stop)
		docker-compose stop
		;;
	webapp)
		docker-compose exec webapp $2
		;;
	database)
		docker-compose exec database $2
		;;
	redis)
		docker-compose exec redi $2
		;;
	help)
		echo "dot-docker build, to build all container services"
		echo "dot-docker clean, to stop and clean all container services"
		echo "dot-docker start, to start all services"
		echo "dot-docker stop, to stop all services without clean container"
		echo "dot-docker webapp [COMMAND], to run bash command in webapp service"
		echo "dot-docker database [COMMAND], to run bash command in database service"
		echo "dot-docker redis [COMMAND], to run bash command in redis service"
		;;
	*)
		echo "dot-docker help, for help command list"
		;;
esac
