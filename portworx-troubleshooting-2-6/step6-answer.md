Delete the existing StorageClass `px-beta-sc` and recreate it with the correct parameters:
`kubectl  delete sc px-beta-sc ; kubectl apply -f /root/beta-sc.yaml`{{execute}}

You may need to restart or delete the pod or pvc if the timeouts are too long. If your 
`kubectl delete -f /tmp/beta-deployment.yaml ; kubectl create -f /tmp/beta-deployment.yaml`{{execute}}
