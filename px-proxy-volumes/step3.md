# Verify NFS share

The NGINX pod that is running is using the Proxy NFS volume and it is mounted at `/usr/share/nginx/html/`. Let's verify that data in the NFS server is available from within our Pod.

First, get the POD
```POD=$(kubectl exec po -l name=nginx -o jsonpath='{.items[0].metadata.name}')```{{execute}}

Then, see if there is anything in the mounted proxy volume (there shouldnt be).
```kubectl exec $POD -- ls /usr/share/nginx/html/```{{execute}}

Next, Add some data to the NFS share on the server.

```ssh node01 "touch /mnt/nfs_share/file.txt"```{{execute}}

Verify it is now available in the Pod.

```kubectl exec $POD -- ls /usr/share/nginx/html/```{{execute}}
