FROM docker.gillsoft.org/ubuntu-base

MAINTAINER Ronan Gill <ronan.gill@gillsoft.org>

ENV NEXUS_VERSION 2.11.4-01

ADD https://download.sonatype.com/nexus/oss/nexus-${NEXUS_VERSION}-bundle.tar.gz /u01/

RUN mkdir -p /u01/sonatype-nexus /u01/sonatype-work  && \
	tar -xzf /u01/nexus-${NEXUS_VERSION}-bundle.tar.gz -C /u01/sonatype-nexus --strip-components=1 && \
	rm /u01/nexus-${NEXUS_VERSION}-bundle.tar.gz && \
	usermod -u 1034 www-data && chown -R www-data:users /u01/*
	
VOLUME ["/u01/sonatype-work"]
EXPOSE  8081
USER www-data

CMD /u01/sonatype-nexus/bin/nexus console
