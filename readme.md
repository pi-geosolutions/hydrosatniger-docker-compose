Docker composition for hydrosatniger webmap
===========================================

Here is the docker_compose file to run the hydrosatniger as standalone services
on a server.
The data volumes are supposed to be local.

Hostname
--------
Adjust the hostname in the compose file.

sources.ini file
----------------
Configure the data sources in the backend/conf folder. You might use the
template file. Rename it to sources.ini and adjust your credentials for the
hydroweb services.

data volume
-----------
The data folder is used by the main services (bn-backend, hence bn-frontend too)
You will need to create a data folder, with 999:999 ownership.

SSH/SFTP access
---------------
You will need to create a ftp_data folder for the sshd container so it  will be
possible to upload new data through SFTP. Have a look also at the sshd
configuration. You will want to add ssh keys in the sshd/authorized_keys folder
so that people can connect. The user names are configured in the compose file.
