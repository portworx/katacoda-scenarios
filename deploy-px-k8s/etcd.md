PX relies on an key value database (KVDB) like `etcd` to store it's cluster discovery and bootstrap information. For this demo environment we will install on the is suitable for a demo scenario.

### Step: Create an etcd instance

Below, we are starting etcd via a docker container.
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

For production setups, follow [Portworx docs](https://docs.portworx.com/reference/knowledge-base/etcd/#requirements) for the recommendations on etcd. As of Version 2.0 you have the option to use a built in etcd.

### Step: Verify that etcd is functional and reachable

Below command queries the etcd version endpoint from `node01`.

Click: ```ssh root@node01 curl -s http://master:4001/version
```{{execute T2}}
