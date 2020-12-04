</br>

##### Now that we have an object store credential set up, let us create a backuplocations CRD called `mysql`.


To do this, make use of the template file located at `/root/backup-location.yaml`. Make sure that the missing fields are populated before creating the object.

###### S3Config:

       accessKeyID: ZZYYXXWWVVUU
       secretAccessKey: 0ldSup3rS3cr3t


To determine the endpoint, run the below command:
`mc admin info px`{{execute}}


To find the path/ bucket-name, run the below command:
`mc ls px`{{execute}}'

