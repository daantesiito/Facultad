#!/bin/bash

files=($(find /home -type f -name "*.doc"))

verArchivo() {
    if [ $# -ne 1 ]; then
        return 1
    fi

    for f in "${files[@]}"; do
        if [ "$f" = "$1" ]; then
            echo "$(cat /home/"$1")"
            return 0
        fi
    done
    echo "Archivo no encontrado."
    return 5
}

cantidadArchivos() { 
    echo "${#files[@]}"
}

borrarArchivo() {
    if [ $# -ne 1 ]; then
        return 1
    fi
    
    for f in "${!files[@]}"; do
        if [ "${files[f]}" = "$1" ]; then
            echo "Quieres eliminar el archivo logicamente?"
            read option
            if [ "$option" = "si" ]; then
                unset files[$f]
            elif [ "$option" = "no" ]; then
                rm "${files[$f]}"
                unset files[$f]
            fi
            files=($(files[@]))
            return 0
        fi
    done
    echo "Archivo no encontrado."
    return 10
}
