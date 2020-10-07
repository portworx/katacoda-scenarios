</br>
##### Create a StorageClass called `px-secure-sc` that uses `portworx-volume` provisioner and has the following parameters.


       openstorage.io/auth-secret-name: px-k8s-user
       openstorage.io/auth-secret-namespace: portworx
       repl: 2


Here px-k8s-user is the token secret created in the previous step.
