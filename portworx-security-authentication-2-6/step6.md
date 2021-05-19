</br>

##### Create a PVC using the YAML file `/root/test-pvc.yaml`.

This PVC tries to make use of the existing storage class `px-ha-sc` which makes use of portworx volume. 

###### The PV creation should fail 

The guest role has been disabled, so the PVC should remain in `pending` state, as you are not authorized to do this operation currently.
