</br>

##### Now, restore the application back in its original source. Use the template file located at `/root/app-restore.yaml`.


###### Make use of the below parameters while creating this object:


       name: restore
       namespace: mysql-app
       Application Backup Name: backup
       Backup Location: mysql
       namespaceMapping: mysql-app --> mysql-app
       replacePolicy: Delete

Once created, wait for the restore to complete.
