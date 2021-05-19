Check the PX Cluster status from one of the nodes:
`ssh node01 pxctl status`{{execute}}

If you see that the **node03** is Down, SSH to node03 and check the status of PX:
`ssh node03`{{execute}}

`ssh node03 systemctl status portworx`{{execute}}


Check for errors using journalctl:
`journalctl -u portworx*`{{execute}}

**Note:** We introduced an incorrect ETCD endpoint in the file **/etc/pwx/config.json**. You can see this by checking the port number for the etcd and compare it against the Portworx Deployment.

The **OCI Monitor** container should automatically detect and correct this. However, this is not happening as the **docker** service is down. As a result the Portworx service is broken on node03. 

Start the **docker** service and check the journalctl logs again to see if the service is starting properly. 
`systemctl start docker`{{copy}}

If that does not work, delete the **portworx pod** (of the portworx DaemonSet) running on node03. Wait for it to be re-created and in a Ready state. 
`kubectl get po -n kube-system -l name=portworx -o wide`{{copy}}


Once this is done, all nodes should be online.

