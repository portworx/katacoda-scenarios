ssh root@[[HOST_IP]] 'echo "Host *" >> /root/.ssh/config && echo "    StrictHostKeyChecking no" >> /root/.ssh/config && chmod 400 /root/.ssh/config'
git clone http://github.com/fmrtl73/katacoda-scenarios-1
cp katacoda-scenarios-1/px-kafka/assets/* .

./ingress.sh >> ingress.yaml
