#!/bin/bash

/usr/sbin/sshd -D -p 7080 -E /var/log/sshd.log -f /etc/ssh/sshd_config &
P1=$!
/usr/sbin/dockerd &
P2=$!
wait $P1 $P2
