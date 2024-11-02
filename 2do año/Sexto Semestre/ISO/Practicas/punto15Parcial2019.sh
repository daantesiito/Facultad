#!/bin/bash

if [ $# -lt 1 ]; then
    exit 0
fi

arreglo=("$@")

existe() {
    local contador=0
    for a in "${arreglo[@]}"; do
        ((contador++))
        if [ "$a" = "$1" ]; then
            echo "Indice del vector donde se encuentra '$1' es el indice: $((contador - 1))"
            return 0
        fi
    done
    return 1
}

replace() {
    local par1=''
    local par2=''
    local contador=0
    for a in "${arreglo[@]}"; do
        ((contador++))
        if [ "$a" = "$1" ]; then
            par1="$contador"
        elif [ "$a" = "$2" ]; then
            par2="$contador"
        fi
    done

    par1=$((par1 - 1))
    par2=$((par2 - 1))

    if [ -z "$par1" ] && [ -z "$par2" ]; then
        $arreglo[$par2]=${arreglo[$1]}
        $arreglo[$par1]=${arreglo[$2]}
    fi
}

eliminar() {
    local contador=0
    local pos=-1
    for a in "${arreglo[@]}"; do
        ((contador++))
        if [ "$a" = "$1" ]; then
            pos="$((contador - 1))"
            break
        fi
    done
    if [ $pos -ne -1 ]; then
        unset 'arreglo[$pos]'
    else
        return 2
    fi
}

cantidad() {
    echo "${#arreglo[@]}"
}

todos() {
    echo "${arreglo[@]}"
}
