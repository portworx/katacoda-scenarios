</br>

##### Create an ApplicationBackupSchedule called `backupschedule` which uses the pre-existing schedulepolicy called `testpolicy`.


###### Make use of the below the template located in `/root/app-schedule.yaml`. Enter the below parameters while creating this object:


       backupLocation: mysql,
       schedulePolicyName: testpolicy,
       namespaces: mysql-app,
       reclaimPolicy: Delete

Once created, wait for backup to complete.
