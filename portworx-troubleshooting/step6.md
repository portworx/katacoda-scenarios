</br>

##### Let us fix that. To do this, re-create the storage class with the `auth secret`. 


      name: px-beta-sc
      provisioner: portworx volume
      io_priority: high
      repl: 3
      io profile: db
      openstorage.io/auth-secret-name: px-k8s-user
      openstorage.io/auth-secret-namespace: portworx
      
Note: Please wait for the pod of the `mysql` deployment to be `Ready` before proceeding to the next question.
