>>Install a ETCD container on master node<<

Install on the node as a docker container:

`export IP=$(hostname -I | awk '{print $1}')`{{execute}} 

Container exposed to host port 4001:

`docker run -d --net=host -p 4001:2379 \
   --volume=/var/lib/px-etcd:/etcd-data \
   --name etcd quay.io/coreos/etcd /usr/local/bin/etcd \
   --data-dir=/etcd-data --name node1 \
   --advertise-client-urls http://${IP}:4001 \
   --listen-client-urls http://${IP}:4001 \
   --initial-advertise-peer-urls http://${IP}:2380 \
   --listen-peer-urls http://${IP}:2380 \
   --initial-cluster node1=http://${IP}:2380`{{execute}}
