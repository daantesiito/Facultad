#!/bin/bash

if [ $# -lt 1 ]; then
    exit 0
fi

arreglo=("$@")

esta_logueado(){

    if [ $# -ne 1 ]; then
        exit 0
    fi

    users=($(who | awk {print $1}))

    for u in ${users[@]}; do
        if [ "$u" = "$1" ]; then
            echo "El usuario '$u' esta logueado"
            break
        fi
    done
}

cant_procesos(){

    if [ $# -ne 1 ]; then
        exit 0
    fi

    cant=$(ps -u "$1" | wc -l)

    return $cant

}

uso_de_procesos() {

    if [ $# -ne 1 ]; then
        exit 0
    fi

    if [ "(cant_procesos "$1")" -gt 100 ]; then
        return true
    else
        return false
    fi
}
