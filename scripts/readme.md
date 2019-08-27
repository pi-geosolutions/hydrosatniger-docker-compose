Scripts usage
=============

This folder contains some useful scripts, for tasks that were not easy to
leverage using docker. For instance, data updates.

Data updates
------------
There are 3 kinds of data updates :
* update hydroweb data from hydroweb services
* update research data (FTP folder is used to deposit the new data)
* synchronize data between 2 servers (we will call them master and slave,
  although the master for 1 data can become slave related to another data set)

**update hydroweb data from hydroweb services**

This is done running a python script in the bn-backend container. The script
recompute_stations.sh identifies the container and runs a docker exec to
run the script inside the container.

This can be programmed in cron, for instance to run every day at midnight UTC:
```
00 00 * * * /home/projects/ird-bn/scripts/recompute_stations.sh > /home/projects/ird-bn/scripts/stationsUpdate.log 2>&1
```
(adjust the paths if necessary)

**update research data**

This is done using the bash script watchForStationUpdate.sh. The main purpose
of this script is to watch for new files (but not too new as we want to make
sure the transfer is complete) on the ftp_data folder. When there are new data,
it runs a rsync command to copy the data to the data directory, which will be
used by the bn_backend service.
It also launches the recompute_stations.sh to reprocess the files (stations
list, thumbnails, etc)

**synchronize data between 2 servers**

This is done with the syncthing docker service, no home made scripts there.

Fix ACLs
--------
When working on the folders, transferring config from one server to another,
etc, it can happen that we mess up the ACLs (owner, group owner, access rights)
This script is meant to restore the ACLs as it should be. This is a work in
progress, destined to be amended when a new issue arises.
Run is as root user (or sudo)
