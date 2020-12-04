sleep 10s
echo "Please wait while we prepare the environment. This can take a few minutes..."
until [ `ps -ef|grep kc_init.sh | grep -vi grep | wc -l` -eq 0 ] ; do
    printf '.'
    sleep 1
done
ssh -o strictHostKeyChecking=no node01 ;
clear
