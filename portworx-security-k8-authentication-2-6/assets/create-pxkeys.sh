#!/bin/bash
PORTWORX_AUTH_SYSTEM_KEY=$(cat /dev/urandom | base64 | fold -w 65 | head -n 1)
PORTWORX_AUTH_STORK_KEY=$(cat /dev/urandom | base64 | fold -w 64 | head -n 1)
PORTWORX_AUTH_SHARED_SECRET=Sup3rs3cr3t

kubectl -n kube-system create secret generic pxkeys \
    --from-literal=system-secret=$PORTWORX_AUTH_SYSTEM_KEY \
    --from-literal=stork-secret=$PORTWORX_AUTH_STORK_KEY \
    --from-literal=shared-secret=$PORTWORX_AUTH_SHARED_SECRET

scp -o StrictHostKeyChecking=no  /tmp/role.json /tmp/*.yaml node01:/tmp
ssh -o strictHostKeyChecking=no  node01 "pxctl auth token generate --auth-config=/tmp/admin-authconfig.yaml --issuer=example-domain.com --shared-secret=Sup3rs3cr3t --token-duration=1y" > /tmp/admin-token.txt
TOKEN=$(cat /tmp/admin-token.txt)
ssh -o strictHostKeyChecking=no node01 -- pxctl context create admin --token $TOKEN
ssh -o strictHostKeyChecking=no node01 -- pxctl context set admin
# disable guest access
ssh -o StrictHostKeyChecking=no node01 -- pxctl role update --role-config /tmp/role.json
