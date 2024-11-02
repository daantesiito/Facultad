#!/bin/bash

files=($(find /var/log -type f | grep "access"))

cantidad() {
    echo "${#files[@]}"
}

listar() {
    echo "${files[@]}"
}


eliminar() {
    if [ $# -ne 2 ]; then
        return 1
    fi

    if [ "$2" = "logico" ]; then
        unset files["$1"]
    elif [ "$2" = "fisico" ]; then
        rm ${files["$1"]}
        unset files["$1"]
    else
        echo "2do parametro no valido."
    fi

    files=(${files[@]})
}