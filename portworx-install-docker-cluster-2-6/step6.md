Now that we have installed Portworx on node01, lets scale the cluster with additional nodes.

Repeat steps 2 to 4 on new nodesi (node02 and node03).

ssh to node02
`ssh -o strictHostKeyChecking=no node02`{{execute}}

ssh to node03
`ssh -o strictHostKeyChecking=no node03`{{execute}}


On each node, execute all the below commands

`latest_stable=$(curl -fsSL "https://install.portworx.com/?type=dock&stork=false" | awk '/image: / {print $2}')`

`sudo docker run --entrypoint /runc-entry-point.sh --rm -i --privileged=true -v /opt/pwx:/opt/pwx -v /etc/pwx:/etc/pwx $latest_stable`

`sudo /opt/pwx/bin/px-runc install -c portworx-cluster1 -k etcd://${ETCD HOST IP}:4001 -s /dev/vdb`

`systemctl enable portworx`

`systemctl start portworx`

Verify there are three nodes before moving one

`pxctl status`{{execute}}