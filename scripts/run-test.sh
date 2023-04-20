#!/usr/bin/env bash
SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )
cd ${SCRIPT_DIR}
docker compose -f ../compose/docker-compose.yml up -d
docker compose -f ../compose/docker-compose.yml exec test ls -l /
docker compose -f ../compose/docker-compose.yml exec test cat /config-file.txt
docker compose -f ../compose/docker-compose.yml exec test cat /test-file.txt
docker compose -f ../compose/docker-compose.yml down
