</br>

##### We have created a MYSQL deployment in the `mysql-app` namespace. This deployment makes use of PX volume and has some data in a table called `demodb`.

Create an applicationBackup CRD called `backup`. Make use of the template file located at `/root/app-backup.yaml`.

You will need the backup location name. 

```kubectl get backuplocation -n mysql-app```{{execute}}

Once you have edited `/root/app-backup.yaml`, create the backup.

```kubectl create -f /root/app-backup.yaml```{{execute}}

Wait for the backup to complete before proceeding. To get information about your backup, use the following command.

```kubectl describe applicationbackup -n mysql-app```{{execute}}
