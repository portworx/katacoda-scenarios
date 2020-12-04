clear

echo -e "Please wait while the Lab is loading."
until [ `ps -ef|grep load-quiz.sh | grep -vi grep | wc -l` -eq 0 ] ; do
  printf '.'
  sleep 1
done
echo -e ""
clear
