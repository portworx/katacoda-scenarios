#!/bin/bash
PORTWORX_AUTH_SYSTEM_KEY=$(cat /dev/urandom | base64 | fold -w 65 | head -n 1)
PORTWORX_AUTH_STORK_KEY=$(cat /dev/urandom | base64 | fold -w 64 | head -n 1)
PORTWORX_AUTH_SHARED_SECRET=Sup3rs3cr3t

kubectl -n kube-system create secret generic pxkeys \
    --from-literal=system-secret=$PORTWORX_AUTH_SYSTEM_KEY \
    --from-literal=stork-secret=$PORTWORX_AUTH_STORK_KEY \
    --from-literal=shared-secret=$PORTWORX_AUTH_SHARED_SECRET
