Now that we have completed the Portworx installation, let us check the status: 

`pxctl status`{{execute}}


We can also check for the installation logs by running the journalctl command as show below:

`journalctl -lfu portworx*`{{execute}}
