#!/bin/bash
#
# run docker-compose tests
#

set -o errexit
set -o pipefail

docker-compose logs --timestamps --follow &

if docker-compose up --detach; then
    exit 0
 else
    exit 255
fi
