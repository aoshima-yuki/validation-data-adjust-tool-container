#!/bin/bash

PROP_FILE="/opt/nifi/nifi-current/conf/nifi.properties"

# HTTPS設定を削除
sed -i '/^nifi.web.https.port=/d' "$PROP_FILE"
sed -i '/^nifi.web.https.host=/d' "$PROP_FILE"

# HTTP設定も一旦削除してから入れ直す
sed -i '/^nifi.web.http.host=/d' "$PROP_FILE"
sed -i '/^nifi.web.http.port=/d' "$PROP_FILE"

echo "nifi.web.http.host=0.0.0.0" >> "$PROP_FILE"
echo "nifi.web.http.port=8080" >> "$PROP_FILE"

cd /opt/nifi/nifi-current
exec ../scripts/start.sh
