# Persistent Volume Claim

Create the persistent volume claim.

```cat /root/proxy-vol-pvc.yaml```{{execute}}

Verify the PVC is bound

```kubectl get pvc```{{execute}}

Create the deployment that uses the PVC

```kubectl create -f proxy-vol-deployment.yaml```{{execute}}