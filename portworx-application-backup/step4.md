</br>

##### Create an ApplicationBackupSchedule called `backupschedule` which uses the pre-existing schedulepolicy called `testpolicy`.


###### Make use of the below the template located in `/root/app-schedule.yaml`. Enter the below parameters while creating this object:


       backupLocation: mysql,
       schedulePolicyName: testpolicy,
       namespaces: mysql-app,
       reclaimPolicy: Delete

Once created, wait for backup to complete.

(It may take a moment for the script to verify the action when clicking Continue)
