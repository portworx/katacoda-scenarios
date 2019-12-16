Now that Portworx has been installed in the system,  lets explore the cluster using pxctl utility. 

Hint: You can run pxctl cli from any of the cluster nodes (node01, node02 or node03) OR you can run it from the portworx pods (label name=portworx)
# Portworx on K8's Quiz

>>Q1: How many storage nodes do you see in the PX cluster?<< 
=== 3

Hint:
`ssh -o strictHostKeyChecking=no node01 pxctl status`{{execute}}


>>Q2: What is the version of PX installed? << 
() 2.1
(*) 2.2
() 2.3


>>Q3: What is the name of the PX cluster installed?<< 
() px-demo
() px-cluster-1
(*) my-lab-px-cluster

