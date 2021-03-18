# Proxy Volume Storage Classes

This Lab has a Kubernetes and Portworx cluster pre-deployed. We have also deployed an NFS server on `node01`. Get the IP of that server.

```ssh node01 "ifconfig ens3"```{{execute}}

Next, open the Proxy Volume Storage Class and add replace `<NODE01_IP>`.

```vi /root/proxyvol-sc.yaml```{{execute}}

After you edit, create the Storage Class.

```kubectl create -f proxyvol-sc.yaml```{{execute}}