</br>
##### Q3: Create a new token in the PX cluster using the authconfig file located at `/tmp/engineering-authconfig.yaml` in `node01`


Use `Sup3rs3cr3t` as the value for `shared-secret` while creating the token and `issuer: example-domain.com`


##### Next, create a kubernetes secret called `px-k8s-user` in the `engineering` namespace with key `auth-token` whose value should be the token created in the previous step.


