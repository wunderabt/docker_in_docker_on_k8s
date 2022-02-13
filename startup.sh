#!/bin/bash

/usr/sbin/sshd -D &
P1=$!
/usr/sbin/dockerd &
P2=$!
wait $P1 $P2
