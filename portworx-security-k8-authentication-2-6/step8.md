</br>
##### Create a StorageClass called `px-secure-sc` that uses `portworx-volume` provisioner and has the following parameters. These parameters allow CSI to dynamically provision volumes with the namespace or project specific secrets.

    csi.storage.k8s.io/provisioner-secret-name: px-k8s-user
    csi.storage.k8s.io/provisioner-secret-namespace: ${pvc.namespace}
    csi.storage.k8s.io/node-publish-secret-name: px-k8s-user
    csi.storage.k8s.io/node-publish-secret-namespace: ${pvc.namespace}
    csi.storage.k8s.io/controller-expand-secret-name: px-k8s-user
    csi.storage.k8s.io/controller-expand-secret-namespace: ${pvc.namespace}
    repl: 2


Make use of the template: `/tmp/sc-template.yaml`


Here `px-k8s-user` is the token secret(s) that were created in the finance and engineering namespace.
