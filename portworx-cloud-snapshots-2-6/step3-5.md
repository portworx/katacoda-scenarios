</br>

If the cloud credentials and volume snapshot were set up correctly, you can check the status by running the below command:

`kubectl describe volumesnapshot mysql-snapshot`{{execute}}

To check for the backed up objects in the  object store:
`mc ls px/`{{execute}}
