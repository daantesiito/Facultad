#!/bin/bash

if [ $# -ne 1 ]; then
    exit 0
fi

command=(`ls "$1"`)
arreglo=()

for c in ${command[@]}; do
    if [ -f "$c" ]; then
        arreglo+=("$c")
    fi
done

suma=0
ok=false

# Funciones para cada acción
delete() {
    local file="$1"
    local i=0
    local ok=false
    while [ "$ok" = false ] && [ "$i" -lt "${#arreglo[@]}" ]; do
        if [ "${arreglo[$i]}" = "$file" ]; then
            rm "${arreglo[$i]}"
            unset 'arreglo[$i]'
            ok=true
            echo "Archivo '$file' eliminado."
        fi
        ((i++))
    done
}

index() {
    local file="$1"
    local ok=false
    local i=0
    while [ "$ok" = false ] && [ "$i" -lt "${#arreglo[@]}" ]; do
        if [ "${arreglo[$i]}" = "$file" ]; then
            echo "Indice de archivo en el arreglo: '$i' "
            ok=true
        fi
        ((i++))
    done
}

size(){
    echo "La cantidad de archivos del directorio es: '${#arreglo[@]}'"
}

list(){
    echo "Archivos en el directorio: "
    echo "${arreglo[@]}"
}

# Menú de acciones
while [ "$ok" = false ]; do
    echo "Seleccione una acción (delete, index, size, list, exit): "
    read action
    case "$action" in
        delete)
            read -p "Ingrese el nombre del archivo a eliminar: " file
            delete "$file"
            ((suma++))
            ;;
        index)
            read -p "Ingrese el nombre del archivo para obtener el índice: " file
            index "$file"
            ((suma++))
            ;;
        size)
            size
            ((suma++))
            ;;
        list)
            list
            ((suma++))
            ;;
        exit)
            ((suma++))
            ok=true
            ;;
        *)
            echo "Opción inválida, intente de nuevo."
            ;;
    esac
done

echo "Muchas gracias, ud ejecutó '$suma' acciones sobre el directorio '$1'"
