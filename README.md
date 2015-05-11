# Docker Container for Nexus


This is conainter for [nexus][1].

The file nexus.conf is an upstart job for ubuntu.

## To Build

```
> docker build --tag nexus . # normal build
> docker build --no-cache=true --force-rm=true --tag nexus . # force a full build
```

## To Run

```
>    /usr/bin/docker run -a stdout --rm  --name=nexus-server \
                       --privileged \
                      -p 8081:8081 \
                      -v /data/files/nexus/sonatype-work/:/u01/sonatype-work/ \
                      192.168.1.178:5000/nexus
```

[1]:  https://github.com/echel0n/SickRage

