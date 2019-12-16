
#### Since this is our first Lab session, you will be provided with commands and hints to aid with the Installation. ####

Reference: https://docs.portworx.com/install-with-other/docker/standalone/


* SYSTEMD: The installation below assumes the systemd package is installed on your system (i.e. systemctl command works). (DONE)

* FIREWALL: Ensure ports 9001-9022 are open between the cluster nodes that will run Portworx. (DONE)

* NTP: Ensure all nodes running PX are time-synchronized, and NTP service is configured and running. (DONE)

* STORAGE: At least one free unformatted partition/ disk drive. We will make use of /dev/vdb to create our very first storage pool. (DONE)

* KVDB: Before installing Portworx, we need  key-value database (etcd or consul) installed and ready. We will install this in the next step.
