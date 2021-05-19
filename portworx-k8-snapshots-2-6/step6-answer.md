###### Use the below template to create a clone from the volumesnapshot for PVC of 'pod - 0' of the nginx StatefulSet::

(you must first modify the yaml file)
`vi /tmp/restore-nginx.yaml`{{execute}}

Create the restore object after editing.
`kubectl apply -f /tmp/restore-nginx.yaml`{{execute}}
