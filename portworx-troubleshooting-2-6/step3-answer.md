Delete the existing PVC in the alpha namespace and recreate it with the correct storage class name.
`kubectl -n alpha delete pvc px-alpha-pvc ; kubectl apply -f /root/alpha-pvc.yaml`{{execute}}
