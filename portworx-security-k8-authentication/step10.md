>>Q2: Update the Portworx DaemonSet called 'portworx'<<


Run the below command to get the px-spec YAML file:

`kubectl -n kube-system get ds portworx -o yaml > /root/px-spec.yaml`{{execute}}


Update the following parameters in the spec file located at /root/px-spec.yaml:

>>Args:<<
jwt_issuer = example-domain.com


>>Env Variables:<<
PORTWORX_AUTH_JWT_SHAREDSECRET
PORTWORX_AUTH_SYSTEM_KEY
PORTWORX_AUTH_STORK_KEY

Provide values from shared secret 'pxkeys'.
