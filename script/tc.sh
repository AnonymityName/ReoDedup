#!/bin/bash

NODE_NUM=8
NODE_NAME=node
DPDEDUP_DIR=/root/DPDedup

# traffic control
for((i=1;i<=$NODE_NUM;i++));
do
    if [[ $i -gt 0 && $i -lt 10 ]]
    then
        host=${NODE_NAME}0${i}
    else
        host=${NODE_NAME}$i
    fi
    ssh $USER@$host "tc qdisc delete dev eth0 root;"
    # ssh $USER@$host "tc qdisc add dev eth0 root handle 1:0 htb default 1"
    # ssh $USER@$host "tc class add dev eth0 parent 1:0 classid 1:1 htb rate 1Gbit"

done
