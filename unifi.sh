#!/bin/bash

# 1.
apt update && apt install -y wget gnupg ca-certificates-java apt-transport-https
apt update && apt install -y binutils curl jsvc logrotate procps haveged net-tools

# 2.
f='openjdk-8-jre-headless_8u275-b01-1~deb9u1_amd64.deb'
wget https://security.debian.org/debian-security/pool/updates/main/o/openjdk-8/$f && dpkg -i $f
r=$(dpkg-query -l | tr ':' ' ' | grep -i 'openjdk' | grep -iv 'openjdk-8-jre' | awk '{ print $2 }')
apt remove -y $r
apt --fix-broken install -y

# 3.
echo 'deb https://repo.mongodb.org/apt/debian stretch/mongodb-org/3.6 main' > /etc/apt/sources.list.d/mongodb-org.list
wget -qO - https://www.mongodb.org/static/pgp/server-3.6.asc | apt-key add
apt update && v=$(apt search mongodb-org-server 2>&1 | grep -i '3\.' | head -n 1 | awk '{ print $2 }')
apt install -y mongodb-org-server=$v
mkdir -p /data/db

# 4.
wget https://dl.ui.com/unifi/6.0.45/unifi_sysvinit_all.deb && dpkg -i unifi_sysvinit_all.deb
apt --fix-broken install -y
