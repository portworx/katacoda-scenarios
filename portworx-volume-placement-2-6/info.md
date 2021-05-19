</br>

##### In this lab, we will explore the usage of Volume Placement Strategies to deploy a 3-Node Cassandra StatefulSet.


We will make use of VolumeAffinity and VolumeAntiAffinity rules for creating these CRDs. Next, we will create StorageClass's using these CRD's. 


Once everything is set up, we will deploy the StatefulSet. You can inspect the YAML file for Cassandra by running the command below:

`less /tmp/cassandra-sts.yaml`{{execute}}


