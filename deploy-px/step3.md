In this step, you will start the PX runC container on the three nodes.

## Start PX on the first node
Now that the OCI bundle is installed, you can start PX under `runC`.  The `runC` binaries are automatically deployed as part of installing the bundle.

>**Note:**<br/>The documentation for this task are here: https://docs.portworx.com/runc/#running-px-under-runc

### Task
Start PX using the loopback device and the etcd from step1 by executing this **command**

`sudo /opt/pwx/bin/px-runc \
  install -c MY_CLUSTER_ID \
  -k etcd://${IP}:2379 \
  -s /dev/loop18`{{execute}}

### Task
Enable the PX service

`sudo systemctl daemon-reload
sudo systemctl enable portworx
sudo systemctl start portworx`{{execute}}

### Task
Wait for PX to initialize.  This usually takes a few seconds.  When PX is running, the CLI, REST endpoint and it's integration with Docker and Kubernetes are immediately available on the host.  The CLI is accessible at `/opt/pwx/bin`.

Run this **command** to verify that PX is operational.

`sudo /opt/pwx/bin/pxctl status`{{execute}}
