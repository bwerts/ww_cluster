#!/bin/bash

help() {
    echo "options:"
    echo "  --base       Defines the base image to copy. use the (wwctl container ls) command to list current images for name reference" 
    echo "  --version    Build image with provided version number in rage: 00-99" 
}

if [[ -z $1 ]] || [[ "$1" != "--"* ]]; 
then
    help
    exit 1
fi


while [[ $# -gt 0 ]] && [[ "$1" = "-"* ]];
do
    opt="$1";
    shift;            
    case "$opt" in
        "--base" )
           IMG_BASE="$1"; shift;;
        "--version" )
           IMG_VERSION="$1"; shift;;
        *) echo >&2 "Invalid option: $opt"; help; exit 1;;
   esac
done

IMG_NAME=$(echo ${IMG_BASE} | sed 's/_base//')


wwctl container copy ${IMG_BASE} ${IMG_NAME}_prod${IMG_VERSION}

wwctl container exec --bind /root:/root ${IMG_NAME}_prod${IMG_VERSION} /bin/bash /root/ww_cluster/scripts/testscript.sh
