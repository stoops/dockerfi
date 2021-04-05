#!/bin/bash
# docker pull debian
# docker run -p 8443:8443 -it debian bash
PORTS=' -p 1900:1900/udp -p 3478:3478/udp -p 10001:10001/udp -p 8080:8080/tcp -p 8443:8443/tcp '
docker build -t unifi .
docker run -d $PORTS unifi
