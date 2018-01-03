PX relies on an external key value database (KVDB) like `etcd` or `consul` to store it's cluster discovery and bootstrap information.

### Step: Create an etcd instance via Docker.

```
export IP=$(hostname -I | awk '{print $1}')

docker run -d --net=host -p 4001:2379 \
   --volume=/var/lib/px-etcd:/etcd-data \
   --name etcd quay.io/coreos/etcd /usr/local/bin/etcd \
   --data-dir=/etcd-data --name node1 \
   --advertise-client-urls http://${IP}:4001 \
   --listen-client-urls http://${IP}:4001 \
   --initial-advertise-peer-urls http://${IP}:2380 \
   --listen-peer-urls http://${IP}:2380 \
   --initial-cluster node1=http://${IP}:2380
```{{execute T1}}

### Step: Verify that etcd is functional and reachable from one of the minions

Below command queries the etcd version endpoint from `node01`.

Click: `ssh root@node01 curl -s http://master:4001/version`{{execute T2}}
