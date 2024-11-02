#!/bin/bash

if [ $# -ne 0 ]; then
    exit 0
fi

lista=$(cat /etc/passwd | cut -d : -f1)

for l in ${lista[@]}; do
    homeD=$(bat /etc/passwd | grep dante | cut -d : -f6)
    if [ -d "$homeD"/mailDir ]; then
        shell=$(bat /etc/passwd | grep dante | cut -d : -f7 | cut -d / -f4)
        if [ "$shell" = "bash" ]; then
            echo "$l" >> /var/listado.txt 
        fi
    fi
done