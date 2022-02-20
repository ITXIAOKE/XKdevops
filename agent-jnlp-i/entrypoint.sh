#!/bin/bash
source /etc/profile
/data/tomcat/bin/startup.sh
cat /tmp/hosts >> /etc/hosts
tail -f /data/tomcat/logs/catalina.out
