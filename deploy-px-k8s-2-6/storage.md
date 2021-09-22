Portworx (PX) requires at least some nodes in the cluster to have dedicated storage for Portworx to use.  PX will then carve out virtual volumes from these storage pools.  In this example, we use a 20GB block device that exists on each node.

### Step: List block devices on all nodes

Click `ssh root@node01 lsblk`{{execute T2}} to list the available devices on the node1.

Note the storage device `vdb`, which will be used by PX as one of it's raw block disks. All the nodes in this setup have the `vdb` device.
