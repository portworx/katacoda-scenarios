Delete the existing StorageClass `px-beta-sc` and recreate it with the correct parameters:
`kubectl  delete sc px-beta-sc ; kubectl apply -f /root/beta-sc.yaml`{{execute}}
