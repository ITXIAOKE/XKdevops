#!/bin/bash
count=`ps aux | grep node_exporter|grep -v grep | wc -l`
if [ $count -ne 1 ];then
        nohup /data/node_exporter/node_exporter &>/dev/null & 
fi
