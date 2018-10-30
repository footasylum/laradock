#!/bin/bash

case "$1" in
    start)
        if [ "$2" == "apache2" ]
        then
            printf "Starting $2 server......"
            docker-compose up -d apache2 redis portainer beanstalkd jenkins beanstalkd-console mariadb phpmyadmin workspace php-worker
        elif [ "$2" == "nginx" ] 
        then
            printf "Starting $2 server......"
            docker-compose up -d nginx redis portainer beanstalkd jenkins beanstalkd-console mariadb phpmyadmin workspace php-worker
        else
            echo 'Selected server not found.  Choices are apache2 or nginx'
        fi
        ;;
    bash)
        docker-compose exec workspace bash
        ;;
    reload)
        docker-compose build --no-cache apache2 && \
        docker-compose restart
        ;;
    stop)
        docker-compose stop
        ;;
    build)
        docker-compose build apache2 nginx redis portainer beanstalkd jenkins beanstalkd-console mariadb phpmyadmin workspace php-worker
        ;;
    rebuild)
        docker-compose stop && \
        docker-compose rm -f && \
        docker-compose pull && \
        docker-compose build --no-cache apache2 nginx redis portainer jenkins beanstalkd beanstalkd-console mariadb phpmyadmin workspace php-worker
        ;;
    *)
        echo don\'t know
        ;;
esac
