#!/bin/bash

if [ $# -lt 2 ]; then
    exit 1
fi

fecha="$1"
shift

file="/var/log/access."$fecha".log"

if [ -f "$file" ]; then
    for ip in "$@"; do
        cant=$(cat "$file" | grep "$ip" | wc -l)
        echo "'$ip' Accesos a sistema: '$cant'"
    done
else
    echo "Archivo inexistente."
    exit 1
fi