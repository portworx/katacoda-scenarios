ssh root@[[HOST_IP]] 'echo "Host *" >> /root/.ssh/config && echo "    StrictHostKeyChecking no" >> /root/.ssh/config && chmod 400 /root/.ssh/config'

while [ ! -f /root/.kube/config ]
  do
    sleep 1
  done
if [ -f /root/.kube/start ]; then
  /root/.kube/start
fi

# Install PX-Central
bash <(curl -s https://raw.githubusercontent.com/portworx/px-central-onprem/1.0.2/install.sh) --px-store --px-backup --admin-password 'Password$1' --oidc --pxcentral-namespace portworx --px-license-server --license-password 'Password$1' --px-backup-organization myorg --cluster-name pxcentral --admin-email admin@example.com --admin-user admin