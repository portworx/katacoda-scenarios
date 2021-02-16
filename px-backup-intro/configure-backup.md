Configure Credentials and Backup Location

Check to see Minio is running.
`kubectl get po --namespace px-backup`{{execute}}

First, Create a Cloud Credential

Access and Secret Key
* accessKey: `ZZYYXXWWVVUU`{{copy}}
* secretKey: `0ldSup3rS3cr3t`{{copy}}

Minio Endpoint

`kubectl describe svc -n px-backup px-minio-1`{{execute}}

Next, create a Backup Location