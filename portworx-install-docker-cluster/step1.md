Pre-Requisites for Installation on a Stand Alone Docker Host


```All the pre-requisites have already been completed in this lab with the exception of KVDB.```


`SYSTEMD: The installation below assumes the systemd package is installed on your system (i.e. systemctl command works).(Done)`

`FIREWALL: Ensure ports 9001-9022 are open between the cluster nodes that will run Portworx.(Done)`

`NTP: Ensure all nodes running PX are time-synchronized, and NTP service is configured and running.(Done)`

KVDB: Please have a clustered key-value database (etcd or consul) installed and ready. We will install this in the next step.

`STORAGE: At least one free unformatted partition/ disk drive. We will make use of /dev/vdb to create our very first storage pool.(Done)`
