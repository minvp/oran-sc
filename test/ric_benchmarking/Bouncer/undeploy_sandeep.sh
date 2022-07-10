#! /bin/sh
docker images | grep bouncer
echo "Deleting bouncer container"
curl --location --request DELETE  "http://$(hostname):32080/appmgr/ric/v1/xapps/bouncer-xapp"
a=`docker images | grep bouncer | grep 3.0.9 | head -1 | awk -F "3.0.9" '{printf $2}' | sed 's/^ *//g' | awk -F " " '{printf $1}'`
echo "waiting for 40 seconds till bouncer container get terminated"
sleep 40s
echo "deleting bouncer image haiving id $a"
read -p "want to continue<y/n>?" inp
    case $inp in
        [Yy]* ) echo "continuing...";;
        [Nn]* ) echo "exiting..."; exit;;
        * ) echo "Please answer yes or no.";exit;
    esac
sudo docker image rm -f $a

