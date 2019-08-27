#!/bin/bash
# runs the prepare_stations.py script in the bn-backend container

# Identify the container name
CONTAINER=`docker ps --format "{{.Names}}" | grep bn-backend`

echo found container name: $CONTAINER
docker exec -it $CONTAINER bash -c 'export PYTHONPATH="/usr/local/lib/python3.5/site-packages/":"/":"/app";/usr/local/bin/python3 scripts/prepare_stations.py -f -v'
