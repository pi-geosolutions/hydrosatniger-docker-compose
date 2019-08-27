#!/bin/bash
# When working on the folders, transferring config from one server to another,
# etc, it can happen that we mess up the ACLs (owner, group owner, access rights)
# This script is meant to restore the ACLs as it should be. This is a work in
# progress, destined to be amended when a new issue arises.
# Run is as root user (or sudo)

# chdir into main directory
cd ..
chown -R 999:999 backend
chown -R 999:999 data
chown -R 999:999 ftp_data
chmod -R g+w ftp_data
chown -R 999:999 sycnthing_config
