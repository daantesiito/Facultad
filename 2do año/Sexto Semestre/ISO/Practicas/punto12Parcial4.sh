#!/bin/bash

if [ $# -ne 1 ]; then
    exit 1
fi

dir="/var/log/any-service/error.log"

while ! [ -f "$dir" ]; do
    sleep 180
done

if grep -q "FATAL ERROR" "$dir" ; then
    cant=$(cat "$dir" | grep "FATAL ERROR" | wc -l)
    $(tar -czf errorlog.tar.gz "$dir")
    $(mv errorlog.tar.gz "$1")
    echo "La cantidad de lineas del archivo que contenian FATAL ERROR eran: '$cant'"
    exit 0
fi