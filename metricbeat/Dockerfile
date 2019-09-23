FROM docker.elastic.co/beats/metricbeat:7.3.2

###########################################################################
# Laradock non-root user:
###########################################################################

# Add a non-root user to prevent files being created with root permissions on host machine.
ARG PUID=1000
ENV PUID ${PUID}
ARG PGID=1000
ENV PGID ${PGID}


COPY metricbeat.yml /usr/share/metricbeat/metricbeat.yml
USER root

RUN chown root:metricbeat /usr/share/metricbeat/metricbeat.yml
USER metricbeat
