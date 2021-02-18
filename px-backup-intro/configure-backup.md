
Configure Credentials and Backup Location

Check to see Minio is running.
`kubectl get po --namespace px-backup -l app=minio`{{execute}}

From the PX-Backups main screen, Navigate to `Settings` --> `Cloud Settings`.

Click `+Add` on `Cloud Account`

Fill out the cloud account with the following informaiton.
* name: `minio`{{copy}}
* accessKey: `ZZYYXXWWVVUU`{{copy}}
* secretKey: `0ldSup3rS3cr3t`{{copy}}

Next, Click `+Add` on `Backup Locations`

```clear```{{execute interrupt}} to ctrl-c and clear the screen.

Get the Minio endpoint to use by running the below command.
`kubectl describe svc -n px-backup px-minio-1 | grep Endpoints`{{execute}}

It will look something like `http://10.244.3.9:9000`

Next, create a Backup Location with the following informaiton.
* name: `minio-backuplocation`{{copy}}
* Path / Bucket: `backups`{{copy}}
* Encryption Key: (leave blank)
* Region: `us-west`{{copy}}
* Endpoint: `[Delete "s3.amazonaws.com" and FILL IN WITH URL FROM ABOVE]`
* Disable SSL: (Check the box - Yes)
* Storage Class: `Default`

Once both the Cloud Account and Backup Location are configured, please continue.