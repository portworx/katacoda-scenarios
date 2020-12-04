</br>

##### Create storage policies using portworx volume provisioner to be used by `data` and `config` volumes. Use the below spec:


      Data StorageClass:
      1. Name: 'px-data' 
      2. replication factor: 1
      3. VolumePlacementStrategy: statefulset-data



      Config StorageClass:
      1. Name: 'px-config'
      2. replication factor: 1
      3. VolumePlacementStrategy: statefulset-config
