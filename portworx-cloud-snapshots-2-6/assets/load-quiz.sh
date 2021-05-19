#!/bin/bash
cd /tmp/

launch.sh

STORK_POD=$(kubectl get pods -n kube-system -l name=stork -o jsonpath='{.items[0].metadata.name}') &&
kubectl cp -n kube-system $STORK_POD:/storkctl/linux/storkctl ./storkctl
sudo mv storkctl /usr/local/bin &&
sudo chmod +x /usr/local/bin/storkctl /tmp/helm-install-minio.sh

kubectl create -f /tmp/create-objects.yaml

curl -fsSL https://git.io/get_helm.sh | bash
helm init --service-account helm

echo " Wait for tiller to be up"
until [ `kubectl -n kube-system get pods | grep -i tiller | grep Running | grep 1/1 | wc -l ` == 1 ]; do printf .; sleep 1; done
sleep 5

echo "Installing Minio 1"

sh -x /tmp/helm-install-minio.sh


echo "wait for minio server to be up..."

until [ `kubectl get pods | grep px-minio | grep Running | grep 1/1 | wc -l` == 1 ]; do printf . ;sleep 1;done

wget -O /usr/bin/mc https://dl.minio.io/client/mc/release/linux-amd64/mc


chmod +x /usr/bin/mc

MINIO_ENDPOINT=$(kubectl describe svc px-minio-1 | grep Endpoints | awk '{print $2}')


echo $MINIO_ENDPOINT

echo "setting up minio object store..."

mc config host add px http://$MINIO_ENDPOINT ZZYYXXWWVVUU 0ldSup3rS3cr3t --api S3v4

POD=`kubectl get pods -l app=mysql | grep Running | grep 1/1 | awk '{print $1}'`
kubectl exec -it $POD -- mysql -u root -e "create database demodb"


kubectl delete ds kube-keepalived-vip -n kube-system
