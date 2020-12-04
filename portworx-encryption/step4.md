</br>

##### Create a new PVC using the previously created StorageClass. 

Use the below parameters:


       storageClass: encrypted-sc
       name: secure-pvc 
       accessMode: RWO
       size: 2Gi
