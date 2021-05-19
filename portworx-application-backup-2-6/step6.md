</br>

##### Now, lets clone the MYSQL deployment to a different namespace called `clone-mysql`. Use the template file located at `/root/app-clone.yaml`.


###### Make use of the below parameters while creating this object:


       name: clone-mysql
       namespace: kube-system
       sourceNamespace: mysql-app
       destinationNamespace: clone-mysql

Once finished, create the clone.
```kubectl create -f /root/app-clone.yaml```{{execute}}

Wait for the clone to complete before proceeding.

```storkctl get applicationclone -n kube-system```{{execute}}


