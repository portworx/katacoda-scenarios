clear

echo -e "Please wait while we create some databases for this lab. It may take a few minutes..."
until [ `kubectl get ep | egrep '3306|27017' | wc -l` -eq 2 ] ; do
  printf '.'
  sleep 1
done
echo -e ""
clear
