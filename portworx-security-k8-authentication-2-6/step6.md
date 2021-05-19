</br>

##### Now let us test if PX-Security works on this cluster. Create a PVC using the YAML file `/tmp/test-pvc.yaml`.

This PVC tries to make use of the existing storage class `px-ha-sc` which makes use of portworx volume.

###### The PV creation should fail and PV remain in pending state, as you are not authorized to do this operation currently.
