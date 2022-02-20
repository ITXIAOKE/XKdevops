#!/bin/bash
/data/nginx/sbin/nginx
tail -f /data/nginx/logs/access.log
