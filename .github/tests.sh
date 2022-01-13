#!/bin/bash
#
# run docker-compose tests
#

# set -x
set -o errexit
set -o pipefail

docker-compose logs --timestamps --follow &

if docker-compose up --detach; then
    unset i
    for ((i=1;i<=120;i++)); do 
        echo -n "Health-Check ${i} :: "
        CONTAINER_STATUS=$(docker ps --filter "name=$(grep ENV_ENV_CONTAINER_NAME .env | awk -F= '{print $2}')" --format "{{.Status}}"| grep -Eo "\((.*)\)")
        echo "${CONTAINER_STATUS}"
        if [[ ${CONTAINER_STATUS} == "(healthy)" ]]; then
            break
        fi
        sleep 1
    done
    SEARCH_PATTERN="Authentication key needed to continue"
    CURL_CHECK=$(curl -si --url "http://localhost:$(grep ENV_LOCAL_WEB_PORT .env | awk -F= '{print $2}')/admin" | \
        grep -o "${SEARCH_PATTERN}")
    if [[ "${CURL_CHECK}" == "${SEARCH_PATTERN}" ]]; then
        exit 0
    fi
 else
    exit 255
fi
