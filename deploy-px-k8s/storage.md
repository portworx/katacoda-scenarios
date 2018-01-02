Portworx (PX) requires at least some nodes in the cluster to have dedicated storage for Portworx to use.  PX will then carve out virtual volumes from these storage pools.  In this example, we use a 20GB block device that exists on each node.

### Step: List block devices on all nodes

Click/Type `lsblk`{{execute node01}} to list the available devices on the node1.

Click/Type `lsblk`{{execute node02}} to list the available devices on the node2.

Click/Type `lsblk`{{execute node03}} to list the available devices on the node3.

Note the storage device `/dev/vdb`, which will be passed into PX as one of it's raw block disks.
