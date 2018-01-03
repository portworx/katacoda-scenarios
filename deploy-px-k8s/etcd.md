PX relies on an external key value database (KVDB) like `etcd` or `consul` to store it's cluster discovery and bootstrap information.

### Step: Create an etcd instance via Docker.

```
docker run -d --net=host -p 4001:2379 \
   --volume=/var/lib/px-etcd:/etcd-data \
   --name etcd quay.io/coreos/etcd /usr/local/bin/etcd \
   --data-dir=/etcd-data --name node1 \
   --advertise-client-urls http://master:4001 \
   --listen-client-urls http://master:4001 \
   --initial-advertise-peer-urls http://master:2380 \
   --listen-peer-urls http://master:2380 \
   --initial-cluster node1=http://master:2380
   ```{{execute T1}}

### Step: Verify that etcd is functional and reachable from one of the minions

Click/Type: `ssh root@node01 curl -w '\n' -X GET http://master:4001/version`{{execute T2}}
