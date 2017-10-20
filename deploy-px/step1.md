In this step, you will install Portworx on 3 seperate hosts and configure a 3 node Portworx cluster.

## Prepare the hosts
Portworx (PX) requires at least some nodes in the cluster to have dedicated storage for Portworx to use.  PX will then carve out virtual volumes from these storage pools.  In this example, we use a loopback device to provide a local storage pool to each PX instance.  As you can see on the right, a 64GB loopback device has already been provisioned on these hosts.

### Task
Type `lsblk`{{execute}} to list the available devices.  Note the loopback storage device, which will be passed into PX as one of it's raw block disks.

In addition, PX relies on an external key value database (KVDB) like `etcd` or `consul` to store it's cluster discovery and bootstrap information.

>**Note:**<br/>In a production environment, please deploy a multi node etcd cluster following these instructions: https://coreos.com/etcd 

### Task
Create an etcd instance via Docker.

`IP=$(hostname -I | awk '{print $1}') && \
   docker run -d --net=host -p 2379:2379 \
   --volume=/var/lib/etcd:/etcd-data \
   --name etcd quay.io/coreos/etcd /usr/local/bin/etcd \
   --data-dir=/etcd-data --name node1 \
   --advertise-client-urls http://${IP}:2379 \
   --listen-client-urls http://${IP}:2379 \
   --initial-advertise-peer-urls http://${IP}:2380 \
   --listen-peer-urls http://${IP}:2380 \
   --initial-cluster node1=http://${IP}:2380`{{execute}}

Verify that etcd is functional:
`curl -w '\n' -X GET http://${IP}:2379/version`{{execute}}
