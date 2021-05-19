</br>

##### Update the Portworx DaemonSet called `portworx`.


###### Run the below command to edit the px-spec YAML file:

`kubectl -n kube-system edit ds portworx`{{execute}}


Update the following parameters 

###### Args:
     
       jwt_issuer = example-domain.com


###### Env Variables for the Portworx DaemonSet

       PORTWORX_AUTH_JWT_SHAREDSECRET
       PORTWORX_AUTH_SYSTEM_KEY
       PORTWORX_AUTH_STORK_KEY

###### Run the below command to edit the stork YAML file:

`kubectl -n kube-system edit deployment stork`{{execute}}

###### Env Variables for the Stork Deployment:

       PX_SHARED_SECRET


Provide values from shared secret `pxkeys`.
