#!/usr/bin/env bash
SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )
cd ${SCRIPT_DIR}
DOCKER_BUILDKIT=0 docker build -t dboreham/test-container:test -f ../container/Dockerfile ../container
echo "Images in the registry:"
docker image ls
echo "Running the container I built:"
docker run dboreham/test-container:test
docker compose --verbose --project-directory ../compose -f ../compose/docker-compose.yml up -d
docker compose -f ../compose/docker-compose.yml exec test ls -l /
docker compose -f ../compose/docker-compose.yml exec test cat /config-file.txt
docker compose -f ../compose/docker-compose.yml exec test cat /test-file.txt
docker compose -f ../compose/docker-compose.yml down
