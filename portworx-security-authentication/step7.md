</br>

##### Create a new token in the PX cluster using the authconfig file called `admin-authconfig.yaml` in `node01`.

Make use of the following parameters while creating the token:

       --auth-config: /tmp/admin-auth-config.yaml
       -issuer: example-domain.com 
       --shared-secret: $PORTWORX_AUTH_SHARED_SECRET
       -token-duration: 1y


Next, create a kubernetes secret called `px-k8s-user` in the `portworx` namespace with key `auth-token` whose value should be the token created in the previous step.

