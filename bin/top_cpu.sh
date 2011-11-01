#!/bin/sh

cmd_count=$1
if [ -z $cmd_count ]; then
    cmd_count=8
fi

top -ocpu -F -l2 -n $cmd_count | grep -v top | tail -n $cmd_count | cut -c 1-29,39-43
