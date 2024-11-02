#!/bin/bash

if [ $# -ne 1 ]; then
    exit 1
fi

w_r_perm=0

if [ -d "$1" ]; then
    files=($(find "$1" -type f))
    for f in "${files[@]}"; do
        if [ -r "$f" ]; then
            if [ -w "$f" ]; then
                (( w_r_perm++ ))
            fi
        fi
    done
else
    echo "Directorio inexistente"
    exit 4
fi  

echo "La cantidad de archivos con permiso a escritura son: '$w_r_perm'"  