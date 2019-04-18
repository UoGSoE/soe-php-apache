#!/bin/bash

set -e

BASE_NAME="uogsoe/soe-php-apache"
#VERSIONS=( "7.1" "7.2" "7.3" "7.1-ci" "7.2-ci" "7.3-ci" "latest")
VERSIONS=( "7.1" "7.2" "7.3" )

PNAME=`basename $0`
LOGFILE=`mktemp /tmp/${PNAME}.XXXXXX` || exit 1
echo "Logging to ${LOGFILE}"

for VERSION in "${VERSIONS[@]}";
do
    echo "Building ${VERSION}..."
    docker build --build-arg PHP_VERSION=${VERSION} -t "${BASE_NAME}":"${VERSION}" -f Dockerfile.base . >> "${LOGFILE}"
    echo "Pushing ${VERSION}..."
    #docker push "${BASE_NAME}":"${VERSION}" >> "${LOGFILE}"

    echo "Building ${VERSION}-ci..."
    docker build --build-arg PHP_VERSION=${VERSION} -t "${BASE_NAME}":"${VERSION}-ci" -f Dockerfile.base . >> "${LOGFILE}"
    echo "Pushing ${VERSION}-ci..."
    #docker push "${BASE_NAME}":"${VERSION}-ci" >> "${LOGFILE}"
done

