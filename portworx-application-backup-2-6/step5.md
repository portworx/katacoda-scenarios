</br>

##### Now, restore the application back in its original source. Use the template file located at `/root/app-restore.yaml`.


###### Make use of the below parameters while creating this object:


       name: restore
       namespace: mysql-app
       Application Backup Name: backup
       Backup Location: mysql
       namespaceMapping: mysql-app --> mysql-app
       replacePolicy: Delete

Then create it

```kubectl create -f /root/app-restore.yaml ```{{execute}}

Once created, wait for the restore to complete. 

You can use the following command to check. 
```storkctl get applicationrestore -n mysql-app```{{execute}}
