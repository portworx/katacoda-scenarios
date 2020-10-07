</br>

##### Now, lets clone the MYSQL deployment to a different namespace called `clone-mysql`. Use the template file located at `/root/app-clone.yaml`.


###### Make use of the below parameters while creating this object:


       name: clone-mysql
       namespace: kube-system
       sourceNamespace: mysql-app
       destinationNamespace: clone-mysql


Wait for the clone to complete before proceeding.
