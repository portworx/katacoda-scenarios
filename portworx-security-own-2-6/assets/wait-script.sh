clear

echo -e "Please wait while the Kubernetes cluster is Ready"
while [ ! -f /root/.kube/config ] ; do
  printf '.'
  sleep 1
done
echo -e ""
echo "Kubernetes Started!"
echo -e ""
echo -e "Installing Portworx with CSI. This can take some time, please be patient"
until [ `ps -ef|grep load-quiz.sh | grep -vi grep | wc -l` -eq 0 ] ; do
  printf '.'
  sleep 1
done
echo -e ""
clear
