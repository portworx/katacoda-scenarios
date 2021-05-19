Run:

`kubectl apply -f  /tmp/finance-pvc.yaml`{{execute}}


`kubectl apply -f  /tmp/engineering-pvc.yaml`{{execute}}

Then, check to make sure both PVCs are bound.

`kubectl get pvc -n engineering`{{execute}}

`kubectl get pvc -n finance`{{execute}}