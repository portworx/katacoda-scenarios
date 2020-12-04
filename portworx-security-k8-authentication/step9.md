##### Create a new PVC called `finance-pvc` in the `finance` namespace and PVC called `engineering-pvc` in the `engineering` namespace. Make use of the StorageClass `px-secure-sc`.


Use the template file located at `/tmp/pvc-template.yaml` in the master node.

This PVC should now dynamically provision a Portworx volume.
