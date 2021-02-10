To create the admin token:

`ssh -o strictHostKeyChecking=no  node01 pxctl auth token generate \
    --auth-config=/tmp/admin-authconfig.yaml \
    --issuer=example-domain.com \
    --shared-secret=$PORTWORX_AUTH_SHARED_SECRET \
    --token-duration=1y`{{execute}}

Create an environment variable names `ADMIN_TOKEN`. Set the admin token environment variable to the token above. `ADMIN_TOKEN=<UUID>`


To create the secret:

`kubectl -n portworx create secret generic px-k8s-user --from-literal=auth-token=$ADMIN_TOKEN`{{copy}}
