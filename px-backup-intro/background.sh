#!/bin/bash

curl -o helm.tar.gz https://get.helm.sh/helm-v3.3.0-rc.1-linux-amd64.tar.gz
tar -zxvf helm.tar.gz
mv linux-amd64/helm /usr/local/bin/helm

#Install portworx storage class
kubectl create -f portworx-sc.yaml

#Install PX-Backup
helm repo add portworx http://charts.portworx.io/ && helm repo update
helm install px-backup portworx/px-backup --version 1.2.2 --namespace px-backup --create-namespace --set persistentStorage.enabled=true,persistentStorage.storageClassName="portworx-sc",oidc.centralOIDC.updateAdminProfile=false

#Install minio
helm repo add minio https://helm.min.io/  && helm repo update
helm install px-minio-1 minio/minio --version 8.0.10 --namespace px-backup --set accessKey=ZZYYXXWWVVUU --set secretKey=0ldSup3rS3cr3t --set persistence.storageClass=portworx-sc --set resources.requests.memory=1Gi

#Install Stork 2.4 (we will connect this cluster)
curl -fsL -o stork-spec.yaml "https://install.portworx.com/2.5?comp=stork&storkNonPx=true"
kubectl apply -f stork-spec.yaml

# Wait for px backup to come online and configure it
until (kubectl get po --namespace px-backup -ljob-name=pxcentral-post-install-hook  -o wide | awk '{print $1, $2, $3}' |grep "Completed"); do echo "Waiting for post install hook";sleep 3; done

until (kubectl get po --namespace px-backup -lapp=px-backup  -o wide | awk '{print $1, $2, $3}' | grep "Running" | grep "1/1"); do echo "Waiting for backup service";sleep 3; done

kubectl patch svc px-backup-ui -n px-backup --type='json' -p '[{"op":"replace","path":"/spec/type","value":"NodePort"}]'

kubectl patch svc px-backup-ui -n px-backup --patch \
  '{"spec": { "type": "NodePort", "ports": [ { "nodePort": 31234, "port": 80, "protocol": "TCP", "targetPort": 8080 } ] } }'

BACKUP_POD_NAME=$(kubectl get pods -n px-backup -l app=px-backup -o jsonpath='{.items[0].metadata.name}' 2>/dev/null)
kubectl cp -n px-backup $BACKUP_POD_NAME:pxbackupctl/linux/pxbackupctl /usr/bin/pxbackupctl
chmod +x /usr/bin/pxbackupctl

BACKUP_UI_POD_IP=$(kubectl get svc -n px-backup px-backup-ui -o jsonpath='{.spec.clusterIP}' 2>/dev/null)
BACKUP_POD_IP=$(kubectl get pods -n px-backup -l app=px-backup -o jsonpath='{.items[*].status.podIP}' 2>/dev/null)
client_secret=$(kubectl get secret --namespace px-backup pxc-backup-secret -o jsonpath={.data.OIDC_CLIENT_SECRET} | base64 --decode)
pxbackupctl login -s http://$BACKUP_UI_POD_IP:80 -u admin -p admin
pxbackupctl create cluster --name katacoda-px -k /root/.kube/config -e $BACKUP_POD_IP:10002 --orgID default

# Wait for minio to be ready and configure it
echo "wait for minio server to be up..."
until (kubectl get pods -n px-backup | grep px-minio | grep Running | grep 1/1 | wc -l); do printf . ;sleep 1;done

# Finally launch an app users can use.
kubectl create ns demo
kubectl create -f web-app.yaml -n demo