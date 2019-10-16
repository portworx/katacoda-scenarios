ssh root@[[HOST_IP]] 'echo "Host *" >> /root/.ssh/config && echo "    StrictHostKeyChecking no" >> /root/.ssh/config && chmod 400 /root/.ssh/config'
kubectl create -f portwox-pxc-operator.yaml
# Let operator be ready
sleep 10 # better way?
kubectl create -f pwx-monitoring.yaml
kubectl create -f autopilot-cfg.yaml
kubectl create -f autopilot.yaml
