#!/bin/bash

# HTTPS無効化
sed -i '/^nifi.web.https.port=/d' /opt/nifi/nifi-current/conf/nifi.properties
sed -i '/^nifi.web.https.host=/d' /opt/nifi/nifi-current/conf/nifi.properties

# HTTP設定
echo "nifi.web.http.host=0.0.0.0" >> /opt/nifi/nifi-current/conf/nifi.properties
echo "nifi.web.http.port=8080" >> /opt/nifi/nifi-current/conf/nifi.properties

# 元の起動スクリプト実行
/opt/nifi/scripts/start.sh
