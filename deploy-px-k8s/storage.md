Portworx (PX) requires at least some nodes in the cluster to have dedicated storage for Portworx to use.  PX will then carve out virtual volumes from these storage pools.  In this example, we use a loopback device to provide a local storage pool to each PX instance.  As you can see on the right, a 64GB loopback device has already been provisioned on these hosts.

### List block devices on all nodes

Type `lsblk`{{execute HOST1}} to list the available devices on the master.

Type `lsblk`{{execute HOST2}} to list the available devices on the minion.

Note the loopback storage device `loop18`, which will be passed into PX as one of it's raw block disks.
