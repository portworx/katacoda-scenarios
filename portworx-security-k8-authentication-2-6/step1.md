

##### Q1: Create a shared Kubernetes secret called 'pxkeys' in the kube-system namespace.


###### The secret should container three keys: 'system-secret', 'stork-secret' and 'shared-secret'. 

Run the following command to generate random secrets:

`PORTWORX_AUTH_SYSTEM_KEY=$(cat /dev/urandom | base64 | fold -w 65 | head -n 1) \
PORTWORX_AUTH_STORK_KEY=$(cat /dev/urandom | base64 | fold -w 64 | head -n 1) \
PORTWORX_AUTH_SHARED_SECRET=$(cat /dev/urandom | base64 | fold -w 64 | head -n 1);`{{execute}}

Use the above variables to create the secret.
