#!/bin/bash

if [ $# -ne 1 ]; then
    exit 0
fi

while true; do
    users=$(who | awk '{print $1}')
    sleep 5
    for u in $users; do
        if [ "$u" = "$1" ] ; then
            echo "El usuario $1 es usuario del sistema"
            who | awk '{print $3,$1}' >> usuarios.log
            exit 0
        fi
    done
done