FROM debian:jessie
MAINTAINER Ohge <https://github.com/Ohge>

### INSTALL DEPENDENCIES
RUN set -xe &&\
    apt-get update &&\
    apt-get install -y python git-core &&\
    apt-get clean &&\
    rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

RUN cd /opt &&\
    git clone https://github.com/RuudBurger/CouchPotatoServer.git

### CREATE PERSISTENT VOLUMES
VOLUME ["/etc/couchpotato"]
VOLUME ["/downloads"]
VOLUME ["/fetch"]

### EXPOSE PORTS
EXPOSE 5050

### RUN SCRIPT
CMD ["/bin/bash", "/etc/couchpotato/.couchpotato"]
