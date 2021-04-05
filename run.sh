#!/bin/bash
while true ; do
  killall mongod
  mongod --dbpath data/db --fork --logpath data/db/log --port 27117
  java -cp /usr/share/java/commons-daemon.jar:/usr/lib/unifi/lib/ace.jar -Xmx1024M -Djava.awt.headless=true -Dfile.encoding=UTF-8 com.ubnt.ace.Launcher start
done
