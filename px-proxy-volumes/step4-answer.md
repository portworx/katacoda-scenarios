# Inspect the volume

Commands to help you find the answers.

```kubectl exec $POD -- cat /proc/mounts | grep /usr/share/nginx/html```{{execute}}

```kubectl describe pvc```{{execute}}