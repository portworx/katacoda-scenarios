>>Install a ETCD container on master node<<

Install on the node as a docker container:

`export IP=$(hostname -I | awk '{print $1}')`{{execute}}

Container running on host port 4002:

`docker run -d --net=host \
   --volume=/var/lib/px-etcd:/etcd-data \
   --name etcd quay.io/coreos/etcd /usr/local/bin/etcd \
   --data-dir=/etcd-data --name node1 \
   --advertise-client-urls http://0.0.0.0:4002 \
   --listen-client-urls http://0.0.0.0:4002 \
   --initial-advertise-peer-urls http://${IP}:2390 \
   --listen-peer-urls http://${IP}:2390 \
   --initial-cluster node1=http://${IP}:2390`{{execute}}
