</br>

##### Check the Volume Placements for all volumes consumed by the Cassandra cluster. 

Run the commands below and verify both volumes are on the same node.

`data0=$(kubectl get pvc | grep cassandra-data-cassandra-0 | awk '{print $3}')`{{execute}}

`config0=$(kubectl get pvc | grep cassandra-config-cassandra-0 | awk '{print $3}')`{{execute}}

Make sure Data and Config are on same node.
`ssh node01 -- pxctl v inspect $data0 | grep "Running on"`{{execute}}

`ssh node01 -- pxctl v inspect $config0 | grep "Running on"`{{execute}}


The Volumes should have been placed based on the Volume Placement Rules we specified by placing config and data volumes next to eachother on the same node.
