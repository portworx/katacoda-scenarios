#!/bin/bash
echo "Please wait while installing Lighthouse";until  [[ `docker ps -a | grep lighthouse | grep Up` ]];do  printf '.'; sleep 1; done
printf "\nLighthouse Installed!\n"
