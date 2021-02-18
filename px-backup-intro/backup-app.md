
A web application deployment and a Postgres database have already been deployed to this cluster. The web application lets you click on the screen and add coordinates to the Postgres database of the location of the click. This simple application is a good way to test backup. The Postgres database is using a PVC based on Portworx Storage.

First, let's add data to an application and back it up. Click on the below link. Then click on the screen to add data to Postgres.

https://[[HOST2_SUBDOMAIN]]-30123-[[KATACODA_HOST]].environments.katacoda.com

Next, we then back it up. 

1. Head to the PX-Backup UI and select the `katacoda-px` cluster from the UI. 
2. Select the namespace `demo` from the dropdown menu in the top left.
3. Click `Backup` in the top right.
4. Give the backup a name
5. Select the backup location `minio-backuplocation`.
5. Click `Create`.

Watch the backup until it turns green and is completed. You can click on the three dots to the right of the backup and select `Show Details` for more information during the backup.