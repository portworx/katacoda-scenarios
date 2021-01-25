#!/bin/bash

curl -o helm.tar.gz https://get.helm.sh/helm-v3.3.0-rc.1-linux-amd64.tar.gz
tar -zxvf helm.tar.gz
mv linux-amd64/helm /usr/local/bin/helm
helm repo add portworx http://charts.portworx.io/ && helm repo update
kubectl create -f portworx-sc.yaml
helm install px-backup portworx/px-backup --namespace px-backup --create-namespace --set persistentStorage.enabled=true,persistentStorage.storageClassName="portworx-sc",oidc.centralOIDC.updateAdminProfile=false

#Install Stork 2.4 (we will connect this cluster)
curl -fsL -o stork-spec.yaml "https://install.portworx.com/2.5?comp=stork&storkNonPx=true"
kubectl apply -f stork-spec.yaml

until (kubectl get po --namespace px-backup -ljob-name=pxcentral-post-install-hook  -o wide | awk '{print $1, $2, $3}' |grep "Completed"); do echo "Waiting for post install hook";sleep 3; done

until (kubectl get po --namespace px-backup -lapp=px-backup  -o wide | awk '{print $1, $2, $3}' | grep "Running" | grep "1/1"); do echo "Waiting for backup service";sleep 3; done

kubectl patch svc px-backup-ui -n px-backup --type='json' -p '[{"op":"replace","path":"/spec/type","value":"NodePort"}]'

kubectl patch svc px-backup-ui -n px-backup --patch \
  '{"spec": { "type": "NodePort", "ports": [ { "nodePort": 31234, "port": 80, "protocol": "TCP", "targetPort": 8080 } ] } }'

BACKUP_POD_NAME=$(kubectl get pods -n px-backup -l app=px-backup -o jsonpath='{.items[0].metadata.name}' 2>/dev/null)
kubectl cp -n px-backup $BACKUP_POD_NAME:pxbackupctl/linux/pxbackupctl /usr/bin/pxbackupctl
chmod +x /usr/bin/pxbackupctl

BACKUP_POD_IP=$(kubectl get pods -n px-backup -l app=px-backup -o jsonpath='{.items[*].status.podIP}' 2>/dev/null)
backupPort=$(kubectl get svc px-backup-ui -n px-backup -o=jsonpath='{.spec.ports[?(@.port==80)].nodePort}')
client_secret=$(kubectl get secret --namespace px-backup pxc-backup-secret -o jsonpath={.data.OIDC_CLIENT_SECRET} | base64 --decode)
pxbackupctl login -s http://$pubIP:$backupPort -u admin -p admin
pxbackupctl create cluster --name cluster-1 -k /root/.kube/config -e $BACKUP_POD_IP:10002 --orgID default