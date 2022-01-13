#!/bin/bash
#
# run docker-compose tests
#

set -o errexit
set -o pipefail

docker-compose logs --timestamps --follow &

if docker-compose up --detach; then
    CURL_CHECK=$(curl -si --url "http://localhost:$(grep ENV_LOCAL_WEB_PORT .env | awk -F= '{print $2}')/admin" | \
        grep -o "Authentication key needed to continue")
    if [[ "${CURL_CHECK}" == "Authentication key needed to continue" ]]; then
        exit 0
    fi
 else
    exit 255
fi
