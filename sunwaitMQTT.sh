#!/bin/bash

set -x

export PATH="/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin"

sunwait poll exit angle 53.664386N -2.672186W &? /dev/null

TOPIC="/home/environment/day"
MQTT_HOST=192.168.0.65
STATE="TRUE"
if [ $? -eq 2 ]; then
#    echo "It's sunny"
    STATE="TRUE"
elif [ $? -eq 3 ]; then
#    echo "It's dark"
    STATE="FALSE"
fi

mosquitto_pub -h $MQTT_HOST -t $TOPIC -m $STATE

