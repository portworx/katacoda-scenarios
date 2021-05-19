</br>

##### Inspect the PV created by the PVC. Is it bound and created with encryption enabled?

Run:
`ssh -o strictHostKeyChecking=no node01 pxctl volume list`{{execute}}


Verify that encryption is true for the volume.
