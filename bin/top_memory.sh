#!/bin/sh

cmd_count=$1
if [ -z $cmd_count ]; then
    cmd_count=8
fi

top -orsize -F -r -l1 -n $cmd_count | tail -n $cmd_count | awk '{ printf "%-16s %s\n", $2,$11 }'
