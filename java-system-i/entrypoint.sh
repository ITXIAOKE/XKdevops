#!/bin/bash
java -jar /data/newbee-mall/newbee-mall.jar > /data/newbee-mall/newbee-mall.log &
/etc/init.d/filebeat start
/bin/bash /data/node_exporter/run_node.sh &
tail -f /data/newbee-mall/newbee-mall.log
