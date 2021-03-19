# Persistent Volume Claim

Create the persistent volume claim.

```cat /root/proxy-vol-pvc.yaml; echo ""```{{execute}}

Create it

```kubectl create -f /root/proxy-vol-pvc.yaml```{{execute}}

Verify the PVC is bound

```kubectl get pvc```{{execute}}

Create the deployment that uses the PVC

```kubectl create -f proxy-vol-deployment.yaml```{{execute}}

Wait for the pod to be running. 

```watch kubectl get po -l app=nginx```{{execute}}

Once the pod is `Running 1/1`, hit ```clear```{{execute interrupt}}