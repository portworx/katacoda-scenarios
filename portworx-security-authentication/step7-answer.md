To create the admin token:

`ssh -o strictHostKeyChecking=no  node01 pxctl auth token generate \
    --auth-config=/tmp/admin-authconfig.yaml \
    --issuer=example-domain.com \
    --shared-secret=$PORTWORX_AUTH_SHARED_SECRET \
    --token-duration=1y`{{execute}}


To create the secret:

`kubectl -n portworx create secret generic px-k8s-user --from-literal=auth-token=$ADMIN-TOKEN`{{copy}}
