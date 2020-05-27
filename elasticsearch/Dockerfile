FROM docker.elastic.co/elasticsearch/elasticsearch:7.3.2
# FROM amazon/opendistro-for-elasticsearch:1.1.0

EXPOSE 9200 9300

USER root

RUN bin/elasticsearch-certutil cert -out config/elastic-certificates.p12 -pass ""

COPY ./config/elasticsearch.yml /usr/share/elasticsearch/config/elasticsearch.yml
RUN chown elasticsearch:root /usr/share/elasticsearch/config/elasticsearch.yml


