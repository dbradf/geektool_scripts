#!/bin/sh

if [ $# -eq 0 ]; then
    top -orsize -F -r -l1 | grep PhysMem
    exit 0
fi

output=`top -orsize -F -r -l1 | grep PhysMem`

wired=`echo $output    | awk '{ print $2 }'`
active=`echo $output   | awk '{ print $4 }'`
inactive=`echo $output | awk '{ print $6 }'`
used=`echo $output     | awk '{ print $8 }'`
free=`echo $output     | awk '{ print $10 }'`
free_val=`echo $free | cut -f 1 -d M`
inactive_val=`echo $inactive | cut -f 1 -d M`
(( available = $free_val + $inactive_val ))

for arg in $@; do
    if [ "$arg" = "-available" ]; then
        echo $available
    elif [ "$arg" = "inuse" ]; then
        echo $in_use
    elif [ "$arg" = "-used" ]; then
        echo $used
    elif [ "$arg" = "-free" ]; then
        echo $free
    elif [ "$arg" = "-wired" ]; then
        echo $wired
    elif [ "$arg" = "-active" ]; then
        echo $active
    elif [ "$arg" = "-inactive" ]; then
        echo $inactive
    fi
done



