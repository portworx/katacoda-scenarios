
Now, let's restore the application. 

First, let's delete the app. This will delete the entire app and PVCs. Please wait for the delete to complete.

`kubectl delete ns demo`{{execute}}

After the delete completes, head over the app again and check it is not available, it will like be buffering on ther UI screen and not show any Kubernetes logos.

To restore the app and data, head over to the backup UI and find your backup.

Select the backup using the right three dots and click restore.

1. Give your restore a name.
2. Select the `katacoda-px` cluster in desitnation cluster list.
3. Select `Replace existing resources`

Verify your backup has completed. It will turn green in the backup UI. 

Then wait for the application to come back online and see your data is recovered.

`watch kubectl get po -n demo`{{execute}}

When all pods are `Running 1/1` again, wait until the `Age` is `5m` as Katacoda takes some time to refresh the external application service.   Once you have waited, head over to the app again, your data from the backup should be there.

https://[[HOST2_SUBDOMAIN]]-30123-[[KATACODA_HOST]].environments.katacoda.com
