kubectl create ns alpha

kubectl create ns beta

kubectl create ns gamma

chmod +x /tmp/create-token.sh

/tmp/create-token.sh

kubectl create -f /tmp/alpha-deployment.yaml

kubectl create -f /tmp/beta-deployment.yaml

kubectl create -f /tmp/gamma-deployment.yaml

ssh -o strictHostKeyChecking=no node03 "systemctl stop docker;sed -i 's/master:4001/master:4002/g' /etc/pwx/config.json; rm -rf /opt/pwx/oci/config.json; systemctl restart portworx; "
