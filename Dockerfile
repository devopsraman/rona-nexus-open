FROM ubuntu-java7

MAINTAINER Ronan Gill <ronan@gillsoft.org>

RUN mkdir -p /u01
WORKDIR /u01

RUN wget http://www.sonatype.org/downloads/nexus-2.9.0-bundle.tar.gz
RUN tar -xzf nexus-2.9.0-bundle.tar.gz
RUN rm nexus-2.9.0-bundle.tar.gz

VOLUME ["/u01/sonatype-work/"]

EXPOSE     8081

RUN usermod -u 1034 www-data
RUN chown -R www-data:users /u01/*

ADD nexus.supervisor.conf /etc/supervisor/conf.d/
