</br>

In this lab we will troubleshoot and fix issues with Stateful applications. 


Please wait for the environment to load.


Here are some handy links that should help with the troubleshooting:

1. [Troubleshooting Doc](https://2.3.docs.portworx.com/portworx-install-with-kubernetes/operate-and-maintain-on-kubernetes/troubleshooting/)

2. [Security](https://2.3.docs.portworx.com/cloud-references/security/kubernetes/shared-secret-model/)

3. [IO Profiles](https://2.3.docs.portworx.com/install-with-other/operate-and-maintain/performance-and-tuning/tuning/)


Please wait for the Portworx pods to be Ready.
`watch kubectl -n kube-system get pods -l name=portworx`{{execute}}

To get back to the terminal:
```clear```{{execute interrupt}}
