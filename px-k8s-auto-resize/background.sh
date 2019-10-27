ssh root@[[HOST_IP]] 'echo "Host *" >> /root/.ssh/config && echo "    StrictHostKeyChecking no" >> /root/.ssh/config && chmod 400 /root/.ssh/config'
kubectl create -f portworx-pxc-operator.yaml
until kubectl get po -n kube-system -l k8s-app=prometheus-operator | grep "Running"; do kubectl apply -f portworx-pxc-operator.yaml; echo "waiting for prometheus operator"; done
kubectl create -f pwx-monitoring.yaml
until kubectl get po -n kube-system -l prometheus=prometheus | grep "Running"; do kubectl apply -f pwx-monitoring.yaml; echo "setting up portworx monitoring"; done
kubectl create -f autopilot-cfg.yaml
until  kubectl get configmap autopilot-config -n kube-system | grep "1"; do kubectl apply -f autopilot-cfg.yaml; echo "setting up autopilot config"; done
kubectl create -f autopilot.yaml
until kubectl get po -n kube-system -l name=autopilot | grep "Running"; do kubectl apply -f autopilot.yaml; echo "setting up autopilot"; done