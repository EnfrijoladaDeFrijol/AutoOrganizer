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



main(){
    imprimirTitulo
    imprimirLinea
    solicitarCarpeta
}

main