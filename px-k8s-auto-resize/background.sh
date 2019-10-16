ssh root@[[HOST_IP]] 'echo "Host *" >> /root/.ssh/config && echo "    StrictHostKeyChecking no" >> /root/.ssh/config && chmod 400 /root/.ssh/config'
kubectl create -f portwox-pxc-operator.yaml
until kubectl get po -n kube-system -l k8s-app=prometheus-operator | grep "Running"; do echo "waiting for prometheus operator"; done
kubectl create -f pwx-monitoring.yaml
kubectl create -f autopilot-cfg.yaml
kubectl create -f autopilot.yaml