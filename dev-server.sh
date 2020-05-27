#!/bin/bash

case "$1" in
    start)
        if [ "$2" == "apache2" ]
        then
            printf "Starting %s server......" "$2"
            docker-compose up -d apache2 redis portainer beanstalkd beanstalkd-console mariadb phpmyadmin workspace php-worker jenkins laravel-echo-server graylog sonarqube
        elif [ "$2" == "nginx" ] 
        then
            printf "Starting %s server......" "$2"
            docker-compose up -d nginx redis portainer beanstalkd beanstalkd-console mariadb phpmyadmin workspace php-worker jenkins laravel-echo-server graylog sonarqube
        else
            echo 'Selected server not found.  Choices are apache2 or nginx!'
        fi
        ;;
    bash)
        docker-compose exec --user=laradock workspace bash
        ;;
    bash-root)
        docker-compose exec workspace bash
        ;;
    reload)
        docker-compose build --no-cache apache2 && \
        docker-compose restart
        ;;
    restart)
        docker-compose stop "$2" && \
        docker-compose up -d "$2"
        ;;
    stop)
        docker-compose stop
        ;;
    build)
        docker-compose build --no-cache "$2" && \
        docker-compose up -d "$2"
        ;;
    rebuild)
        docker-compose stop && \
        docker-compose rm -f && \
        docker-compose build --no-cache apache2 nginx redis portainer beanstalkd beanstalkd-console mariadb phpmyadmin workspace php-worker jenkins laravel-echo-server zap graylog sonarqube
        ;;
    *)
        echo don\'t know
        ;;
esac
