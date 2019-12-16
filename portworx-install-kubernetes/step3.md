Now that we have a working KVDB, let's set up a Portworx cluster. To do this, we will make use of the px-spec.yaml. 

Update the YML file located at /root/px-spec.yaml with the etcd details and drives to be added to the storage pool. Use the spec below:

# 1. Drives: /dev/sdb
# 2. KVDB: Use the ETCD endpoint from the previous step.
# 3. Create the Portworx cluster. Are all the pods in a Running state?
