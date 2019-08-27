#!/bin/bash
# Watches for update in the $WATCH_DIR folder. If content is newer and has been 
# modified $NMIN minutes before, we do a sync
# this commands ensures that there has been enough time to fully transfer the folder's content
# before running the sync.

PROJECT_DIR=/home/projects/ird-bn
WATCH_DIR=${PROJECT_DIR}/ftp_data
WATCH_NAME=stations
DEST_DIR=${PROJECT_DIR}/data/sources/research_stations/stations/txt 
NMIN=1
UPDATE_SCRIPT=${PROJECT_DIR}/scripts/recompute_stations.sh

function update_action (){
	rsync -avh --delete --chown 999:999 ${WATCH_DIR}/${WATCH_NAME}/ $DEST_DIR 
	bash -c $UPDATE_SCRIPT
}
# We have to export the variables and the function because de find exec command 
# is run in a subshell. We should export every variable & function used after the find
export WATCH_DIR
export WATCH_NAME
export DEST_DIR
export UPDATE_SCRIPT 
export -f update_action

find $WATCH_DIR -maxdepth 1 -name $WATCH_NAME -mmin +$NMIN -newer $DEST_DIR -exec \
	bash -c 'update_action' \;
