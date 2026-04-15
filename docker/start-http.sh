#!/bin/bash

PROP_FILE="/opt/nifi/nifi-current/conf/nifi.properties"

# HTTPS/TLS関連を削除
sed -i '/^nifi.web.https.port=/d' "$PROP_FILE"
sed -i '/^nifi.web.https.host=/d' "$PROP_FILE"
sed -i '/^nifi.security.keystore=/d' "$PROP_FILE"
sed -i '/^nifi.security.keystoreType=/d' "$PROP_FILE"
sed -i '/^nifi.security.keystorePasswd=/d' "$PROP_FILE"
sed -i '/^nifi.security.keyPasswd=/d' "$PROP_FILE"
sed -i '/^nifi.security.truststore=/d' "$PROP_FILE"
sed -i '/^nifi.security.truststoreType=/d' "$PROP_FILE"
sed -i '/^nifi.security.truststorePasswd=/d' "$PROP_FILE"

# HTTP設定を入れ直し
sed -i '/^nifi.web.http.host=/d' "$PROP_FILE"
sed -i '/^nifi.web.http.port=/d' "$PROP_FILE"
echo "nifi.web.http.host=0.0.0.0" >> "$PROP_FILE"
echo "nifi.web.http.port=8080" >> "$PROP_FILE"

# 非TLS前提
sed -i '/^nifi.remote.input.secure=/d' "$PROP_FILE"
sed -i '/^nifi.cluster.protocol.is.secure=/d' "$PROP_FILE"
echo "nifi.remote.input.secure=false" >> "$PROP_FILE"
echo "nifi.cluster.protocol.is.secure=false" >> "$PROP_FILE"

cd /opt/nifi/nifi-current

# 元の start.sh は呼ばない
exec ./bin/nifi.sh run
