#!/bin/bash

if [ $# -ne 0 ]; then
    exit 0
fi

users=($(cut -d : -f1 /etc/passwd))

existe() {
    if [ $# -ne 1 ]; then
        exit 0
    fi
    for u in $users; do
        if [ $u = "$1" ]; then
            return 0
        fi
    done
    return 1
}

eliminar_usuario() {
    if [ $# -ne 1 ]; then
        exit 0
    fi
    users_new=()
    if existe "$1"; then
        for u in $users; do
            if [ $u != "$1" ]; then
				users_new+=($u)
            fi
        done
    fi
    if [ ${#users[@]} -eq ${#users_new[@]} ]; then
        return 2
    fi
}

usuarios_con_patron() {
    users_con_patron=0
    for u in $users; do 
        if echo "$u" | grep -q "*$1*"; then
            echo "$u"
            users_con_patron= $((users_con_patron + 1))
        fi
    done
    if [ users_con_patron -eq 0 ]; then
        return 102
    fi
}

cantidad() {
    if [ ${#users[@]} -eq 0 ]; then
        return 95
    else                            
        echo "${#users[@]}"
    fi
}

usuarios() {
    if [ ${#users[@]} -eq 0 ]; then
        return 95
    else
        echo "${users[@]}"
    fi
}