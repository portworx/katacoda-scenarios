</br>

##### Let us fix that. To do this, delete and recreate the PVC used by `mysql` with the correct storage class name. 


      StorageClass Name: px-alpha-sc
      provisioner = portworx volume
      io_priority = high
      repl = 1

Note: Please wait for the pod of the `mysql` deployment to be `Ready` before proceeding to the next question. 
