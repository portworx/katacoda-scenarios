Delete the existing StorageClass `px-gamma-sc` and recreate it with the correct parameters:
`kubectl  delete sc px-gamma-sc ; kubectl apply -f /root/gamma-sc.yaml`{{execute}}


Recreate the PVC if needed.
