ssh root@[[HOST_IP]] 'echo "Host *" >> /root/.ssh/config && echo "    StrictHostKeyChecking no" >> /root/.ssh/config && chmod 400 /root/.ssh/config'

ssh root@node01 'docker pull portworx/px-enterprise:1.2.12.0'
ssh root@node02 'docker pull portworx/px-enterprise:1.2.12.0'
ssh root@node03 'docker pull portworx/px-enterprise:1.2.12.0'
#!/bin/bash -e

while true; do
    NUM_READY=`kubectl get nodes 2> /dev/null | grep -v NAME | awk '{print $2}' | grep -e ^Ready | wc -l`
    if [ "${NUM_READY}" == "4" ]; then
        echo "All ${NUM_READY} Kubernetes nodes are ready !"
        break
    else
        echo "Waiting for all Kubernetes nodes to be ready. Current ready nodes: ${NUM_READY}"
        kubectl get nodes
    fi
    sleep 5
done
