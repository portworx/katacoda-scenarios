PX-Backup should be installing in the grackground as well, lets make sure and wait until this is complete. All pods should remain `1/1 Running`.

```
watch kubectl get pods -n px-backup 
```{{execute T1}}

Hit ```clear```{{execute interrupt}} to ctrl-c and clear the screen.

Open the PX-Backup UI

https://[[HOST2_SUBDOMAIN]]-31234-[[KATACODA_HOST]].environments.katacoda.com

