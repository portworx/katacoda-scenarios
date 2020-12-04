ssh -o strictHostKeyChecking=no  node01 "pxctl auth token generate --auth-config=/tmp/admin-authconfig.yaml --issuer=example-domain.com --shared-secret=Sup3rs3cr3t --token-duration=1y" > /tmp/admin-token.txt

kubectl -n portworx create secret generic px-k8s-user --from-literal=auth-token=$(cat /tmp/admin-token.txt)
