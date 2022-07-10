#!/bin/sh
sleep 5s
echo "Building docker image"
docker build -f Dockerfile -t 192.168.122.57:8082/oran-ric/bouncer_test:3.0.9 .
docker push 192.168.122.57:8082/oran-ric/bouncer_test:3.0.9
echo '{"config-file.json_url": "http://oran-near-rtric-bronze:9090/bouncer_latest_sandeep/config-file.json" }' > onboard.bouncer.url
curl --location --request POST "http://$(hostname):32080/onboard/api/v1/onboard/download"  --header 'Content-Type: application/json' --data-binary "@./onboard.bouncer.url"
curl --location --request GET "http://$(hostname):32080/onboard/api/v1/charts"
curl --location --request POST "http://192.168.122.66:32080/appmgr/ric/v1/xapps" --header 'Content-Type: application/json' --data-raw '{"xappName": "bouncer-xapp"}'
kubectl get pods -n ricxapp
docker images | grep bouncer
