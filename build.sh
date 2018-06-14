#!/bin/bash

set -e

BASE_IMAGE_NAME="uogsoe/soe-php-apache"
CURRENT_BRANCH=`git rev-parse --abbrev-ref HEAD | sed -e 's/.*\///g'`
FULL_NAME="${BASE_IMAGE_NAME}:${CURRENT_BRANCH}"

echo "Building ${FULL_NAME}"
docker build . -t "${FULL_NAME}"
docker push "${FULL_NAME}"

