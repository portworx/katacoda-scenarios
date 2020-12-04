</br>

#####  Provide this cluster wide secret key to Portworx for default encryption of all volumes.


Do this by running:
`ssh -o strictHostKeyChecking=no node01 pxctl secrets set-cluster-key --secret cluster-wide-secret-key`{{execute}}
