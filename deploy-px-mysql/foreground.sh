launch.sh

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

VER=`kubectl version --short | awk -Fv '/Server Version: /{print $3}'`
curl -s -o px-spec.yaml "http://install.portworx.com?c=px-demo&k=etcd://master:4001&kbVer=${VER}&s=/dev/vdb"

kubectl apply -f px-spec.yaml

kubectl get pods -n kube-system -l name=portworx -o wide

while true; do
    NUM_READY=`kubectl get pods -n kube-system -l name=portworx -o wide | grep Running | grep 1/1 | wc -l`
    if [ "${NUM_READY}" == "3" ]; then
        echo "All portworx nodes are ready !"
        kubectl get pods -n kube-system -l name=portworx -o wide
        break
    else
        echo "Waiting for portworx nodes to be ready. Current ready nodes: ${NUM_READY}"
    fi
    sleep 5
done