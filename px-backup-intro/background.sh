ssh root@[[HOST_IP]] 'echo "Host *" >> /root/.ssh/config && echo "    StrictHostKeyChecking no" >> /root/.ssh/config && chmod 400 /root/.ssh/config'

while [ ! -f /root/.kube/config ]
  do
    sleep 1
  done
if [ -f /root/.kube/start ]; then
  /root/.kube/start
fi

# Setup PX-Backup
curl -o helm.tar.gz https://get.helm.sh/helm-v3.3.0-rc.1-linux-amd64.tar.gz
tar -zxvf helm.tar.gz
mv linux-amd64/helm /usr/local/bin/helm
helm repo add portworx https://raw.githubusercontent.com/portworx/helm/master/stable && helm repo update

# Wait for k8s?
sleep 5

ip=$(kubectl get nodes --selector=kubernetes.io/role!=master -o jsonpath={.items[*].status.addresses[?\(@.type==\"InternalIP\"\)].address} | awk '{print $1}')

helm install px-backup portworx/px-backup --namespace px-backup --create-namespace --set ingressControllerSetup=false,centralEndpoint="$ip"

until (kubectl get po --namespace px-backup -ljob-name=pxcentral-post-install-hook  -o wide | awk '{print $1, $2, $3}' |grep "Running" | grep "1/1"); do echo "Waiting for post install hook";sleep 3; done

until (kubectl get po --namespace px-backup -lapp=px-backup  -o wide | awk '{print $1, $2, $3}' | grep "Running" | grep "1/1"); do echo "Waiting for post install hook";sleep 3; done

kubectl patch svc px-backup-ui -n px-backup --type='json' -p '[{"op":"replace","path":"/spec/type","value":"NodePort"}]'
