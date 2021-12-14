>>Configure PX under runC<<

IP Address of the ETCD Server:

`export IP=$(hostname -I | awk '{print $1}')`{{execute}}


`sudo /opt/pwx/bin/px-runc install -c demo-px-cluster \
    -k etcd://${IP}:4001 \
    -s /dev/vdb`{{execute}} 

Warning: If you make a mistake while running the above command, please clean up the configuration before attempting a re-install.
[Uninstall the Portworx OCI Bundle](https://docs.portworx.com/install-with-other/docker/standalone/#uninstalling-the-portworx-oci-bundle)
