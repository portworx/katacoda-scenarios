>>An ETCD instance has already been created for you on the master node<<

Inspect the ETCD container on master.

Name of the docker container is 'etcd', exposed on host port '4001'. Make a note of the the IP and port for the subsequent steps.

`export IP=$(hostname -I | awk '{print $1}')`{{execute}} 

`echo $IP`{{execute}}

`docker ps --filter names=etcd`{{execute}}
