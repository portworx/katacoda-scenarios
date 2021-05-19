scp -o StrictHostKeyChecking=no  /tmp/role.json node01:/tmp
ssh -o strictHostKeyChecking=no  node01 "pxctl auth token generate --auth-config=/tmp/admin-authconfig.yaml --issuer=example-domain.com --shared-secret=Sup3rs3cr3t --token-duration=1y" > /tmp/admin-token.txt
TOKEN=$(cat /tmp/admin-token.txt)
ssh -o strictHostKeyChecking=no node01 -- pxctl context create admin --token $TOKEN
ssh -o strictHostKeyChecking=no node01 -- pxctl context set admin
# disable guest access
ssh -o StrictHostKeyChecking=no node01 -- pxctl role update --role-config /tmp/role.json
kubectl -n portworx create secret generic px-k8s-user --from-literal=auth-token=$(cat /tmp/admin-token.txt)
