#!/bin/bash

sed -i '/^nifi.web.https.port=/d' /opt/nifi/nifi-current/conf/nifi.properties
sed -i '/^nifi.web.https.host=/d' /opt/nifi/nifi-current/conf/nifi.properties

echo "nifi.web.http.host=0.0.0.0" >> /opt/nifi/nifi-current/conf/nifi.properties
echo "nifi.web.http.port=8080" >> /opt/nifi/nifi-current/conf/nifi.properties

cd /opt/nifi/nifi-current
exec ../scripts/start.sh
