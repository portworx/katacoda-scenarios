if [[ `kubectl get pods -l app=cassandra | grep cassandra-0 | grep Running | grep 1/1  ` ]]; then echo "done"; fi
