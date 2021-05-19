Create the secret by running:

`kubectl -n kube-system create secret generic pxkeys --from-literal=system-secret=$PORTWORX_AUTH_SYSTEM_KEY --from-literal=stork-secret=$PORTWORX_AUTH_STORK_KEY --from-literal=shared-secret=$PORTWORX_AUTH_SHARED_SECRET`{{execute}}
