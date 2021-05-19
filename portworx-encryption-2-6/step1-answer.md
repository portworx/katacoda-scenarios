Q1: List StorageClass
`kubectl get sc`{{execute}}

Q2: List Volumes and check if the encrypted field is enabled:
`ssh -o strictHostKeyChecking=no node01 pxctl volume list`{{execute}}
  
Q3: Check the value of 'secret_type':
`kubectl -n kube-system get ds portworx -o jsonpath='{.spec.template.spec.containers[].args}'`{{execute}}
