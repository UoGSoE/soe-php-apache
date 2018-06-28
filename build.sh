#!/bin/bash

set -e

BASE_NAME="uogsoe/soe-php-apache"
VERSIONS=( "7.1" "7.2" "7.1-ci" "7.2-ci" )

for VERSION in "${VERSIONS[@]}";
do
    FILENAME=Dockerfile.${VERSION}
    if [ ! -f $FILENAME ];
    then
        echo "No such file $FILENAME"
        exit 1
    fi
    echo "Building ${VERSION}..."
    docker build -t "${BASE_NAME}":"${VERSION}" -f "${FILENAME}" .
    docker push "${BASE_NAME}":"${VERSION}"
done
