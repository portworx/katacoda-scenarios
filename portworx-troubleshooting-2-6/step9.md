</br>

##### The StorageClass `px-gamma-sc` does not have enough replicas to use a `db io_profile`. Let us fix that. To do this, delete and recreate the `px-gamma-sc` storage class with the correct parameters: 


      StorageClass Name: px-gamma-sc
      provisioner = portworx volume
      io_priority = high
      io_profile = db
      repl = 3

Once, you have recreated the StorageClass, click on Continue.
