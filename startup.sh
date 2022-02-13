#!/bin/bash

/usr/sbin/sshd -D -p 7080 &
P1=$!
/usr/sbin/dockerd &
P2=$!
wait $P1 $P2
