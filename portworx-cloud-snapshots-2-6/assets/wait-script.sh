clear

echo -e "Please wait while we install and configure Minio. It may take a few minutes..."
until [  `kubectl get ep | grep  px-minio | grep 9000 | wc -l` == 1 ] ; do
  printf '.'
  sleep 1
done
echo -e ""
echo "Minio Deployment Started!"
echo -e ""
echo -e "Installing the Minio Client and adding hosts"
until [ `ps -ef|grep load-quiz.sh | grep -vi grep | wc -l` -eq 0 ] ; do
  printf '.'
  sleep 1
done
echo -e ""
clear
