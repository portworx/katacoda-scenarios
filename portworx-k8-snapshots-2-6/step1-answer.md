Q1: Run: `kubectl get deployment --all-namespaces -l app=mysql`{{execute}}


Q2: Run: `kubectl get pvc -l app=mysql --all-namespaces`{{execute}}


Q3: Run: `kubectl -n mysql-app describe pvc px-mysql-pvc | grep storage-class`{{execute}}


Q4:Run: `kubectl describe sc px-db-sc`{{execute}}
