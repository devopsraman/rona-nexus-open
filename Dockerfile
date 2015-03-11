FROM ubuntu-java7

MAINTAINER Ronan Gill <ronan@gillsoft.org>

RUN mkdir -p /u01/sonatype-nexus /u01/sonatype-work
WORKDIR /u01
COPY nexus-latest-bundle.tar.gz /u01/

RUN tar -xzf nexus-latest-bundle.tar.gz -C /u01/sonatype-nexus --strip-components=1
RUN rm /u01/nexus-latest-bundle.tar.gz

VOLUME ["/u01/sonatype-work"]

EXPOSE     8081

RUN usermod -u 1034 www-data && chown -R www-data:users /u01/*

USER www-data

CMD /u01/sonatype-nexus/bin/nexus console
