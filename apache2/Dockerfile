FROM webdevops/apache:ubuntu-18.04

LABEL maintainer="Eric Pfeiffer <computerfr33k@users.noreply.github.com>"

ARG PHP_UPSTREAM_CONTAINER=php-fpm
ARG PHP_UPSTREAM_PORT=9000
ARG PHP_UPSTREAM_TIMEOUT=60
ARG DOCUMENT_ROOT=/var/www/

ENV WEB_PHP_SOCKET=${PHP_UPSTREAM_CONTAINER}:${PHP_UPSTREAM_PORT}

ENV WEB_DOCUMENT_ROOT=${DOCUMENT_ROOT}

ENV WEB_PHP_TIMEOUT=${PHP_UPSTREAM_TIMEOUT}

EXPOSE 80 443 8200

WORKDIR /var/www/

COPY vhost.conf /etc/apache2/sites-enabled/vhost.conf

ENTRYPOINT ["/opt/docker/bin/entrypoint.sh"]

CMD ["supervisord"]

# RUN mkdir /etc/apache2/ssl 2> /dev/null
# RUN openssl genrsa -out "/etc/apache2/ssl/ssl_site.key" 2048 \
#     && openssl req -new -key "/etc/apache2/ssl/ssl_site.key" -out "/etc/apache2/ssl/ssl_site.csr" -subj "/CN=site.com/O=LGS/C=IT" \
#     && openssl x509 -req -days 365 -in "/etc/apache2/ssl/ssl_site.csr" -signkey "/etc/apache2/ssl/ssl_site.key" -out "/etc/apache2/ssl/ssl_site.crt"

# RUN a2enmod rewrite && a2enmod headers && a2enmod proxy proxy_html proxy_http xml2enc
# RUN a2enmod ssl
# RUN service apache2 restart

# ENTRYPOINT ["/opt/docker/bin/entrypoint.sh"]


# Filebeat Installation and configuration
# RUN curl -L -O https://artifacts.elastic.co/downloads/beats/filebeat/filebeat-7.3.2-amd64.deb
# RUN dpkg -i filebeat-7.3.2-amd64.deb
# COPY configs/filebeat.yml /etc/filebeat/filebeat.yml
# RUN filebeat modules enable system apache kibana apache elasticsearch logstash
# RUN filebeat setup

# USER root

# CMD ["/etc/init.d/filebeat", "start"]

# Metricbeat Installation and configuration
# RUN curl -L -O https://artifacts.elastic.co/downloads/beats/metricbeat/metricbeat-7.3.2-amd64.deb
# RUN dpkg -i metricbeat-7.3.2-amd64.deb
# COPY configs/metricbeat.yml /etc/metricbeat/metricbeat.yml
# RUN metricbeat modules enable system apache kibana apache elasticsearch logstash
# RUN metricbeat setup

# USER root

# CMD ["/etc/init.d/metricbeat", "start"]

# Heartbeat Installation and configuration
# RUN curl -L -O https://artifacts.elastic.co/downloads/beats/heartbeat/heartbeat-7.3.2-amd64.deb
# RUN dpkg -i heartbeat-7.3.2-amd64.deb
# COPY configs/heartbeat.yml /etc/heartbeat/heartbeat.yml

# USER root

# CMD ["/etc/init.d/heartbeat-elastic", "start"]


# APM Server Installation and configuration

# CMD ["supervisord"]
