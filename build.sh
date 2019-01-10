#!/bin/bash

set -e

BASE_NAME="uogsoe/soe-php-apache"
VERSIONS=( "7.1" "7.2" "7.3" "7.1-ci" "7.2-ci" "7.3-ci" "latest")

PNAME=`basename $0`
LOGFILE=`mktemp /tmp/${PNAME}.XXXXXX` || exit 1
echo "Logging to ${LOGFILE}"

for VERSION in "${VERSIONS[@]}";
do
    FILENAME=Dockerfile.${VERSION}
    if [ ! -f $FILENAME ];
    then
        echo "No such file $FILENAME"
        exit 1
    fi
    echo "Building ${VERSION}..."
    docker build -t "${BASE_NAME}":"${VERSION}" -f "${FILENAME}" . >> "${LOGFILE}"
    echo "Pushing ${VERSION}..."
    docker push "${BASE_NAME}":"${VERSION}" >> "${LOGFILE}"
done
