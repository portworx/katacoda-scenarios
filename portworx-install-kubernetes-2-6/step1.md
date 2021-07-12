We will begin with a quick tour of the lab environment. This lab consists of a multi-node kubernetes cluster which has been deployed exclusively for you. This is a sandbox environment. Feel free to play around. The lab session will expire in 60 minutes.


# Envionment

Before we begin, wait for the Kubernetes cluster to become ready. This is a 4 node cluster is being cleaned so we can install Portworx. If you see Portworx installed using this command, you should see it become uninstalled shorts. Check status:
`watch kubectl get po -n kube-system -l name=portworx`{{execute}}

When you see "No resources found" you can click ```clear```{{execute interrupt}}

# Check the K8s Status
>>Q1: How many master nodes do you see in the cluster?<< 
=== 1

Hint:
`kubectl get nodes`{{execute}}


# Check the k8s version
>>Q2: What is the version of Kubernetes installed in this environment? << 
(*) 1.18.0 
() 1.14.0
() 1.16.2

Hint:
`kubectl version`{{execute}}


# k8 Cluster Info
>>Q3: What port is the kube-apiserver running on?<< 
=== 6443

Hint:
`kubectl cluster-info`{{execute}}


# Pods in the default namespace
>>Q4: Are there any pods running on the default name space? << 
() Yes 
(*) No

Hint:
`kubectl get pods`{{execute}}


# Kube DNS
>>Q5: What is the name of the dns deployment in the cluster? << 
() kube-dns 
(*) coredns
() kube-dns


>>Q6: How many replicas are configured for this deployment? <<
(*) 2
() 4
() 1

Hint:
`kubectl -n kube-system get deployments -l k8s-app=kube-dns`{{execute}}


