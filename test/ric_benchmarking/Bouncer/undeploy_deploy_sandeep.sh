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
sleep 5s
echo "Building docker image"
docker build -f Dockerfile -t 192.168.122.57:8082/oran-ric/bouncer_test:3.0.9 .
docker push 192.168.122.57:8082/oran-ric/bouncer_test:3.0.9
echo '{"config-file.json_url": "http://oran-near-rtric-bronze:9090/bouncer_latest_sandeep/config-file.json" }' > onboard.bouncer.url
curl --location --request POST "http://$(hostname):32080/onboard/api/v1/onboard/download"  --header 'Content-Type: application/json' --data-binary "@./onboard.bouncer.url"
curl --location --request GET "http://$(hostname):32080/onboard/api/v1/charts"
curl --location --request POST "http://$(hostname):32080/appmgr/ric/v1/xapps" --header 'Content-Type: application/json' --data-raw '{"xappName": "bouncer-xapp"}'
kubectl get pods -n ricxapp
docker images | grep bouncer
