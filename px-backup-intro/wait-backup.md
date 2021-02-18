
PX-Backup should start to be installed in the background as well, let's make sure and wait until this is complete. All pods should remain `1/1 Running` and the Post Install Hook should be `Completed`.

Run the following command to view the installation.
```
watch kubectl get pods -n px-backup 
```{{execute T1}}

Before continuing, the install hook job should show completed, something like: `pxcentral-post-install-hook-9frx4 0/1 Completed`. Note this may take 5+ minutes.

Hit ```clear```{{execute interrupt}} to ctrl-c and clear the screen.

Next, Open the PX-Backup UI by clicking the UI below.

https://[[HOST2_SUBDOMAIN]]-31234-[[KATACODA_HOST]].environments.katacoda.com

Login within "admin/admin"
