FROM ubuntu:18.04

MAINTAINER E.Okorie (emmanuel.okorie@grafikkaos.co.uk)

ENV DEBIAN_FRONTEND noninteractive    # export DEBIAN_FRONTEND="noninteractive"

USER root

RUN echo root:pass | chpasswd && \
    echo deb http://download.webmin.com/download/repository sarge contrib >> /etc/apt/sources.list \
    && /usr/bin/apt-key adv --keyserver keyserver.ubuntu.com --recv-keys D97A3AE911F63C51

RUN /usr/bin/apt-get update
RUN /usr/bin/apt-get -y install wget; (/usr/bin/wget -q http://www.webmin.com/jcameron-key.asc -O- | /usr/bin/apt-key add -)
RUN rm -rf /var/lib/apt/lists/*lz4 || exit 100; apt-get -o Acquire::GzipIndexes=false update
RUN apt-get -y install apt-show-versions webmin

ENV LC_ALL C.UTF-8

WORKDIR /var/www/

EXPOSE 10000

VOLUME ["/etc/webmin"]

CMD /usr/bin/touch /var/webmin/miniserv.log && /usr/sbin/service webmin restart && /usr/bin/tail -f /var/webmin/miniserv.log
