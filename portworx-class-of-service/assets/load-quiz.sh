#!/bin/bash
cd /tmp/

launch.sh


STORK_POD=$(kubectl get pods -n kube-system -l name=stork -o jsonpath='{.items[0].metadata.name}') &&
kubectl cp -n kube-system $STORK_POD:/storkctl/linux/storkctl ./storkctl
sudo mv storkctl /usr/local/bin &&
sudo chmod +x /usr/local/bin/storkctl

kubectl create -f /tmp/create-pvc.yaml
kubectl create -f /tmp/create-nginx-sts.yaml

while [ `kubectl get pods | grep web | grep 1/1 | wc -l` -ne 2 ] 
do 
	printf '.'
	sleep 1
done
kubectl exec web-0 dd if=/dev/zero of=/usr/share/nginx/html/file2.txt count=4101024 bs=1024
