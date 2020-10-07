#!/bin/bash
cd /tmp/

launch.sh


STORK_POD=$(kubectl get pods -n kube-system -l name=stork -o jsonpath='{.items[0].metadata.name}') &&
kubectl cp -n kube-system $STORK_POD:/storkctl/linux/storkctl ./storkctl
sudo mv storkctl /usr/local/bin &&
sudo chmod +x /usr/local/bin/storkctl

kubectl delete ds kube-keepalived-vip -n kube-system

kubectl create -f /tmp/create-objects.yaml

kubectl create -f /tmp/testpolicy.yaml

curl -fsSL https://git.io/get_helm.sh | bash

helm init --service-account helm

echo " Wait for tiller to be up"
until [ `kubectl -n kube-system get pods | grep -i tiller | grep Running | grep 1/1 | wc -l ` == 1 ]; do printf .; sleep 1; done
sleep 5

echo "Installing Minio 1"
helm install --name px-minio-1 --set accessKey=ZZYYXXWWVVUU --set secretKey=0ldSup3rS3cr3t --set persistence.storageClass=px-ha-sc --set resources.requests.memory=1Gi stable/minio


echo "wait for minio server to be up..."

until [ `kubectl get pods | grep px-minio | grep Running | grep 1/1 | wc -l` == 1 ]; do printf . ;sleep 1;done

wget -O /usr/bin/mc https://dl.minio.io/client/mc/release/linux-amd64/mc


chmod +x /usr/bin/mc

MINIO_ENDPOINT=$(kubectl describe svc px-minio-1 | grep Endpoints | awk '{print $2}')


echo $MINIO_ENDPOINT

echo "setting up minio object store..."

mc config host add px http://$MINIO_ENDPOINT ZZYYXXWWVVUU 0ldSup3rS3cr3t S3v4


echo "Setting up a cloud credential"
echo "ssh node01 /opt/pwx/bin/pxctl cred create --provider s3 --s3-access-key ZZYYXXWWVVUU --s3-secret-key 0ldSup3rS3cr3t --s3-region us-east-1 --s3-endpoint http://$MINIO_ENDPOINT objectstore-2"

ssh -o strictHostKeyChecking=no node01 /opt/pwx/bin/pxctl cred create --provider s3 --s3-access-key ZZYYXXWWVVUU --s3-secret-key 0ldSup3rS3cr3t --s3-region us-west-2 --s3-endpoint http://$MINIO_ENDPOINT px-s3-store

