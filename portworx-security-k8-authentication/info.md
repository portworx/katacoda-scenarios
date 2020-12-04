In this lab,  we have a kubernetes cluster running Portworx with PX-Security enabled. 

We will make use of the concepts that we learned in the previous lectures and labs to secure a storage class by making use of a JWT token.

Note: This is a CSI Enabled Portworx cluster.
</br>
##### Portworx is currently being re-installed with CSI and Security enabled. Please wait for all pods to be updated. To check the status, click on the below command and wait for all Pods to have "2/2" ready containers:

`watch kubectl -n kube-system get pods -l name=portworx`{{execute}}


To get back to the terminal:
```clear```{{execute interrupt}}

Note: You cannot proceed to the next question until Portworx is Ready!
