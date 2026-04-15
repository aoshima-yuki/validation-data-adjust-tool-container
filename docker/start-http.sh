#!/bin/bash

PROP_FILE="/opt/nifi/nifi-current/conf/nifi.properties"

echo "=== Configure NiFi for HTTP mode ==="

# =========================================
# HTTPS / TLS 設定削除
# =========================================

sed -i '/^nifi.web.https.port=/d' "$PROP_FILE"
sed -i '/^nifi.web.https.host=/d' "$PROP_FILE"

sed -i '/^nifi.security.keystore=/d' "$PROP_FILE"
sed -i '/^nifi.security.keystoreType=/d' "$PROP_FILE"
sed -i '/^nifi.security.keystorePasswd=/d' "$PROP_FILE"
sed -i '/^nifi.security.keyPasswd=/d' "$PROP_FILE"
sed -i '/^nifi.security.truststore=/d' "$PROP_FILE"
sed -i '/^nifi.security.truststoreType=/d' "$PROP_FILE"
sed -i '/^nifi.security.truststorePasswd=/d' "$PROP_FILE"

# =========================================
# HTTP 設定（重複防止のため削除→追加）
# =========================================

sed -i '/^nifi.web.http.host=/d' "$PROP_FILE"
sed -i '/^nifi.web.http.port=/d' "$PROP_FILE"

echo "nifi.web.http.host=0.0.0.0" >> "$PROP_FILE"
echo "nifi.web.http.port=8080" >> "$PROP_FILE"

# =========================================
# 非TLSモード設定
# =========================================

sed -i '/^nifi.remote.input.secure=/d' "$PROP_FILE"
sed -i '/^nifi.cluster.protocol.is.secure=/d' "$PROP_FILE"

echo "nifi.remote.input.secure=false" >> "$PROP_FILE"
echo "nifi.cluster.protocol.is.secure=false" >> "$PROP_FILE"

# =========================================
# 起動
# =========================================

cd /opt/nifi/nifi-current

echo "=== Starting NiFi (HTTP mode) ==="

# ▼ HTTPモードで直接起動（今回の対応）
exec ./bin/nifi.sh run

# ▼ 元のNiFi標準起動（戻す場合はこちら）
# exec ../scripts/start.sh
