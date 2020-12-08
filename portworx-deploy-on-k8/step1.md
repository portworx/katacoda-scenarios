</br>

##### Storage Classes

This Lab has a Kubernetes and Portworx cluster pre-deployed. We have also deployed a couple of storage classes. Inspect them and answer the following quiz.

>> Which of the following storage classes are available in this cluster? << 
[]  portworx-storage-class 
[*] px-sc
[*] px-sc-shared
[] dynamic-sc


>> Which Storage class is of type 'Shared'?<<
() px-sc
() shared-storage-class
(*) px-sc-shared
() milti-pod-sc


>> What is the replication factor used for the storage class 'px-sc'? <<
(*) 2
() 1
() 3
() 4

>> What is the IO Profile used by the storage class 'px-sc'?<<
(*) High
() Medium
() Low
() Auto


>> What is the name of the group used by the StorgeClass 'px-sc'? <<
=== cassandra_vg
