#!/bin/bash

# -f es para archivos
# -d direcotiro exsite?
# -e existe

imprimirTitulo(){
    printf "\t  _____                 _           _         \n" # Rectangles 
    printf "\t |     |___ ___ ___ ___|_|___ ___ _| |___ ___ \n"
    printf "\t |  |  |  _| . | .'|   | |- _| .'| . | . |  _|\n"
    printf "\t |_____|_| |_  |__,|_|_|_|___|__,|___|___|_|  \n"
    printf "\t           |___|                              \n"
}

imprimirLinea(){
    printf "\n\t --------------------------------------------- \n"
}

solicitarCarpeta(){
    printf "\n\t Carpeta que desea organizar: "
    read carpeta
}

buscarCarpeta(){
    # Se quiere buscar la carpeta a organizar

    # 1. Primero obtenemos la ubicación de la carpeta
    ubiCarpeta=$(find ~/ -name "$carpeta")
    echo $ubiCarpeta

    # 2. Valisamos que esa ubicación exista en el SO
    if [ -d "$ubiCarpeta" ] # La carpeta existe
    then
        bandera=1 # Decimos que si existe
    else # La carpeta no existe en el So
        bandera=0 # Para decir que no existe
    fi
}

main(){
    imprimirTitulo
    imprimirLinea
    solicitarCarpeta
    buscarCarpeta

    printf "$bandera \n"
}

main