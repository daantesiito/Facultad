#!/bin/bash

if [ $# -lt 1 ]; then
    exit 0
fi

not_file_system=0

parametros="$@"

for p in $parametros; do
    if [ -f "$p" ]; then
        gzip "$p"
    elif [ -d "$p" ]; then
        if [ -r "$p" ]; then
            tar -cf archivo_empaquetado.tar "$p"
            gzip archivo_empaquetado.tar
        fi
        if [ -w "$p" ]; then
            rm -rf "$p"
        fi
    else
        not_file_system=$((not_file_system + 1))
    fi
done

echo "Cantidad total de parametros enviados no existentes son: $not_file_system"