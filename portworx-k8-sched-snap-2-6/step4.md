</br>

##### Create a new NGINX StatefulSet, making use of the `px-nginx-scheduled` storage class.


Use the YAML file `/tmp/create-nginx-sts.yaml` to create the deployment.


The PVC's created by the StatefulSet will be backed up automatically as per the schedule policy `daily-schedule`.


