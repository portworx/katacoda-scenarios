Configure PX under runC on node01

Use the reference link below to configure px under runC. Make sure that you use the install flags for specifying the etcd and drives to be added the portworx cluster (Replace the **ETCD_HOST_IP** with the value from Step 1):

[Configure PX under runC](https://docs.portworx.com/install-with-other/docker/standalone/#step-2-configure-px-under-runc/)

`sudo /opt/pwx/bin/px-runc install -c portworx-cluster1 -k etcd://ETCD_HOST_IP:4001 -s /dev/vdb`

Note: This step configures systemd to start PX runC. If successful, you should see a bunch of INFO messages related to the configuration. 
