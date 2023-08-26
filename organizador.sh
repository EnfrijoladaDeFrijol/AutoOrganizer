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

solicitarNombreCarpeta(){
    printf "\n\t Carpeta que desea organizar: "
    read carpeta
}

borrarCache(){
    # Borramos el cache para evitar errores
    printf "\t Verificando Cache...\n"
    ubiCache=$(find ~/ -name "pip")
    #echo $ubiCache
    if [ -d "$ubiCache" ]
    then
        rm -r ~/.cache/pip/
    else
        true
    fi
}

# función que trabaja con una bandera para saber si existe 
# la carpeta y con esto poder seguir con elflujo del programa
buscarCarpeta(){
    # Se quiere buscar la carpeta a organizar

    # 1. Primero obtenemos la ubicación de la carpeta
    ubiCarpeta=$(find ~/ -name "$carpeta")
    #echo $ubiCarpeta

    # 2. Valisamos que esa ubicación exista en el SO
    if [ -d "$ubiCarpeta" ] # La carpeta existe
    then
        bandera=1 # Bandera para saber si existe
    else # La carpeta no existe en el So
        bandera=0 # Para decir que no existe
    fi
}

# Función que crea las carpetas en donde se irán
# moviendo los documentos a organizar
# Nota: aún falta hacer la versión en inglés del SO

# Verifica si ya existen las carpetas en el sistema
validarCarpetaOrganizada(){
    ubiCarpetaOrganizada=$(find ~/Documentos -name "Archivos_organizados")
    #echo $ubiCarpetaOrganizada 
    printf "\t Verificando información...\n"
    sleep 1.5
    if [ -d "$ubiCarpetaOrganizada" ]
    then # Carpeta organizada existe
        printf "\t Ya existe la carpeta organizada\n"
    else # Carpeta organizada no existe
        printf "\t Crando carpetas...\n"
        sleep 0.5
        mkdir ~/Documentos/Archivos_organizados
        printf "\t Se creó la carpeta organizada"        
    fi
}

# Función donde se organizarán los archivos
ordenarArchivos(){
    printf "\t Ordenando aechivos..."

    # Archivos .txt
    if [ -d "$ubiCarpetaOrganizada/TXTs" ]
    then # Existe la carpeta de .txt
        mv $ubiCarpeta/*.txt $ubiCarpetaOrganizada/TXTs
    else # No existe la carpeta de .txt
        mkdir $ubiCarpetaOrganizada/TXTs # Creamos la carpeta
        mv $ubiCarpeta/*.txt $ubiCarpetaOrganizada/TXTs
    fi

    # Archivos .pdf
    if [ -d "$ubiCarpetaOrganizada/PDFs" ]
    then # Existe la carpeta para los pdf
        mv $ubiCarpeta/*.pdf $ubiCarpetaOrganizada/PDFs
    else # No existe la carpeta para los pdf
        mkdir $ubiCarpetaOrganizada/PDFs # Creamos la carpeta
        mv $ubiCarpeta/*.pdf $ubiCarpetaOrganizada/PDFs 
}

main(){
    imprimirTitulo
    imprimirLinea
    borrarCache

    solicitarNombreCarpeta # Carpeta a organizar
    buscarCarpeta # Carpeta a oganizar y se asigna bandera

    if [ $bandera -eq 1 ]
    then
        #printf "$bandera \n"
        validarCarpetaOrganizada # Carpeta donde se organizará (se crea)
        ordenarArchivos # Mandamos a ordenar los archivos
    else
        printf "\t [Advertencia] No existe la carpeta en el sistema..."
        exit 0
    fi
}

main